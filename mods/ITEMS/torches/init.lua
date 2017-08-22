
--[[
	3d torch part
--]]

minetest.register_node("torches:torch", {
	description = "Torch",
	drawtype = "mesh",
	mesh = "torches_torch_floor.obj",
	inventory_image = "torches_torch_on_floor.png",
	wield_image = "torches_torch_on_floor.png",
	tiles = {{
		    name = "torches_torch_on_floor_animated.png",
		    animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.3}
	}},
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	liquids_pointable = false,
	light_source = 13,
	groups = {choppy=2, dig_immediate=3, flammable=1, attached_node=1, torch=1},
	drop = "torches:torch",
	selection_box = {
		type = "wallmounted",
		wall_bottom = {-1/8, -1/2, -1/8, 1/8, 2/16, 1/8},
	},
	sounds = core.node_sound_wood_defaults(),
	on_place = function(itemstack, placer, pointed_thing)
		local under = pointed_thing.under
		local node = minetest.get_node(under)
		local def = minetest.registered_nodes[node.name]
		if def and def.on_rightclick and
			((not placer) or (placer and not placer:get_player_control().sneak)) then
			return def.on_rightclick(under, node, placer, itemstack,
				pointed_thing) or itemstack
		end

		local above = pointed_thing.above
		local wdir = minetest.dir_to_wallmounted(vector.subtract(under, above))
		local fakestack = itemstack
		if wdir == 0 then
			fakestack:set_name("torches:torch_ceiling")
		elseif wdir == 1 then
			fakestack:set_name("torches:torch")
		else
			fakestack:set_name("torches:torch_wall")
		end

		itemstack = minetest.item_place(fakestack, placer, pointed_thing, wdir)
		itemstack:set_name("torches:torch")

		return itemstack
	end
})

minetest.register_node("torches:torch_wall", {
	drawtype = "mesh",
	mesh = "torches_torch_wall.obj",
	tiles = {{
		    name = "torches_torch_on_floor_animated.png",
		    animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.3}
	}},
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	light_source = 13,
	groups = {choppy=2, dig_immediate=3, flammable=1, not_in_creative_inventory=1, attached_node=1, torch=1},
	drop = "torches:torch",
	selection_box = {
		type = "wallmounted",
		wall_side = {-1/2, -1/2, -1/8, -1/8, 1/8, 1/8},
	},
	sounds = core.node_sound_wood_defaults(),
})

minetest.register_node("torches:torch_ceiling", {
	drawtype = "mesh",
	mesh = "torches_torch_ceiling.obj",
	tiles = {{
		    name = "torches_torch_on_floor_animated.png",
		    animation = {type = "vertical_frames", aspect_w = 16, aspect_h = 16, length = 3.3}
	}},
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	light_source = 13,
	groups = {choppy=2, dig_immediate=3, flammable=1, not_in_creative_inventory=1, attached_node=1, torch=1},
	drop = "torches:torch",
	selection_box = {
		type = "wallmounted",
		wall_top = {-1/8, -1/16, -5/16, 1/8, 1/2, 1/8},
	},
	sounds = core.node_sound_wood_defaults(),
})


minetest.register_craft({
	output = 'torches:torch 4',
	recipe = {
		{'core:coal_lump'},
		{'group:stick'},
	}
})


--[[
	torch wield light
--]]

if not minetest.is_yes(minetest.setting_get("torches_wieldlight_enable") or true) then
	return
end
local torchlight_update_interval = minetest.setting_get("torches_wieldlight_interval") or 0.25

minetest.register_node("torches:torchlight", {
	drawtype = "airlike",
	groups = {not_in_creative_inventory = 1},
	walkable = false,
	paramtype = "light",
	sunlight_propagates = true,
	light_source = 11,
	pointable = false,
	buildable_to = true,
	drops = {},
})

-- state tables
local torchlight = {}
local playerlist = {}

local function wields_torch(player)
	if not player then
		return false
	end
	local item = player:get_wielded_item()
	if not item then
		return false
	end
	return item:get_name() == "torches:torch"
end

local function wielded_torch(name)
	if not torchlight[name] then
		return false
	end
	return true
end

local function is_torchlight(pos)
	local node = minetest.get_node(pos)
	return node.name == "torches:torchlight"
end

local function remove_torchlight(pos)
	if is_torchlight(pos) then
		minetest.swap_node(pos, {name = "air"})
	end
end

local function place_torchlight(pos)
	local name = minetest.get_node(pos).name
	if name == "torches:torchlight" then
		return true
	end
	if (minetest.get_node_light(pos) or 0) > 11 then
		-- no reason to place torch here, so save a bunch
		-- of node updates this way
		return false
	end
	if name == "air" then
		minetest.swap_node(pos, {name = "torches:torchlight"})
		return true
	end
	return false
end

local function get_torchpos(player)
	return vector.add({x = 0, y = 1, z = 0}, vector.round(player:getpos()))
end

minetest.register_on_joinplayer(function(player)
	local name = player:get_player_name()
	playerlist[name] = true
end)

minetest.register_on_leaveplayer(function(player)
	local name = player:get_player_name()
	-- don't look at wielded() here, it's likely invalid
	if torchlight[name] then
		remove_torchlight(torchlight[name])
		torchlight[name] = nil
	end
	playerlist[name] = nil
end)

minetest.register_on_shutdown(function()
	for i, _ in pairs(torchlight) do
		remove_torchlight(torchlight[i])
	end
end)

local function update_torchlight(dtime)
	for name, _ in pairs(playerlist) do
		local player = minetest.get_player_by_name(name)
		local wielded = wielded_torch(name)
		local wields = wields_torch(player)

		if not wielded and wields then
			local torchpos = get_torchpos(player)
			if place_torchlight(torchpos) then
				torchlight[name] = vector.new(torchpos)
			end
		elseif wielded and not wields then
			remove_torchlight(torchlight[name])
			torchlight[name] = nil
		elseif wielded and wields then
			local torchpos = get_torchpos(player)
			if not vector.equals(torchpos, torchlight[name]) or
					not is_torchlight(torchpos) then
				if place_torchlight(torchpos) then
					remove_torchlight(torchlight[name])
					torchlight[name] = vector.new(torchpos)
				elseif vector.distance(torchlight[name], torchpos) > 2 then
					-- player went into some node
					remove_torchlight(torchlight[name])
					torchlight[name] = nil
				end
			end
		end
	end
	minetest.after(torchlight_update_interval, update_torchlight)
end

minetest.after(torchlight_update_interval, update_torchlight)

