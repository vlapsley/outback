--[[
	Chests
--]]

chests = {}

local function get_chest_formspec(pos)
	local spos = pos.x .. "," .. pos.y .. "," .. pos.z
	local formspec =
		"size[8,9]" ..
		init.gui_bg ..
		init.gui_bg_img ..
		init.gui_slots ..
		"list[nodemeta:" .. spos .. ";main;0,0.3;8,4;]" ..
		"list[current_player;main;0,4.85;8,1;]" ..
		"list[current_player;main;0,6.08;8,3;8]" ..
		"listring[nodemeta:" .. spos .. ";main]" ..
		"listring[current_player;main]" ..
		init.get_hotbar_bg(0,4.85)
	return formspec
end

local function chest_lid_obstructed(pos)
	local above = { x = pos.x, y = pos.y + 1, z = pos.z }
	local def = minetest.registered_nodes[minetest.get_node(above).name]
	-- allow ladders, signs, wallmounted things and torches to not obstruct
	if def.drawtype == "airlike" or
			def.drawtype == "signlike" or
			def.drawtype == "torchlike" or
			(def.drawtype == "nodebox" and def.paramtype2 == "wallmounted") then
		return false
	end
	return true
end

local open_chests = {}

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname ~= "chests:chest" then
		return
	end
	if not player or not fields.quit then
		return
	end
	local pn = player:get_player_name()

	if not open_chests[pn] then
		return
	end

	local pos = open_chests[pn].pos
	local sound = open_chests[pn].sound
	local swap = open_chests[pn].swap
	local node = minetest.get_node(pos)

	open_chests[pn] = nil
	for k, v in pairs(open_chests) do
		if v.pos.x == pos.x and v.pos.y == pos.y and v.pos.z == pos.z then
			return true
		end
	end
	minetest.after(0.2, minetest.swap_node, pos, { name = "chests:" .. swap,
			param2 = node.param2 })
	minetest.sound_play(sound, {gain = 0.3, pos = pos, max_hear_distance = 10})
	return true
end)

function chests.register_chest(name, d)
	local def = table.copy(d)
	def.drawtype = "mesh"
	def.visual = "mesh"
	def.paramtype = "light"
	def.paramtype2 = "facedir"
	def.legacy_facedir_simple = true
	def.is_ground_content = false

	if def.protected then
		def.on_construct = function(pos)
			local meta = minetest.get_meta(pos)
			meta:set_string("infotext", "Locked Chest")
			meta:set_string("owner", "")
			local inv = meta:get_inventory()
			inv:set_size("main", 8*4)
		end
		def.after_place_node = function(pos, placer)
			local meta = minetest.get_meta(pos)
			meta:set_string("owner", placer:get_player_name() or "")
			meta:set_string("infotext", "Locked Chest (owned by " ..
					meta:get_string("owner") .. ")")
		end
		def.can_dig = function(pos,player)
			local meta = minetest.get_meta(pos);
			local inv = meta:get_inventory()
			return inv:is_empty("main") and
					default.can_interact_with_node(player, pos)
		end
		def.allow_metadata_inventory_move = function(pos, from_list, from_index,
				to_list, to_index, count, player)
			if not default.can_interact_with_node(player, pos) then
				return 0
			end
			return count
		end
		def.allow_metadata_inventory_put = function(pos, listname, index, stack, player)
			if not default.can_interact_with_node(player, pos) then
				return 0
			end
			return stack:get_count()
		end
		def.allow_metadata_inventory_take = function(pos, listname, index, stack, player)
			if not default.can_interact_with_node(player, pos) then
				return 0
			end
			return stack:get_count()
		end
		def.on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
			if not default.can_interact_with_node(clicker, pos) then
				return itemstack
			end

			minetest.sound_play(def.sound_open, {gain = 0.3,
					pos = pos, max_hear_distance = 10})
			if not chest_lid_obstructed(pos) then
				minetest.swap_node(pos,
						{ name = "chests:" .. name .. "_open",
						param2 = node.param2 })
			end
			minetest.after(0.2, minetest.show_formspec,
					clicker:get_player_name(),
					"chests:chest", get_chest_formspec(pos))
			open_chests[clicker:get_player_name()] = { pos = pos,
					sound = def.sound_close, swap = name }
		end
		def.on_blast = function() end
		def.on_key_use = function(pos, player)
			local secret = minetest.get_meta(pos):get_string("key_lock_secret")
			local itemstack = player:get_wielded_item()
			local key_meta = itemstack:get_meta()

			if key_meta:get_string("secret") == "" then
				key_meta:set_string("secret", minetest.parse_json(itemstack:get_metadata()).secret)
				itemstack:set_metadata("")
			end

			if secret ~= key_meta:get_string("secret") then
				return
			end

			minetest.show_formspec(
				player:get_player_name(),
				"chests:chest_locked",
				get_chest_formspec(pos)
			)
		end
		def.on_skeleton_key_use = function(pos, player, newsecret)
			local meta = minetest.get_meta(pos)
			local owner = meta:get_string("owner")
			local pn = player:get_player_name()

			-- verify placer is owner of lockable chest
			if owner ~= pn then
				minetest.record_protection_violation(pos, pn)
				minetest.chat_send_player(pn, "You do not own this chest.")
				return nil
			end

			local secret = meta:get_string("key_lock_secret")
			if secret == "" then
				secret = newsecret
				meta:set_string("key_lock_secret", secret)
			end

			return secret, "a locked chest", owner
		end
	else
		def.on_construct = function(pos)
			local meta = minetest.get_meta(pos)
			meta:set_string("infotext", "Chest")
			local inv = meta:get_inventory()
			inv:set_size("main", 8*4)
		end
		def.can_dig = function(pos,player)
			local meta = minetest.get_meta(pos);
			local inv = meta:get_inventory()
			return inv:is_empty("main")
		end
		def.on_rightclick = function(pos, node, clicker)
			minetest.sound_play(def.sound_open, {gain = 0.3, pos = pos,
					max_hear_distance = 10})
			if not chest_lid_obstructed(pos) then
				minetest.swap_node(pos, {
						name = "chests:" .. name .. "_open",
						param2 = node.param2 })
			end
			minetest.after(0.2, minetest.show_formspec,
					clicker:get_player_name(),
					"chests:chest", get_chest_formspec(pos))
			open_chests[clicker:get_player_name()] = { pos = pos,
					sound = def.sound_close, swap = name }
		end
	end

	def.on_metadata_inventory_move = function(pos, from_list, from_index,
			to_list, to_index, count, player)
		minetest.log("action", player:get_player_name() ..
			" moves stuff in chest at " .. minetest.pos_to_string(pos))
	end
	def.on_metadata_inventory_put = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			" moves " .. stack:get_name() ..
			" to chest at " .. minetest.pos_to_string(pos))
	end
	def.on_metadata_inventory_take = function(pos, listname, index, stack, player)
		minetest.log("action", player:get_player_name() ..
			" takes " .. stack:get_name() ..
			" from chest at " .. minetest.pos_to_string(pos))
	end
	def.on_blast = function(pos)
		local drops = {}
		inventory.get_inventory_drops(pos, "main", drops)
		drops[#drops+1] = "chests:chest"
		minetest.remove_node(pos)
		return drops
	end

	local def_opened = table.copy(def)
	local def_closed = table.copy(def)

	def_opened.mesh = "chest_open.obj"
	def_opened.drop = "chests:" .. name
	def_opened.groups.not_in_creative_inventory = 1
	def_opened.selection_box = {
		type = "fixed",
		fixed = { -1/2, -1/2, -1/2, 1/2, 3/16, 1/2 },
		}
	def_opened.can_dig = function()
		return false
	end

	def_closed.mesh = nil
	def_closed.drawtype = nil
	def_closed.tiles[6] = def.tiles[5] -- swap textures around for "normal"
	def_closed.tiles[5] = def.tiles[3] -- drawtype to make them match the mesh
	def_closed.tiles[3] = def.tiles[3].."^[transformFX"

	minetest.register_node("chests:" .. name, def_closed)
	minetest.register_node("chests:" .. name .. "_open", def_opened)
end


chests.register_chest("chest", {
	description = "Chest",
	tiles = {
		"chests_chest_top.png",
		"chests_chest_top.png",
		"chests_chest_side.png",
		"chests_chest_side.png",
		"chests_chest_front.png",
		"chests_chest_inside.png"
	},
	sounds = default.node_sound_wood_defaults(),
	sound_open = "chests_chest_open",
	sound_close = "chests_chest_close",
	groups = {choppy = 2, oddly_breakable_by_hand = 2},
})

chests.register_chest("chest_locked", {
	description = "Locked Chest",
	tiles = {
		"chests_chest_top.png",
		"chests_chest_top.png",
		"chests_chest_side.png",
		"chests_chest_side.png",
		"chests_chest_lock.png",
		"chests_chest_inside.png"
	},
	sounds = default.node_sound_wood_defaults(),
	sound_open = "chests_chest_open",
	sound_close = "chests_chest_close",
	groups = {choppy = 2, oddly_breakable_by_hand = 2},
	protected = true,
})


minetest.register_craft({
	output = 'chests:chest',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'group:wood', '', 'group:wood'},
		{'group:wood', 'group:wood', 'group:wood'},
	}
})

minetest.register_craft({
	output = 'chests:chest_locked',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'group:wood', 'default:steel_ingot', 'group:wood'},
		{'group:wood', 'group:wood', 'group:wood'},
	}
})

minetest.register_craft( {
	type = "shapeless",
	output = "chests:chest_locked",
	recipe = {"chests:chest", "default:steel_ingot"},
})

minetest.register_craft({
	type = "fuel",
	recipe = "chests:chest",
	burntime = 30,
})

minetest.register_craft({
	type = "fuel",
	recipe = "chests:chest_locked",
	burntime = 30,
})

