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
		"base:basalt", base.node_sound_stone_defaults())

walls.register("walls:basalt_brick", "Basalt Brick Wall", "base_basalt_brick.png",
		"base:basalt_brick", base.node_sound_stone_defaults())

walls.register("walls:basalt_cobble", "Basalt Cobble Wall", "base_basalt_cobble.png",
		"base:basalt_cobble", base.node_sound_stone_defaults())

walls.register("walls:brick", "Brick Wall", "base_brick.png",
		"base:brick", base.node_sound_stone_defaults())

walls.register("walls:cobble", "Cobblestone Wall", "base_cobble.png",
		"base:cobble", base.node_sound_stone_defaults())

walls.register("walls:desert_sandstone", "Desert Sandstone Wall", "base_desert_sandstone.png",
		"base:desert_sandstone", base.node_sound_stone_defaults())

walls.register("walls:desert_sandstone_brick", "Desert Sandstone Brick Wall", "base_desert_sandstone_brick.png",
		"base:desert_sandstonebrick", base.node_sound_stone_defaults())

walls.register("walls:diorite", "Diorite Wall", "base_diorite.png",
		"base:diorite", base.node_sound_stone_defaults())

walls.register("walls:diorite_brick", "Diorite Brick Wall", "base_diorite_brick.png",
		"base:diorite_brick", base.node_sound_stone_defaults())

walls.register("walls:diorite_cobble", "Diorite Cobble Wall", "base_diorite_cobble.png",
		"base:diorite_cobble", base.node_sound_stone_defaults())

walls.register("walls:granite", "Granite Wall", "technic_granite.png",
		"technic:granite", base.node_sound_stone_defaults())

walls.register("walls:granite_brick", "Granite Brick Wall", "technic_granite_brick.png",
		"technic:granite_brick", base.node_sound_stone_defaults())

walls.register("walls:granite_cobble", "Granite Cobble Wall", "technic_granite_cobble.png",
		"technic:granite_cobble", base.node_sound_stone_defaults())

walls.register("walls:limestone", "Limestone Wall", "base_limestone.png",
		"base:limestone", base.node_sound_stone_defaults())

walls.register("walls:limestone_brick", "Limestone Brick Wall", "base_limestone_brick.png",
		"base:limestone_brick", base.node_sound_stone_defaults())

walls.register("walls:limestone_cobble", "Limestone Cobble Wall", "base_limestone_cobble.png",
		"base:limestone_cobble", base.node_sound_stone_defaults())

walls.register("walls:marble", "Marble Wall", "base_marble.png",
		"base:marble", base.node_sound_stone_defaults())

walls.register("walls:marble_tile", "Marble Tile Wall", "base_marble_tile.png",
		"base:marble_tile", base.node_sound_stone_defaults())

walls.register("walls:mossycobble", "Mossy Cobblestone Wall", "base_mossycobble.png",
		"base:mossycobble", base.node_sound_stone_defaults())

walls.register("walls:red_sandstone", "Red Sandstone Wall", "base_red_sandstone.png",
		"base:red_sandstone", base.node_sound_stone_defaults())

walls.register("walls:red_sandstone_brick", "Red Sandstone Brick Wall", "base_red_sandstone_brick.png",
		"base:red_sandstonebrick", base.node_sound_stone_defaults())

walls.register("walls:sandstone", "Sandstone Wall", "base_sandstone.png",
		"base:sandstone", base.node_sound_stone_defaults())

walls.register("walls:sandstone_brick", "Sandstone Brick Wall", "base_sandstone_brick.png",
		"base:sandstonebrick", base.node_sound_stone_defaults())

walls.register("walls:sandstone_cobble", "Sandstone Cobble Wall", "base_sandstone_cobble.png",
		"base:sandstone_cobble", base.node_sound_stone_defaults())

walls.register("walls:shale", "Shale Wall", "base_shale.png",
		"base:shale", base.node_sound_stone_defaults())

walls.register("walls:slate", "Slate Wall", "base_slate.png",
		"base:slate", base.node_sound_stone_defaults())

walls.register("walls:slate_brick", "Slate Brick Wall", "base_slate_brick.png",
		"base:slate_brick", base.node_sound_stone_defaults())

walls.register("walls:slate_rubble", "Slate Rubble Wall", "base_slate_rubble.png",
		"base:slate_rubble", base.node_sound_stone_defaults())

walls.register("walls:stone", "Stone Wall", "base_stone.png",
		"base:stone", base.node_sound_stone_defaults())

walls.register("walls:stonebrick", "Stone Brick Wall", "base_stone_brick.png",
		"base:stonebrick", base.node_sound_stone_defaults())

walls.register("walls:stone_block", "Stone Block Wall", "base_stone_block.png",
		"base:stone_block", base.node_sound_stone_defaults())

