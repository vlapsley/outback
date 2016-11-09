-----------------------------------------------------------------------------------------------
local title		= "Wine"
local version 	= "0.5"
local mname		= "wine"
-----------------------------------------------------------------------------------------------

-- Intllib
local S
if minetest.get_modpath("intllib") then
	S = intllib.Getter()
else
	S = function(s, a, ...)
		if a == nil then
			return s
		end
		a = {a, ...}
		return s:gsub("(@?)@(%(?)(%d+)(%)?)",
			function(e, o, n, c)
				if e == ""then
					return a[tonumber(n)] .. (o == "" and c or "")
				else
					return "@" .. o .. n .. c
				end
			end)
	end
end

-- glass of wine
minetest.register_node("wine:glass_wine", {
	description = S("Glass of Wine"),
	drawtype = "plantlike",
	visual_scale = 0.8,
	tiles = {"wine_glass.png"},
	inventory_image = "wine_glass.png",
	wield_image = "wine_glass.png",
	paramtype = "light",
	is_ground_content = false,
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, 0.3, 0.2}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
	on_use = minetest.item_eat(2),
})

-- bottle of wine
minetest.register_node("wine:bottle_wine", {
	description = S("Bottle of Wine"),
	drawtype = "plantlike",
	tiles = {"wine_bottle.png"},
	inventory_image = "wine_bottle.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = { -0.15, -0.5, -0.15, 0.15, 0.25, 0.15 }
	},
	groups = {dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_defaults(),
})

minetest.register_craft({
	output = "wine:bottle_wine",
	recipe = {
		{"wine:glass_wine", "wine:glass_wine", "wine:glass_wine"},
		{"wine:glass_wine", "wine:glass_wine", "wine:glass_wine"},
		{"wine:glass_wine", "wine:glass_wine", "wine:glass_wine"},
	},
})

minetest.register_craft({
	type = "shapeless",
	output = "wine:glass_wine 9",
	recipe = {"wine:bottle_wine"},
})

-- glass of beer (thanks to RiverKpocc @ deviantart.com for image)
minetest.register_node("wine:glass_beer", {
	description = S("Beer"),
	drawtype = "torchlike", --"plantlike",
	visual_scale = 0.8,
	tiles = {"wine_beer_glass.png"},
	inventory_image = "wine_beer_glass.png",
	wield_image = "wine_beer_glass.png",
	paramtype = "light",
	is_ground_content = false,
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, 0.3, 0.2}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
	on_use = minetest.item_eat(2),
})

-- glass of honey mead
minetest.register_node("wine:glass_mead", {
	description = S("Honey-Mead"),
	drawtype = "plantlike",
	visual_scale = 0.8,
	tiles = {"wine_mead_glass.png"},
	inventory_image = "wine_mead_glass.png",
	wield_image = "wine_mead_glass.png",
	paramtype = "light",
	is_ground_content = false,
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, 0.3, 0.2}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
	on_use = minetest.item_eat(1),
})

-- glass of apple cider
minetest.register_node("wine:glass_cider", {
	description = S("Apple Cider"),
	drawtype = "plantlike",
	visual_scale = 0.8,
	tiles = {"wine_cider_glass.png"},
	inventory_image = "wine_cider_glass.png",
	wield_image = "wine_cider_glass.png",
	paramtype = "light",
	is_ground_content = false,
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, 0.3, 0.2}
	},
	groups = {vessel = 1, dig_immediate = 3, attached_node = 1},
	sounds = default.node_sound_glass_defaults(),
	on_use = minetest.item_eat(2),
})

-- Wine barrel
winebarrel_formspec = "size[8,9]"
	.. default.gui_bg..default.gui_bg_img..default.gui_slots
	.. "list[current_name;src;2,1;1,1;]"
	.. "list[current_name;dst;5,1;2,2;]"
	.. "list[current_player;main;0,5;8,4;]"
	.. "listring[current_name;dst]"
	.. "listring[current_player;main]"
	.. "listring[current_name;src]"
	.. "listring[current_player;main]"

minetest.register_node("wine:wine_barrel", {
	description = S("Fermenting Barrel"),
	tiles = {"wine_barrel.png" },
	drawtype = "mesh",
	mesh = "wine_barrel.obj",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {choppy = 2, oddly_breakable_by_hand = 1},
	legacy_facedir_simple = true,

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", winebarrel_formspec)
		meta:set_string("infotext", S("Fermenting Barrel"))
		meta:set_float("status", 0.0)
		local inv = meta:get_inventory()
		inv:set_size("src", 1)
		inv:set_size("dst", 4)
	end,

	can_dig = function(pos,player)

		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()

		if not inv:is_empty("dst")
		or not inv:is_empty("src") then
			return false
		end

		return true
	end,

	allow_metadata_inventory_take = function(pos, listname, index, stack, player)

		if minetest.is_protected(pos, player:get_player_name()) then
			return 0
		end

		return stack:get_count()

	end,

	allow_metadata_inventory_put = function(pos, listname, index, stack, player)

		if minetest.is_protected(pos, player:get_player_name()) then
			return 0
		end

		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()

		if listname == "src" then
			return stack:get_count()
		elseif listname == "dst" then
			return 0
		end
	end,

	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)

		if minetest.is_protected(pos, player:get_player_name()) then
			return 0
		end

		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		local stack = inv:get_stack(from_list, from_index)

		if to_list == "src" then
			return count
		elseif to_list == "dst" then
			return 0
		end
	end,
})

minetest.register_craft({
	output = "wine:wine_barrel",
	recipe = {
		{"group:wood", "group:wood", "group:wood"},
		{"default:steel_ingot", "", "default:steel_ingot"},
		{"group:wood", "group:wood", "group:wood"},
	},
})

-- Wine barrel abm
minetest.register_abm({
	label = "Barrel fermentation",
	nodenames = {"wine:wine_barrel"},
	interval = 5,
	chance = 1,
	catch_up = false,

	action = function(pos, node)

		local meta = minetest.get_meta(pos) ; if not meta then return end
		local inv = meta:get_inventory()

		-- is barrel empty?
		if not inv or inv:is_empty("src") then
			return
		end

		-- does it contain grapes or barley?
		if not inv:contains_item("src", ItemStack("farming:grapes"))
		and not inv:contains_item("src", ItemStack("farming:barley"))
		and not inv:contains_item("src", ItemStack("default:apple"))
		and not inv:contains_item("src", ItemStack("mobs:honey")) then
			return
		end

		-- is barrel full
		if not inv:room_for_item("dst", "wine:glass_wine")
		or not inv:room_for_item("dst", "wine:glass_beer")
		or not inv:room_for_item("dst", "wine:glass_cider")
		or not inv:room_for_item("dst", "wine:glass_mead") then
			meta:set_string("infotext", S("Fermenting Barrel (FULL)"))
			return
		end

		-- do we have any grapes to ferment?
		if not inv:is_empty("src") then

			local status = meta:get_float("status")

			-- fermenting (change status)
			if status < 100 then
				meta:set_string("infotext", S("Fermenting Barrel (@1% Done)", status))
				meta:set_float("status", status + 5)

			else

				if inv:contains_item("src", "farming:grapes") then

					--fermented (take grapes and add glass of wine)
					inv:remove_item("src", "farming:grapes")
					inv:add_item("dst", "wine:glass_wine")
					meta:set_float("status", 0.0)

				elseif inv:contains_item("src", "farming:barley") then

					--fermented (take barley and add glass of beer)
					inv:remove_item("src", "farming:barley")
					inv:add_item("dst", "wine:glass_beer")
					meta:set_float("status", 0.0)

				elseif inv:contains_item("src", "mobs:honey") then

					--fermented (take honey and add glass of mead)
					inv:remove_item("src", "mobs:honey")
					inv:add_item("dst", "wine:glass_mead")
					meta:set_float("status", 0.0)

				elseif inv:contains_item("src", "default:apple") then

					--fermented (take apple and add glass of cider)
					inv:remove_item("src", "default:apple")
					inv:add_item("dst", "wine:glass_cider")
					meta:set_float("status", 0.0)
				end

				if inv:is_empty("src") then
					meta:set_float("status", 0.0)
					meta:set_string("infotext", S("Fermenting Barrel"))
				end

			end
		else
			meta:set_string("infotext", S("Fermenting Barrel"))
		end
	end,
})

-----------------------------------------------------------------------------------------------
minetest.log("MOD: "..title.." ["..version.."] ["..mname.."] loaded...")
-----------------------------------------------------------------------------------------------
