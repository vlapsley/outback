--[[
	Walls
--]]

walls = {}

walls.register = function(wall_name, wall_desc, wall_texture, wall_mat, wall_sounds)
	-- inventory node, and pole-type wall start item
	minetest.register_node(wall_name, {
		description = wall_desc,
		drawtype = "nodebox",
		node_box = {
			type = "connected",
			fixed = {{-1/4, -1/2, -1/4, 1/4, 1/2, 1/4}},
			-- connect_bottom =
			connect_front = {{-3/16, -1/2, -1/2,  3/16, 3/8, -1/4}},
			connect_left = {{-1/2, -1/2, -3/16, -1/4, 3/8,  3/16}},
			connect_back = {{-3/16, -1/2,  1/4,  3/16, 3/8,  1/2}},
			connect_right = {{ 1/4, -1/2, -3/16,  1/2, 3/8,  3/16}},
		},
		connects_to = { "group:wall", "group:stone" },
		paramtype = "light",
		is_ground_content = false,
		tiles = { wall_texture, },
		walkable = true,
		groups = { cracky = 3, wall = 1, stone = 2 },
		sounds = wall_sounds,
	})

	-- crafting recipe
	minetest.register_craft({
		output = wall_name .. " 6",
		recipe = {
			{ '', '', '' },
			{ wall_mat, wall_mat, wall_mat},
			{ wall_mat, wall_mat, wall_mat},
		}
	})

end


walls.register("walls:basalt", "Basalt Wall", "base_basalt.png",
		"base:basalt", default.node_sound_stone_defaults())

walls.register("walls:basalt_brick", "Basalt Brick Wall", "base_basalt_brick.png",
		"base:basalt_brick", default.node_sound_stone_defaults())

walls.register("walls:basalt_cobble", "Basalt Cobble Wall", "base_basalt_cobble.png",
		"base:basalt_cobble", default.node_sound_stone_defaults())

walls.register("walls:brick", "Brick Wall", "default_brick.png",
		"default:brick", default.node_sound_stone_defaults())

walls.register("walls:cobble", "Cobblestone Wall", "default_cobble.png",
		"default:cobble", default.node_sound_stone_defaults())

walls.register("walls:desert_sandstone", "Desert Sandstone Wall", "default_desert_sandstone.png",
		"default:desert_sandstone", default.node_sound_stone_defaults())

walls.register("walls:desert_sandstone_brick", "Desert Sandstone Brick Wall", "default_desert_sandstone_brick.png",
		"default:desert_sandstonebrick", default.node_sound_stone_defaults())

walls.register("walls:diorite", "Diorite Wall", "base_diorite.png",
		"base:diorite", default.node_sound_stone_defaults())

walls.register("walls:diorite_brick", "Diorite Brick Wall", "base_diorite_brick.png",
		"base:diorite_brick", default.node_sound_stone_defaults())

walls.register("walls:diorite_cobble", "Diorite Cobble Wall", "base_diorite_cobble.png",
		"base:diorite_cobble", default.node_sound_stone_defaults())

walls.register("walls:granite", "Granite Wall", "technic_granite.png",
		"technic:granite", default.node_sound_stone_defaults())

walls.register("walls:granite_brick", "Granite Brick Wall", "technic_granite_brick.png",
		"technic:granite_brick", default.node_sound_stone_defaults())

walls.register("walls:granite_cobble", "Granite Cobble Wall", "technic_granite_cobble.png",
		"technic:granite_cobble", default.node_sound_stone_defaults())

walls.register("walls:limestone", "Limestone Wall", "base_limestone.png",
		"base:limestone", default.node_sound_stone_defaults())

walls.register("walls:limestone_brick", "Limestone Brick Wall", "base_limestone_brick.png",
		"base:limestone_brick", default.node_sound_stone_defaults())

walls.register("walls:limestone_cobble", "Limestone Cobble Wall", "base_limestone_cobble.png",
		"base:limestone_cobble", default.node_sound_stone_defaults())

walls.register("walls:marble", "Marble Wall", "base_marble.png",
		"base:marble", default.node_sound_stone_defaults())

walls.register("walls:marble_tile", "Marble Tile Wall", "base_marble_tile.png",
		"base:marble_tile", default.node_sound_stone_defaults())

walls.register("walls:mossycobble", "Mossy Cobblestone Wall", "default_mossycobble.png",
		"default:mossycobble", default.node_sound_stone_defaults())

walls.register("walls:red_sandstone", "Red Sandstone Wall", "base_red_sandstone.png",
		"base:red_sandstone", default.node_sound_stone_defaults())

walls.register("walls:red_sandstone_brick", "Red Sandstone Brick Wall", "base_red_sandstone_brick.png",
		"base:red_sandstonebrick", default.node_sound_stone_defaults())

walls.register("walls:sandstone", "Sandstone Wall", "default_sandstone.png",
		"default:sandstone", default.node_sound_stone_defaults())

walls.register("walls:sandstone_brick", "Sandstone Brick Wall", "default_sandstone_brick.png",
		"default:sandstonebrick", default.node_sound_stone_defaults())

walls.register("walls:sandstone_cobble", "Sandstone Cobble Wall", "base_sandstone_cobble.png",
		"base:sandstone_cobble", default.node_sound_stone_defaults())

walls.register("walls:shale", "Shale Wall", "base_shale.png",
		"base:shale", default.node_sound_stone_defaults())

walls.register("walls:slate", "Slate Wall", "base_slate.png",
		"base:slate", default.node_sound_stone_defaults())

walls.register("walls:slate_brick", "Slate Brick Wall", "base_slate_brick.png",
		"base:slate_brick", default.node_sound_stone_defaults())

walls.register("walls:slate_rubble", "Slate Rubble Wall", "base_slate_rubble.png",
		"base:slate_rubble", default.node_sound_stone_defaults())

walls.register("walls:stone", "Stone Wall", "default_stone.png",
		"default:stone", default.node_sound_stone_defaults())

walls.register("walls:stonebrick", "Stone Brick Wall", "default_stone_brick.png",
		"default:stonebrick", default.node_sound_stone_defaults())

walls.register("walls:stone_block", "Stone Block Wall", "default_stone_block.png",
		"default:stone_block", default.node_sound_stone_defaults())

