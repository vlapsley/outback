--[[
	Base functions
--]]


-- Push an element onto a stack (table).
function base.push(t, x)
	t[#t+1] = x
end


--
-- Lavacooling
--

base.cool_lava = function(pos, node)
	if node.name == "base:lava_source" then
		minetest.set_node(pos, {name = "base:obsidian"})
	else -- Lava flowing
		minetest.set_node(pos, {name = "base:stone"})
	end
	minetest.sound_play("base_cool_lava",
		{pos = pos, max_hear_distance = 16, gain = 0.25})
end

if minetest.settings:get_bool("enable_lavacooling") ~= false then
	minetest.register_abm({
		label = "Lava cooling",
		nodenames = {"base:lava_source", "base:lava_flowing"},
		neighbors = {"group:cools_lava", "group:water"},
		interval = 1,
		chance = 2,
		catch_up = false,
		action = base.cool_lava,
	})
end

--
-- optimized helper to put all items in an inventory into a drops list
--

function base.get_inventory_drops(pos, inventory, drops)
	local inv = minetest.get_meta(pos):get_inventory()
	local n = #drops
	for i = 1, inv:get_size(inventory) do
		local stack = inv:get_stack(inventory, i)
		if stack:get_count() > 0 then
			drops[n+1] = stack:to_table()
			n = n + 1
		end
	end
end

--
-- Papyrus and cactus growing
--

-- wrapping the functions in abm action is necessary to make overriding them possible

function base.grow_cactus(pos, node)
	if node.param2 >= 4 then
		return
	end
	pos.y = pos.y - 1
	if minetest.get_item_group(minetest.get_node(pos).name, "sand") == 0 then
		return
	end
	pos.y = pos.y + 1
	local height = 0
	while node.name == "base:cactus" and height < 4 do
		height = height + 1
		pos.y = pos.y + 1
		node = minetest.get_node(pos)
	end
	if height == 4 or node.name ~= "air" then
		return
	end
	if minetest.get_node_light(pos) < 13 then
		return
	end
	minetest.set_node(pos, {name = "base:cactus"})
	return true
end

function base.grow_papyrus(pos, node)
	pos.y = pos.y - 1
	local name = minetest.get_node(pos).name
	if name ~= "base:dirt_with_grass" and name ~= "base:dirt" then
		return
	end
	if not minetest.find_node_near(pos, 3, {"group:water"}) then
		return
	end
	pos.y = pos.y + 1
	local height = 0
	while node.name == "base:papyrus" and height < 4 do
		height = height + 1
		pos.y = pos.y + 1
		node = minetest.get_node(pos)
	end
	if height == 4 or node.name ~= "air" then
		return
	end
	if minetest.get_node_light(pos) < 13 then
		return
	end
	minetest.set_node(pos, {name = "base:papyrus"})
	return true
end

minetest.register_abm({
	label = "Grow cactus",
	nodenames = {"base:cactus"},
	neighbors = {"group:sand"},
	interval = 12,
	chance = 83,
	action = base.grow_cactus
})

minetest.register_abm({
	label = "Grow papyrus",
	nodenames = {"base:papyrus"},
	neighbors = {"base:dirt", "base:dirt_with_grass"},
	interval = 14,
	chance = 71,
	action = base.grow_papyrus
})


--
-- dig upwards
--

function base.dig_up(pos, node, digger)
	if digger == nil then return end
	local np = {x = pos.x, y = pos.y + 1, z = pos.z}
	local nn = minetest.get_node(np)
	if nn.name == node.name then
		minetest.node_dig(np, nn, digger)
	end
end


--
-- Leafdecay
--

-- Prevent decay of placed leaves

base.after_place_leaves = function(pos, placer, itemstack, pointed_thing)
	if placer and not placer:get_player_control().sneak then
		local node = minetest.get_node(pos)
		node.param2 = 1
		minetest.set_node(pos, node)
	end
end

-- Leafdecay
local function leafdecay_after_destruct(pos, oldnode, def)
	for _, v in pairs(minetest.find_nodes_in_area(vector.subtract(pos, def.radius),
			vector.add(pos, def.radius), def.leaves)) do
		local node = minetest.get_node(v)
		local timer = minetest.get_node_timer(v)
		if node.param2 == 0 and not timer:is_started() then
			timer:start(math.random(20, 120) / 10)
		end
	end
end

local function leafdecay_on_timer(pos, def)
	if minetest.find_node_near(pos, def.radius, def.trunks) then
		return false
	end

	local node = minetest.get_node(pos)
	local drops = minetest.get_node_drops(node.name)
	for _, item in ipairs(drops) do
		local is_leaf
		for _, v in pairs(def.leaves) do
			if v == item then
				is_leaf = true
			end
		end
		if minetest.get_item_group(item, "leafdecay_drop") ~= 0 or
				not is_leaf then
			minetest.add_item({
				x = pos.x - 0.5 + math.random(),
				y = pos.y - 0.5 + math.random(),
				z = pos.z - 0.5 + math.random(),
			}, item)
		end
	end

	minetest.remove_node(pos)
	minetest.check_for_falling(pos)
end

function base.register_leafdecay(def)
	assert(def.leaves)
	assert(def.trunks)
	assert(def.radius)
	for _, v in pairs(def.trunks) do
		minetest.override_item(v, {
			after_destruct = function(pos, oldnode)
				leafdecay_after_destruct(pos, oldnode, def)
			end,
		})
	end
	for _, v in pairs(def.leaves) do
		minetest.override_item(v, {
			on_timer = function(pos)
				leafdecay_on_timer(pos, def)
			end,
		})
	end
end

--
-- Convert dirt to something that fits the environment
--

minetest.register_abm({
	label = "Grass spread",
	nodenames = {"base:dirt"},
	neighbors = {
		"air",
		"group:grass",
		"group:dry_grass",
		"base:snow",
	},
	interval = 6,
	chance = 50,
	catch_up = false,
	action = function(pos, node)
		-- Check for darkness: night, shadow or under a light-blocking node
		-- Returns if ignore above
		local above = {x = pos.x, y = pos.y + 1, z = pos.z}
		if (minetest.get_node_light(above) or 0) < 13 then
			return
		end

		-- Look for spreading dirt-type neighbours
		local p2 = minetest.find_node_near(pos, 1, "group:spreading_dirt_type")
		if p2 then
			local n3 = minetest.get_node(p2)
			minetest.set_node(pos, {name = n3.name})
			return
		end

		-- Else, any seeding nodes on top?
		local name = minetest.get_node(above).name
		-- Snow check is cheapest, so comes first
		if name == "base:snow" then
			minetest.set_node(pos, {name = "base:dirt_with_snow"})
		-- Most likely case first
		elseif minetest.get_item_group(name, "grass") ~= 0 then
			minetest.set_node(pos, {name = "base:dirt_with_grass"})
		elseif minetest.get_item_group(name, "dry_grass") ~= 0 then
			minetest.set_node(pos, {name = "base:dirt_with_dry_grass"})
		end
	end
})


--
-- Grass and dry grass removed in darkness
--

minetest.register_abm({
	label = "Grass covered",
	nodenames = {"group:spreading_dirt_type"},
	interval = 8,
	chance = 50,
	catch_up = false,
	action = function(pos, node)
		local above = {x = pos.x, y = pos.y + 1, z = pos.z}
		local name = minetest.get_node(above).name
		local nodedef = minetest.registered_nodes[name]
		if name ~= "ignore" and nodedef and not ((nodedef.sunlight_propagates or
				nodedef.paramtype == "light") and
				nodedef.liquidtype == "none") then
			minetest.set_node(pos, {name = "base:dirt"})
		end
	end
})


--
-- Moss growth on cobble near water
--

minetest.register_abm({
	label = "Moss growth",
	nodenames = {"base:cobble", "stairs:slab_cobble", "stairs:stair_cobble", "walls:cobble"},
	neighbors = {"group:water"},
	interval = 16,
	chance = 200,
	catch_up = false,
	action = function(pos, node)
		if node.name == "base:cobble" then
			minetest.set_node(pos, {name = "base:mossycobble"})
		elseif node.name == "stairs:slab_cobble" then
			minetest.set_node(pos, {name = "stairs:slab_mossycobble", param2 = node.param2})
		elseif node.name == "stairs:stair_cobble" then
			minetest.set_node(pos, {name = "stairs:stair_mossycobble", param2 = node.param2})
		elseif node.name == "walls:cobble" then
			minetest.set_node(pos, {name = "walls:mossycobble", param2 = node.param2})
		end
	end
})


--
-- Checks if specified volume intersects a protected volume
--

function base.intersects_protection(minp, maxp, player_name, interval)
	-- 'interval' is the largest allowed interval for the 3D lattice of checks

	-- Compute the optimal float step 'd' for each axis so that all corners and
	-- borders are checked. 'd' will be smaller or equal to 'interval'.
	-- Subtracting 1e-4 ensures that the max co-ordinate will be reached by the
	-- for loop (which might otherwise not be the case due to rounding errors).
	local d = {}
	for _, c in pairs({"x", "y", "z"}) do
		if maxp[c] > minp[c] then
			d[c] = (maxp[c] - minp[c]) / math.ceil((maxp[c] - minp[c]) / interval) - 1e-4
		elseif maxp[c] == minp[c] then
			d[c] = 1 -- Any value larger than 0 to avoid division by zero
		else -- maxp[c] < minp[c], print error and treat as protection intersected
			minetest.log("error", "maxp < minp in 'base.intersects_protection()'")
			return true
		end
	end

	for zf = minp.z, maxp.z, d.z do
		local z = math.floor(zf + 0.5)
		for yf = minp.y, maxp.y, d.y do
			local y = math.floor(yf + 0.5)
			for xf = minp.x, maxp.x, d.x do
				local x = math.floor(xf + 0.5)
				if minetest.is_protected({x = x, y = y, z = z}, player_name) then
					return true
				end
			end
		end
	end

	return false
end


--
-- NOTICE: This method is not an official part of the API yet!
-- This method may change in future.
--

function base.can_interact_with_node(player, pos)
	if player then
		if minetest.check_player_privs(player, "protection_bypass") then
			return true
		end
	else
		return false
	end

	local meta = minetest.get_meta(pos)
	local owner = meta:get_string("owner")

	if not owner or owner == "" or owner == player:get_player_name() then
		return true
	end

	-- is player wielding the right key?
	local item = player:get_wielded_item()
	if item:get_name() == "base:key" then
		local key_meta = item:get_meta()

		if key_meta:get_string("secret") == "" then
			local key_oldmeta = item:get_metadata()
			if key_oldmeta == "" or not minetest.parse_json(key_oldmeta) then
				return false
			end

			key_meta:set_string("secret", minetest.parse_json(key_oldmeta).secret)
			item:set_metadata("")
		end

		return meta:get_string("key_lock_secret") == key_meta:get_string("secret")
	end

	return false
end

