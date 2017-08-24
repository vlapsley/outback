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


walls.register("walls:cobble", "Cobblestone Wall", "base_cobble.png",
		"base:cobble", base.node_sound_stone_defaults())

walls.register("walls:mossycobble", "Mossy Cobblestone Wall", "base_mossycobble.png",
		"base:mossycobble", base.node_sound_stone_defaults())

walls.register("walls:desertcobble", "Desert Cobblestone Wall", "base_desert_cobble.png",
		"base:desert_cobble", base.node_sound_stone_defaults())

walls.register("walls:bluestone", "Bluestone Cobble Wall", "base_bluestone_cobble.png",
		"base:bluestone_cobble", base.node_sound_stone_defaults())

walls.register("walls:bluestone_cobble", "Bluestone Wall", "base_bluestone.png",
		"base:bluestone", base.node_sound_stone_defaults())

walls.register("walls:bluestone_brick", "Bluestone Brick Wall", "base_bluestone_brick.png",
		"base:bluestone_brick", base.node_sound_stone_defaults())

walls.register("walls:brick", "Brick Wall", "base_brick.png",
		"base:brick", base.node_sound_stone_defaults())

walls.register("walls:desert_stone", "Desert Stone Wall", "base_desert_stone.png",
		"base:desert_stone", base.node_sound_stone_defaults())

walls.register("walls:desert_stonebrick", "Desert Stone Brick Wall", "base_desert_stone_brick.png",
		"base:desert_stonebrick", base.node_sound_stone_defaults())

walls.register("walls:red_stone", "Red Cobblestone Wall", "base_red_cobble.png",
		"base:red_cobble", base.node_sound_stone_defaults())

walls.register("walls:red_cobble", "Red Stone Wall", "base_red_stone.png",
		"base:red_stone", base.node_sound_stone_defaults())

walls.register("walls:red_stonebrick", "Red Stone Brick Wall", "base_red_stonebrick.png",
		"base:red_stonebrick", base.node_sound_stone_defaults())

walls.register("walls:sandstone", "Sandstone Wall", "base_sandstone.png",
		"base:sandstone", base.node_sound_stone_defaults())

walls.register("walls:sandstone_brick", "Sandstone Brick Wall", "base_sandstone_brick.png",
		"base:sandstonebrick", base.node_sound_stone_defaults())

walls.register("walls:sandstone_cobble", "Sandstone Cobble Wall", "base_sandstone_cobble.png",
		"base:sandstone_cobble", base.node_sound_stone_defaults())

walls.register("walls:stone", "Stone Wall", "base_stone.png",
		"base:stone", base.node_sound_stone_defaults())

walls.register("walls:stone_brick", "Stone Brick Wall", "base_stone_brick.png",
		"base:stonebrick", base.node_sound_stone_defaults())

