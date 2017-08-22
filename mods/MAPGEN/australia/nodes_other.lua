-- mods/australia_modpack/australia/nodes_other.lua

minetest.register_node("australia:red_stone", {
	description = "Red Stone",
	tiles = {"aus_red_stone.png"},
	groups = {cracky = 3, stone = 1},
	drop = "australia:red_cobble",
	sounds = core.node_sound_stone_defaults(),
})

minetest.register_node("australia:red_cobble", {
	description = "Red Cobblestone",
	tiles = {"aus_red_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 3, stone = 2},
	sounds = core.node_sound_stone_defaults(),
})

minetest.register_node("australia:red_stonebrick", {
	description = "Red Stone Brick",
	tiles = {"aus_red_stonebrick.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 1},
	sounds = core.node_sound_stone_defaults(),
})

minetest.register_node("australia:sandstone_cobble", {
	description = "Sandstone Cobble",
	tiles = {"aus_sandstone_cobble.png"},
	groups = {crumbly = 1, cracky = 3, oddly_breakable_by_hand = 1},
	sounds = core.node_sound_stone_defaults(),
})

minetest.register_node("australia:bluestone", {
	description = "Bluestone (Basalt)",
	tiles = {"aus_bluestone.png"},
	groups = {cracky = 2, stone = 1},
	drop = "australia:bluestone_cobble",
	sounds = core.node_sound_stone_defaults(),
})

minetest.register_node("australia:bluestone_cobble", {
	description = "Bluestone (Basalt) Cobble",
	tiles = {"aus_bluestone_cobble.png"},
	is_ground_content = false,
	groups = {cracky = 2, stone = 2},
	sounds = core.node_sound_stone_defaults(),
})

minetest.register_node("australia:bluestone_brick", {
	description = "Bluestone Brick",
	tiles = {"aus_bluestone_brick.png"},
	is_ground_content = false,
	groups = {cracky = 1, stone = 1},
	sounds = core.node_sound_stone_defaults(),
})

minetest.register_node("australia:red_dirt", {
	description = "Red Dirt",
	tiles = {"aus_red_dirt.png"},
	groups = {crumbly = 3,soil = 1},
	sounds = core.node_sound_dirt_defaults(),
})

minetest.register_node("australia:red_sand", {
	description = "Red Sand",
	tiles = {"aus_red_sand.png"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	sounds = core.node_sound_sand_defaults(),
})

minetest.register_node("australia:red_gravel", {
	description = "Red Gravel",
	tiles = {"aus_red_gravel.png"},
	groups = {crumbly = 2, falling_node = 1},
	sounds = core.node_sound_dirt_defaults({
		footstep = {name = "core_gravel_footstep", gain = 0.5},
		dug = {name = "core_gravel_footstep", gain = 1.0},
	}),
})

minetest.register_node("australia:mangrove_mud", {
	description = "Mangrove Mud",
	tiles = {"aus_mangrove_mud.png"},
	liquid_viscosity = 5,
	groups = {crumbly = 2, soil = 1, disable_jump = 1},
	sounds = core.node_sound_dirt_defaults({
		footstep = {name = "aus_mangrove_mud", gain = 0.4},
		dug = {name = "aus_mangrove_mud", gain = 0.4},
	}),
})

minetest.register_node("australia:mineral_salt", {
	description = "Salt Mineral",
	tiles = {"aus_red_sand.png^aus_mineral_salt.png"},
	paramtype = "light",
	is_ground_content = true,
	groups = {snappy = 2, cracky = 3, oddly_breakable_by_hand = 3},
	drop = {
		items = {
			{items = {"australia:red_sand"} },
			{items = {"australia:salt"} }
		}
	},
	sounds = core.node_sound_dirt_defaults,
})

minetest.register_node("australia:salt", {
	description = "Salt",
	drawtype = "plantlike",
	visual_scale = 0.6,
	tiles = {"aus_salt.png"},
	inventory_image = "aus_salt.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	groups = {fleshy = 3, dig_immediate = 3, flammable = 1},
	on_use = minetest.item_eat(1),
	sounds = core.node_sound_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-3/32, -8/16, -3/32, 3/32, -4/16, 3/32},
	},
	collision_box = {
		type = "fixed",
		fixed = {-3/32, -8/16, -3/32, 3/32, -4/16, 3/32},
	},
})

minetest.register_node( "australia:salt_block", {
	description = "Salt Block",
	tiles = {"default_clay.png^aus_salt_block.png"},
	is_ground_content = true,
	groups = {snappy = 2, cracky = 3, oddly_breakable_by_hand = 3},
	on_use = minetest.item_eat(9),
	sounds = core.node_sound_stone_defaults(),
})

minetest.register_node("australia:stone_with_opal", {
	description = "Opal Ore",
	tiles = {"default_stone.png^aus_mineral_opal.png"},
	groups = {cracky = 2},
	drop = "australia:opal",
	sounds = core.node_sound_stone_defaults(),
})

minetest.register_node("australia:opal",{
	description = "Opal",
	drawtype = "mesh",
	mesh = "cavestuff_pebble.obj",
	tiles = {"aus_opal.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=2, stone=1, dig_immediate = 1},
	selection_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -6/16, 5/16, -1/32, 5/16},
	},
	collision_box = {
		type = "fixed",
		fixed = {-5/16, -8/16, -6/16, 5/16, -1/32, 5/16},
	},
	sounds = core.node_sound_stone_defaults(),
})


--[[
	Small Rocks
--]]

-- Place a small nodebox.
local function small_cube(grid, pos, diameters)
	local rock = {}

	rock[1] = pos.x
	rock[2] = pos.y
	rock[3] = pos.z
	rock[4] = pos.x + diameters.x
	rock[5] = pos.y + diameters.y
	rock[6] = pos.z + diameters.z
	push(grid, rock)
end

-- Small red rocks
local default_grid_red_rocks

for grid_count = 1, 6 do
	local grid = {}
	for rock_count = 2, math.random(1, 4) + 1 do
		local diameter = math.random(15, 25) / 100
		local x = math.random(1, 80) / 100 - 0.5
		local z = math.random(1, 80) / 100 - 0.5
		small_cube(grid, {x = x, y = -0.5, z = z}, {x = diameter, y = diameter, z = diameter})
	end

	minetest.register_node("australia:small_red_rocks"..grid_count, {
		description = "Small Red Rocks",
		tiles = {"aus_red_stone.png"},
		is_ground_content = true,
		walkable = false,
		paramtype = "light",
		drawtype = "nodebox",
		buildable_to = true,
		node_box = {type = "fixed", fixed = grid},
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
		},
		groups = {stone = 1, oddly_breakable_by_hand = 3},
		drop = "australia:small_red_rocks",
		sounds = core.node_sound_stone_defaults(),
	})

	default_grid_red_rocks = grid
end

minetest.register_node("australia:small_red_rocks", {
	description = "Small Red Rocks",
	tiles = {"aus_red_stone.png"},
	inventory_image = "aus_small_red_rocks.png",
	is_ground_content = true,
	walkable = false,
	paramtype = "light",
	drawtype = "nodebox",
	node_box = {type = "fixed", fixed = default_grid_red_rocks},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
	},
	groups = {stone = 1, oddly_breakable_by_hand = 3},
	sounds = core.node_sound_stone_defaults(),
	on_place = function(itemstack, placer, pointed_thing)
		local pos = pointed_thing.above
		local player_name = placer:get_player_name()
		-- place a random small red rocks node
		if not minetest.is_protected(pos, player_name) then
			minetest.set_node(pos, {name = "australia:small_red_rocks"..math.random(1, 6)})
			if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
			end
		else
			minetest.chat_send_player(player_name, "Node is protected")
			minetest.record_protection_violation(pos, player_name)
		end
		
		return itemstack
	end
})

-- Small sandstone rocks
local default_grid_sandstone_rocks

for grid_count = 1, 6 do
	local grid = {}
	for rock_count = 2, math.random(1, 4) + 1 do
		local diameter = math.random(15, 25) / 100
		local x = math.random(1, 80) / 100 - 0.5
		local z = math.random(1, 80) / 100 - 0.5
		small_cube(grid, {x = x, y = -0.5, z = z}, {x = diameter, y = diameter, z = diameter})
	end

	minetest.register_node("australia:small_sandstone_rocks"..grid_count, {
		description = "Small Sandstone Rocks",
		tiles = {"default_sandstone.png"},
		is_ground_content = true,
		walkable = false,
		paramtype = "light",
		drawtype = "nodebox",
		buildable_to = true,
		node_box = {type = "fixed", fixed = grid},
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
		},
		groups = {stone = 1, oddly_breakable_by_hand = 3},
		drop = "australia:small_sandstone_rocks",
		sounds = core.node_sound_stone_defaults(),
	})

	default_grid_sandstone_rocks = grid
end

minetest.register_node("australia:small_sandstone_rocks", {
	description = "Small Sandstone Rocks",
	tiles = {"default_sandstone.png"},
	inventory_image = "aus_small_sandstone_rocks.png",
	is_ground_content = true,
	walkable = false,
	paramtype = "light",
	drawtype = "nodebox",
	node_box = {type = "fixed", fixed = default_grid_sandstone_rocks},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
	},
	groups = {stone = 1, oddly_breakable_by_hand = 3},
	sounds = core.node_sound_stone_defaults(),
	on_place = function(itemstack, placer, pointed_thing)
		local pos = pointed_thing.above
		local player_name = placer:get_player_name()
		-- place a random small sandstone rocks node
		if not minetest.is_protected(pos, player_name) then
			minetest.set_node(pos, {name = "australia:small_sandstone_rocks"..math.random(1, 6)})
			if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
			end
		else
			minetest.chat_send_player(player_name, "Node is protected")
			minetest.record_protection_violation(pos, player_name)
		end
		
		return itemstack
	end
})

-- Small stone rocks
local default_grid_stone_rocks

for grid_count = 1, 6 do
	local grid = {}
	for rock_count = 2, math.random(1, 4) + 1 do
		local diameter = math.random(15, 25) / 100
		local x = math.random(1, 80) / 100 - 0.5
		local z = math.random(1, 80) / 100 - 0.5
		small_cube(grid, {x = x, y = -0.5, z = z}, {x = diameter, y = diameter, z = diameter})
	end

	minetest.register_node("australia:small_stone_rocks"..grid_count, {
		description = "Small Stone Rocks",
		tiles = {"default_stone.png"},
		is_ground_content = true,
		walkable = false,
		paramtype = "light",
		drawtype = "nodebox",
		buildable_to = true,
		node_box = {type = "fixed", fixed = grid},
		selection_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
		},
		groups = {stone = 1, oddly_breakable_by_hand = 3},
		drop = "australia:small_stone_rocks",
		sounds = core.node_sound_stone_defaults(),
	})

	default_grid_stone_rocks = grid
end

minetest.register_node("australia:small_stone_rocks", {
	description = "Small Stone Rocks",
	tiles = {"default_stone.png"},
	inventory_image = "aus_small_stone_rocks.png",
	is_ground_content = true,
	walkable = false,
	paramtype = "light",
	drawtype = "nodebox",
	node_box = {type = "fixed", fixed = default_grid_stone_rocks},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, -5/16, 0.5},
	},
	groups = {stone = 1, oddly_breakable_by_hand = 3},
	sounds = core.node_sound_stone_defaults(),
	on_place = function(itemstack, placer, pointed_thing)
		local pos = pointed_thing.above
		local player_name = placer:get_player_name()
		-- place a random small stone rocks node
		if not minetest.is_protected(pos, player_name) then
			minetest.set_node(pos, {name = "australia:small_stone_rocks"..math.random(1, 6)})
			if not minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
			end
		else
			minetest.chat_send_player(player_name, "Node is protected")
			minetest.record_protection_violation(pos, player_name)
		end
		
		return itemstack
	end
})


--[[
	Muddy River Water
--]]

minetest.register_node("australia:muddy_river_water_source", {
	description = "Muddy River Water Source",
	drawtype = "liquid",
	tiles = {
		{
			name="aus_muddy_river_water_flowing.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	special_tiles = {
		{
			name="aus_muddy_river_water_flowing.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
			backface_culling = false,
		},
	},
	alpha = 224,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "australia:muddy_river_water_flowing",
	liquid_alternative_source = "australia:muddy_river_water_source",
	liquid_viscosity = 1,
	liquid_renewable = true,
	liquid_range = 2,
	post_effect_color = {a = 232, r = 92, g = 80, b = 48},
	groups = {water = 3, liquid = 3, puts_out_fire = 1},
})

minetest.register_node("australia:muddy_river_water_flowing", {
	description = "Flowing Muddy River Water",
	drawtype = "flowingliquid",
	tiles = {"aus_muddy_river_water_source.png"},
	special_tiles = {
		{
			image="aus_muddy_river_water_flowing.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
		{
			image="aus_muddy_river_water_flowing.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
	},
	alpha = 224,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "australia:muddy_river_water_flowing",
	liquid_alternative_source = "australia:muddy_river_water_source",
	liquid_viscosity = 1,
	liquid_renewable = false,
	liquid_range = 2,
	post_effect_color = {a = 232, r = 92, g = 80, b = 48},
	groups = {water = 3, liquid = 3, puts_out_fire = 1, not_in_creative_inventory = 1},
})


--[[
	Walls
--]]

walls.register(":walls:bluestone", "Bluestone Cobble Wall", "aus_bluestone_cobble.png",
		"australia:bluestone_cobble", core.node_sound_stone_defaults())

walls.register(":walls:bluestone_cobble", "Bluestone Wall", "aus_bluestone.png",
		"australia:bluestone", core.node_sound_stone_defaults())

walls.register(":walls:bluestone_brick", "Bluestone Brick Wall", "aus_bluestone_brick.png",
		"australia:bluestone_brick", core.node_sound_stone_defaults())

walls.register(":walls:brick", "Brick Wall", "default_brick.png",
		"default:brick", core.node_sound_stone_defaults())

walls.register(":walls:desert_stone", "Desert Stone Wall", "default_desert_stone.png",
		"default:desert_stone", core.node_sound_stone_defaults())

walls.register(":walls:desert_stonebrick", "Desert Stone Brick Wall", "default_desert_stone_brick.png",
		"default:desert_stonebrick", core.node_sound_stone_defaults())

walls.register(":walls:red_stone", "Red Cobblestone Wall", "aus_red_cobble.png",
		"australia:red_cobble", core.node_sound_stone_defaults())

walls.register(":walls:red_cobble", "Red Stone Wall", "aus_red_stone.png",
		"australia:red_stone", core.node_sound_stone_defaults())

walls.register(":walls:red_stonebrick", "Red Stone Brick Wall", "aus_red_stonebrick.png",
		"australia:red_stonebrick", core.node_sound_stone_defaults())

walls.register(":walls:sandstone", "Sandstone Wall", "default_sandstone.png",
		"default:sandstone", core.node_sound_stone_defaults())

walls.register(":walls:sandstone_brick", "Sandstone Brick Wall", "default_sandstone_brick.png",
		"default:sandstonebrick", core.node_sound_stone_defaults())

walls.register(":walls:sandstone_cobble", "Sandstone Cobble Wall", "aus_sandstone_cobble.png",
		"australia:sandstone_cobble", core.node_sound_stone_defaults())

walls.register(":walls:stone", "Stone Wall", "default_stone.png",
		"default:stone", core.node_sound_stone_defaults())

walls.register(":walls:stone_brick", "Stone Brick Wall", "default_stone_brick.png",
		"default:stonebrick", core.node_sound_stone_defaults())
