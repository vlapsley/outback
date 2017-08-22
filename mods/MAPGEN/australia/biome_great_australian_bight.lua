-- mods/australia_modpack/australia/biome_great_australian_bight.lua

-- localize math routines for performance
local math_random = math.random

-- great australian bight
minetest.register_biome({
	name =            "great_australian_bight",
	node_top =        "core:sandstone",
	depth_top =       3,
	node_filler =     "australia:bluestone",
	depth_filler =    4,
	node_stone =      "core:stone",
	node_riverbed =   "core:sandstone",
	depth_riverbed =  1,
	y_min =           -192,
	y_max =           3,
	heat_point =      55,
	humidity_point =  50,
})


--[[
	Ores
--]]

-- Blob ore first to avoid other ores inside blobs

minetest.register_ore({
	ore_type =        "scatter",
	ore =             "australia:stone_kelp_brown",
	wherein =         "core:sandstone",
	clust_scarcity =  9 * 9 * 9,
	clust_num_ores =  25,
	clust_size =      6,
	biomes =          {"great_australian_bight"},
	y_min =           -10,
	y_max =           -3,
})

minetest.register_ore({
	ore_type =        "scatter",
	ore =             "australia:submarine",
	wherein =         "core:sand",
	clust_scarcity =  80 * 80 * 80,
	clust_num_ores =  1,
	clust_size =      12,
	biomes =          {"great_australian_bight"},
	y_min =           -64,
	y_max =           -8,
})

minetest.register_ore({
	ore_type =        "scatter",
	ore =             "australia:woodship",
	wherein =         "core:sandstone",
	clust_scarcity =  30 * 30 * 30,
	clust_num_ores =  1,
	clust_size =      12,
	biomes =          {"great_australian_bight"},
	y_min =           -64,
	y_max =           -6,
})


--[[
	ABM's
--]]

minetest.register_abm({
	nodenames =  {"australia:stone_kelp_brown"},
	interval =   15,
	chance =     5,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local yp = {x = pos.x, y = pos.y + 1, z = pos.z}
		if (minetest.get_node(yp).name == "core:water_source" or
		minetest.get_node(yp).name == "australia:water_source") then
			pos.y = pos.y + 1
			minetest.add_node(pos, {name = "australia:kelp_brown"}) else
			return
		end
	end
})

minetest.register_abm({
	nodenames =  {"australia:woodship"},
	interval =   1,
	chance =     1,
	action = function(pos, node, active_object_count, active_object_count_wider)
	local yp = {x = pos.x, y = pos.y + 3, z = pos.z}
		if minetest.get_node(pos).name == "australia:woodship" and
			(minetest.get_node(yp).name == "core:water_source" or
			minetest.get_node(yp).name == "australia:water_source") then
			
			minetest.add_node(pos, {name = "core:sand"})

			pos.y = pos.y + 1
			pos.x = pos.x - 6

			for a = 1, 11 do
				pos.x = pos.x + 1
				minetest.add_node(pos, {name = "core:tree"})
			end

			pos.z = pos.z + 1
			pos.x = pos.x - 10

			for a = 1, 9 do
				pos.x = pos.x + 1
				minetest.add_node(pos, {name = "core:tree"})
			end

			pos.z = pos.z - 2
			pos.x = pos.x - 9

			for a = 1, 9 do
				pos.x = pos.x + 1
				minetest.add_node(pos, {name = "core:tree"})
			end

			pos.y = pos.y + 1
			pos.x = pos.x - 8
			pos.z = pos.z - 1

			for a = 1, 7 do
				pos.x = pos.x + 1
				minetest.add_node(pos, {name = "core:tree"})
			end

			pos.z = pos.z + 4
			pos.x = pos.x - 7

			for a = 1, 7 do
				pos.x = pos.x + 1
				minetest.add_node(pos, {name = "core:tree"})
			end

			pos.z = pos.z - 1
			pos.x = pos.x + 1
			minetest.add_node(pos, {name = "core:wood"})

			pos.z = pos.z - 1
			pos.x = pos.x + 1
			minetest.add_node(pos, {name = "core:wood"})

			pos.x = pos.x + 1
			minetest.add_node(pos, {name = "core:tree"})

			pos.z = pos.z - 1
			pos.x = pos.x - 2
			minetest.add_node(pos, {name = "core:tree"})

			pos.z = pos.z + 2
			pos.x = pos.x - 8
			minetest.add_node(pos, {name = "core:tree"})

			pos.z = pos.z - 1
			pos.x = pos.x - 1
			minetest.add_node(pos, {name = "core:tree"})

			pos.x = pos.x - 1
			minetest.add_node(pos, {name = "core:tree"})

			pos.z = pos.z - 1
			pos.x = pos.x + 2
			minetest.add_node(pos, {name = "core:tree"})

			pos.y = pos.y + 1
			pos.z = pos.z - 1

			for a = 1, 7 do
				pos.x = pos.x + 1
				minetest.add_node(pos, {name = "core:wood"})
			end

			pos.z = pos.z + 4
			pos.x = pos.x - 7

			for a = 1, 7 do
				pos.x = pos.x + 1
				minetest.add_node(pos, {name = "core:wood"})
			end

			pos.z = pos.z - 1
			pos.x = pos.x + 1
			minetest.add_node(pos, {name = "core:wood"})

			pos.z = pos.z - 1
			pos.x = pos.x + 1
			minetest.add_node(pos, {name = "core:wood"})

			pos.z = pos.z - 1
			pos.x = pos.x - 1
			minetest.add_node(pos, {name = "core:wood"})

			pos.z = pos.z + 2
			pos.x = pos.x - 8
			minetest.add_node(pos, {name = "core:wood"})

			pos.z = pos.z - 1
			pos.x = pos.x - 1
			minetest.add_node(pos, {name = "core:wood"})

			for a = 1, 3 do
				pos.x = pos.x - 1
				minetest.add_node(pos, {name = "core:wood"})
			end

			pos.z = pos.z - 1
			pos.x = pos.x + 4
			minetest.add_node(pos, {name = "core:wood"})

			pos.z = pos.z + 1
			pos.x = pos.x + 3
			minetest.add_node(pos, {name = "core:wood"})

			pos.y = pos.y + 1
			minetest.add_node(pos, {name = "core:wood"})

			pos.y = pos.y - 2
			minetest.add_node(pos, {name = "core:wood"})

			pos.y = pos.y + 3
			pos.z = pos.z - 4

			for a = 1, 7 do
				pos.z = pos.z + 1
				minetest.add_node(pos, {name = "core:wood"})
			end

			pos.z = pos.z - 3

			for a = 1, 2 do
				pos.y = pos.y + 1
				minetest.add_node(pos, {name = "core:wood"})
			end

			pos.y = pos.y + 1
			pos.z = pos.z - 3

			for a = 1, 5 do
				pos.z = pos.z + 1
				minetest.add_node(pos, {name = "core:wood"})
			end

			pos.y = pos.y + 1
			pos.z = pos.z - 2
			minetest.add_node(pos, {name = "core:wood"})

			pos.y = pos.y - 7
			pos.z = pos.z + 1
			pos.x = pos.x - 2
			minetest.add_node(pos, {name = "australia:woodshipchest"})

		else
			return
		end
	end
})

local function place_submarine(pos)
	minetest.add_node(pos, {name = "core:dirt"})

	pos.y = pos.y + 1
	pos.x = pos.x - 15

	for a = 1, 31 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "core:copperblock"})
	end

	pos.z = pos.z + 1
	pos.x = pos.x + 1

	for a = 1, 31 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "core:copperblock"})
	end

	pos.z = pos.z + 1
	pos.x = pos.x +1

	for a = 1, 27 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "core:copperblock"})
	end

	pos.z = pos.z - 3
	pos.x = pos.x + 1

	for a = 1, 27 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "core:copperblock"})
	end

	pos.z = pos.z - 1
	pos.x = pos.x + 2

	for a = 1, 21 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "core:copperblock"})
	end

	pos.z = pos.z + 5
	pos.x = pos.x + 1

	for a = 1, 21 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "core:copperblock"})
	end

	pos.y = pos.y + 1
	pos.z = pos.z + 1
	pos.x = pos.x - 1

	for a = 1, 21 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "core:copperblock"})
	end

	pos.z = pos.z - 7
	pos.x = pos.x + 1

	for a = 1, 21 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "core:copperblock"})
	end

	pos.z = pos.z + 1
	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "core:copperblock"})
	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "core:copperblock"})
	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "core:copperblock"})

	pos.x = pos.x + 24
	minetest.add_node(pos, {name = "core:copperblock"})
	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "core:copperblock"})
	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "core:copperblock"})

	pos.z = pos.z + 5
	minetest.add_node(pos, {name = "core:copperblock"})
	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "core:copperblock"})
	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "core:copperblock"})

	pos.x = pos.x - 22
	minetest.add_node(pos, {name = "core:copperblock"})
	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "core:copperblock"})
	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "core:copperblock"})

	pos.z = pos.z - 1
	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "core:copperblock"})
	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "core:copperblock"})

	pos.x = pos.x + 29
	minetest.add_node(pos, {name = "core:copperblock"})
	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "core:copperblock"})

	pos.z = pos.z - 3
	minetest.add_node(pos, {name = "core:copperblock"})
	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "core:copperblock"})

	pos.x = pos.x - 28
	minetest.add_node(pos, {name = "core:copperblock"})
	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "core:copperblock"})

	pos.z = pos.z + 1
	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "core:copperblock"})

	pos.x = pos.x + 32
	minetest.add_node(pos, {name = "core:copperblock"})

	pos.z = pos.z + 1
	minetest.add_node(pos, {name = "core:copperblock"})

	pos.x = pos.x - 32
	minetest.add_node(pos, {name = "core:copperblock"})

	pos.y = pos.y + 1
	minetest.add_node(pos, {name = "core:steelblock"})

	pos.x = pos.x + 32
	minetest.add_node(pos, {name = "core:steelblock"})

	pos.z = pos.z - 1
	minetest.add_node(pos, {name = "core:steelblock"})

	pos.x = pos.x - 32
	minetest.add_node(pos, {name = "core:steelblock"})

	pos.z = pos.z - 1
	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "core:steelblock"})
	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "core:steelblock"})

	pos.x = pos.x + 28
	minetest.add_node(pos, {name = "core:steelblock"})
	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "core:steelblock"})

	pos.z = pos.z + 3
	minetest.add_node(pos, {name = "core:steelblock"})
	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "core:steelblock"})

	pos.x = pos.x - 28
	minetest.add_node(pos, {name = "core:steelblock"})
	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "core:steelblock"})

	pos.z = pos.z + 1
	pos.x = pos.x + 2
	minetest.add_node(pos, {name = "core:steelblock"})
	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "core:obsidian_glass"})
	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "core:steelblock"})

	pos.x = pos.x + 22
	minetest.add_node(pos, {name = "core:steelblock"})
	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "core:obsidian_glass"})
	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "core:steelblock"})

	pos.z = pos.z + 1
	pos.x = pos.x - 2
	for a = 1, 3 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "core:steelblock"})
	end

	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "core:obsidian_glass"})

	for a = 1, 3 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "core:steelblock"})
	end

	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "core:obsidian_glass"})

	for a = 1, 3 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "core:steelblock"})
	end

	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "core:obsidian_glass"})

	for a = 1, 9 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "core:steelblock"})
	end

	pos.z = pos.z - 6
	pos.x = pos.x - 3
	minetest.add_node(pos, {name = "core:steelblock"})
	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "core:obsidian_glass"})
	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "core:steelblock"})

	pos.x = pos.x + 22
	minetest.add_node(pos, {name = "core:steelblock"})
	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "core:obsidian_glass"})
	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "core:steelblock"})

	pos.z = pos.z - 1
	pos.x = pos.x - 2

	for a = 1, 3 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "core:steelblock"})
	end

	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "core:obsidian_glass"})

	for a = 1, 3 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "core:steelblock"})
	end

	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "core:obsidian_glass"})

	for a = 1, 3 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "core:steelblock"})
	end

	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "core:obsidian_glass"})

	for a = 1, 9 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "core:steelblock"})
	end

	pos.y = pos.y + 1
	pos.z = pos.z + 7
	pos.x = pos.x - 1
	for a = 1, 21 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "core:copperblock"})
	end

	pos.z = pos.z - 7
	pos.x = pos.x + 1

	for a = 1, 21 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "core:copperblock"})
	end

	pos.z = pos.z + 1
	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "core:copperblock"})
	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "core:copperblock"})
	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "core:copperblock"})

	pos.x = pos.x + 24
	minetest.add_node(pos, {name = "core:copperblock"})
	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "core:copperblock"})
	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "core:copperblock"})

	pos.z = pos.z + 5
	minetest.add_node(pos, {name = "core:copperblock"})
	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "core:copperblock"})
	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "core:copperblock"})

	pos.x = pos.x - 22
	minetest.add_node(pos, {name = "core:copperblock"})
	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "core:copperblock"})
	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "core:copperblock"})

	pos.z = pos.z - 1
	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "core:copperblock"})
	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "core:copperblock"})

	pos.x = pos.x + 29
	minetest.add_node(pos, {name = "core:copperblock"})
	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "core:copperblock"})

	pos.z = pos.z - 3
	minetest.add_node(pos, {name = "core:copperblock"})
	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "core:copperblock"})

	pos.x = pos.x - 28
	minetest.add_node(pos, {name = "core:copperblock"})
	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "core:copperblock"})

	pos.z = pos.z + 1
	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "core:copperblock"})

	pos.x = pos.x + 32
	minetest.add_node(pos, {name = "core:copperblock"})

	pos.z = pos.z + 1
	minetest.add_node(pos, {name = "core:copperblock"})

	pos.x = pos.x - 32
	minetest.add_node(pos, {name = "core:copperblock"})

	pos.y = pos.y + 1
	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "core:copperblock"})
	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "core:copperblock"})

	pos.x = pos.x + 28
	minetest.add_node(pos, {name = "core:copperblock"})
	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "core:copperblock"})

	pos.z = pos.z - 1
	minetest.add_node(pos, {name = "core:copperblock"})
	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "core:copperblock"})

	pos.x = pos.x - 28
	minetest.add_node(pos, {name = "core:copperblock"})
	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "core:copperblock"})

	pos.z = pos.z - 1
	pos.x = pos.x + 2
	minetest.add_node(pos, {name = "core:copperblock"})
	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "core:copperblock"})
	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "core:copperblock"})

	pos.x = pos.x + 22
	minetest.add_node(pos, {name = "core:copperblock"})
	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "core:copperblock"})
	pos.x = pos.x + 1
	minetest.add_node(pos, {name = "core:copperblock"})

	pos.z = pos.z + 3
	minetest.add_node(pos, {name = "core:copperblock"})
	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "core:copperblock"})
	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "core:copperblock"})

	pos.x = pos.x - 22
	minetest.add_node(pos, {name = "core:copperblock"})
	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "core:copperblock"})
	pos.x = pos.x - 1
	minetest.add_node(pos, {name = "core:copperblock"})

	pos.z = pos.z + 1
	pos.x = pos.x + 2
	for a = 1, 21 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "core:copperblock"})
	end

	pos.z = pos.z - 5
	pos.x = pos.x + 1
	for a = 1, 21 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "core:copperblock"})
	end

	pos.y = pos.y + 1
	pos.z = pos.z + 2
	pos.x = pos.x - 4
	for a = 1, 3 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "core:copperblock"})
	end

	pos.x = pos.x + 21
	for a = 1, 3 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "core:copperblock"})
	end

	pos.z = pos.z + 1
	pos.x = pos.x + 1
	for a = 1, 3 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "core:copperblock"})
	end

	pos.x = pos.x - 21
	for a = 1, 3 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "core:copperblock"})
	end

	pos.z = pos.z + 2
	pos.x = pos.x + 3
	for a = 1, 4 do
		pos.z = pos.z - 1
		minetest.add_node(pos, {name = "core:copperblock"})
	end

	pos.z = pos.z - 1
	pos.x = pos.x + 1
	for a = 1, 4 do
		pos.z = pos.z + 1
		minetest.add_node(pos, {name = "core:copperblock"})
	end

	pos.x = pos.x + 6
	for a = 1, 13 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "core:copperblock"})
	end

	pos.z = pos.z - 3
	pos.x = pos.x + 1
	for a = 1, 13 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "core:copperblock"})
	end

	pos.z = pos.z + 1
	pos.x = pos.x - 1
	for a = 1, 13 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "core:bronzeblock"})
	end

	pos.z = pos.z + 1
	pos.x = pos.x + 1
	for a = 1, 13 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "core:bronzeblock"})
	end

	pos.z = pos.z - 3
	for a = 1, 6 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "core:steelblock"})
	end

	pos.z = pos.z + 5
	pos.x = pos.x - 1
	for a = 1, 6 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "core:steelblock"})
	end

	pos.y = pos.y + 1
	for a = 1, 4 do
		pos.z = pos.z - 1
		minetest.add_node(pos, {name = "core:steelblock"})
	end

	pos.x = pos.x - 5
	pos.z = pos.z - 1
	for a = 1, 4 do
		pos.z = pos.z + 1
		minetest.add_node(pos, {name = "core:steelblock"})
	end

	for a = 1, 4 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "core:steelblock"})
	end

	pos.x = pos.x + 1
	pos.z = pos.z - 3
	for a = 1, 4 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "core:steelblock"})
	end

	pos.y = pos.y + 1
	pos.x = pos.x - 1
	pos.z = pos.z - 1
	for a = 1, 4 do
		pos.z = pos.z + 1
		minetest.add_node(pos, {name = "core:steelblock"})
	end

	pos.x = pos.x + 5
	pos.z = pos.z + 1
	for a = 1, 4 do
		pos.z = pos.z - 1
		minetest.add_node(pos, {name = "core:steelblock"})
	end

	for a = 1, 4 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "core:steelblock"})
	end

	pos.x = pos.x - 1
	pos.z = pos.z + 3
	for a = 1, 4 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "core:steelblock"})
	end

	pos.y = pos.y + 1
	pos.x = pos.x - 1
	pos.z = pos.z - 1
	for a = 1, 2 do
		pos.x = pos.x - 1
		minetest.add_node(pos, {name = "core:steelblock"})
	end

	pos.x = pos.x - 1
	pos.z = pos.z - 1
	for a = 1, 2 do
		pos.x = pos.x + 1
		minetest.add_node(pos, {name = "core:steelblock"})
	end

	pos.y = pos.y - 7
	pos.x = pos.x + 16
	pos.z = pos.z + 3
	minetest.add_node(pos, {name = "australia:submarinechest"})
end

minetest.register_abm({
	nodenames =  {"australia:submarine"},
	interval =   1,
	chance =     1,
	action = function(pos, node)
		local yp = {x = pos.x, y = pos.y + 8, z = pos.z}
		if node.name == "australia:submarine"
		and (
			minetest.get_node(yp).name == "core:water_source"
			or minetest.get_node(yp).name == "australia:water_source"
		) then
			place_submarine(pos)
		end
	end
})
