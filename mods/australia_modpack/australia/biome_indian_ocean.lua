-- mods/australia_modpack/australia/biome_indian_ocean.lua

-- localize math routines for performance
local math_random = math.random

-- indian ocean
minetest.register_biome({
	name = "indian_ocean",
	node_top = "default:sand",
	depth_top = 3,
	node_filler = "australia:bluestone",
	depth_filler = 4,
	node_stone = "default:stone",
	node_riverbed = "default:sand",
	depth_riverbed = 1,
	y_min = -192,
	y_max = 3,
	heat_point = 60,
	humidity_point = 50,
})


--[[
	Ores
--]]

-- Blob ore first to avoid other ores inside blobs

minetest.register_ore({
	ore_type		= "scatter",
	ore				= "australia:stone_kelp_brown",
	wherein			= "default:sand",
	clust_scarcity	= 9 * 9 * 9,
	clust_num_ores	= 25,
	clust_size		= 6,
	biomes			= {"indian_ocean"},
	y_min			= -10,
	y_max			= -3,
})

minetest.register_ore({
	ore_type		= "scatter",
	ore				= "australia:woodship",
	wherein			= "default:sand",
	clust_scarcity	= 30 * 30 * 30,
	clust_num_ores	= 1,
	clust_size		= 12,
	biomes			= {"indian_ocean"},
	y_min			= -64,
	y_max			= -6,
})


--[[
	Decorations
--]]

-- Grass
local function register_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:sand"},
		sidelen = 16,
		noise_params = {
			offset = offset,
			scale = scale,
			spread = {x = 200, y = 200, z = 200},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"indian_ocean"},
		y_min = 3,
		y_max = 3,
		decoration = "default:grass_"..length,
	})
end

local function register_dry_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"default:sand"},
		sidelen = 16,
		noise_params = {
			offset = offset,
			scale = scale,
			spread = {x = 200, y = 200, z = 200},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"indian_ocean"},
		y_min = 3,
		y_max = 3,
		decoration = "default:dry_grass_"..length,
	})
end

register_grass_decoration(0.015,  0.045, 2)
register_grass_decoration(0.03,   0.03,  1)

register_dry_grass_decoration(0.01, 0.05,  5)
register_dry_grass_decoration(0.03, 0.03,  4)
register_dry_grass_decoration(0.05, 0.01,  3)

-- Narrowleaf Seagrass
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:sand"},
	sidelen = 80,
	fill_ratio = 0.01,
	biomes = {"indian_ocean"},
	y_min     = -10,
	y_max     = -2,
	decoration = "australia:sea_grass",
	flags = "force_placement",
})


--[[
	Trees
--]]

-- Rottnest Island Pine
aus.register_plant({
	nodes = {
		trunk = "australia:rottnest_island_pine_tree",
		leaves = "australia:rottnest_island_pine_leaves",
		air = "air", ignore = "ignore",
	},
	cover = 0.0025,
	density = 0.05,
	priority = 60,
	check = function(t, pos)
		return pos.y >= 3 and table.contains({"indian_ocean"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
			local height = math_random(3, 4)
			local radius = 3
			aus.make_conifer(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
		end,
})


--[[
	ABM's
--]]

minetest.register_abm({
	nodenames = {"australia:stone_kelp_brown"},
	interval = 15,
	chance = 5,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local yp = {x = pos.x, y = pos.y + 1, z = pos.z}
		if (minetest.get_node(yp).name == "default:water_source" or
		minetest.get_node(yp).name == "australia:water_source") then
			pos.y = pos.y + 1
			minetest.add_node(pos, {name = "australia:kelp_brown"}) else
			return
		end
	end
})

minetest.register_abm({
	nodenames = {"australia:woodship"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
	local yp = {x = pos.x, y = pos.y + 3, z = pos.z}
		if minetest.get_node(pos).name == "australia:woodship" and
		(minetest.get_node(yp).name == "default:water_source" or
		minetest.get_node(yp).name == "australia:water_source") then
			minetest.add_node(pos, {name = "default:sand"})

			pos.y = pos.y + 1
			pos.x = pos.x - 6

			for a = 1, 11 do
				pos.x = pos.x + 1
				minetest.add_node(pos, {name = "default:tree"})
			end

			pos.z = pos.z + 1
			pos.x = pos.x - 10

			for a = 1, 9 do
				pos.x = pos.x + 1
				minetest.add_node(pos, {name = "default:tree"})
			end

			pos.z = pos.z - 2
			pos.x = pos.x - 9

			for a = 1, 9 do
				pos.x = pos.x + 1
				minetest.add_node(pos, {name = "default:tree"})
			end


			pos.y = pos.y + 1
			pos.x = pos.x - 8
			pos.z = pos.z - 1

			for a = 1, 7 do
				pos.x = pos.x + 1
				minetest.add_node(pos, {name = "default:tree"})
			end

			pos.z = pos.z + 4
			pos.x = pos.x - 7

			for a = 1, 7 do
				pos.x = pos.x + 1
				minetest.add_node(pos, {name = "default:tree"})
			end

			pos.z = pos.z - 1
			pos.x = pos.x + 1
			minetest.add_node(pos, {name = "default:wood"})

			pos.z = pos.z - 1
			pos.x = pos.x + 1
			minetest.add_node(pos, {name = "default:wood"})

			pos.x = pos.x + 1
			minetest.add_node(pos, {name = "default:tree"})

			pos.z = pos.z - 1
			pos.x = pos.x - 2
			minetest.add_node(pos, {name = "default:tree"})

			pos.z = pos.z + 2
			pos.x = pos.x - 8
			minetest.add_node(pos, {name = "default:tree"})

			pos.z = pos.z - 1
			pos.x = pos.x - 1
			minetest.add_node(pos, {name = "default:tree"})

			pos.x = pos.x - 1
			minetest.add_node(pos, {name = "default:tree"})

			pos.z = pos.z - 1
			pos.x = pos.x + 2
			minetest.add_node(pos, {name = "default:tree"})


			pos.y = pos.y + 1
			pos.z = pos.z - 1

			for a = 1, 7 do
				pos.x = pos.x + 1
				minetest.add_node(pos, {name = "default:wood"})
			end

			pos.z = pos.z + 4
			pos.x = pos.x - 7

			for a = 1, 7 do
				pos.x = pos.x + 1
				minetest.add_node(pos, {name = "default:wood"})
			end

			pos.z = pos.z - 1
			pos.x = pos.x + 1
			minetest.add_node(pos, {name = "default:wood"})

			pos.z = pos.z - 1
			pos.x = pos.x + 1
			minetest.add_node(pos, {name = "default:wood"})

			pos.z = pos.z - 1
			pos.x = pos.x - 1
			minetest.add_node(pos, {name = "default:wood"})

			pos.z = pos.z + 2
			pos.x = pos.x - 8
			minetest.add_node(pos, {name = "default:wood"})

			pos.z = pos.z - 1
			pos.x = pos.x - 1
			minetest.add_node(pos, {name = "default:wood"})

			for a = 1, 3 do
				pos.x = pos.x - 1
				minetest.add_node(pos, {name = "default:wood"})
			end

			pos.z = pos.z - 1
			pos.x = pos.x + 4
			minetest.add_node(pos, {name = "default:wood"})

			pos.z = pos.z + 1
			pos.x = pos.x + 3
			minetest.add_node(pos, {name = "default:wood"})

			pos.y = pos.y + 1
			minetest.add_node(pos, {name = "default:wood"})

			pos.y = pos.y - 2
			minetest.add_node(pos, {name = "default:wood"})

			pos.y = pos.y + 3
			pos.z = pos.z - 4

			for a = 1, 7 do
				pos.z = pos.z + 1
				minetest.add_node(pos, {name = "default:wood"})
			end

			pos.z = pos.z - 3

			for a = 1, 2 do
				pos.y = pos.y + 1
				minetest.add_node(pos, {name = "default:wood"})
			end

			pos.y = pos.y + 1
			pos.z = pos.z - 3

			for a = 1, 5 do
				pos.z = pos.z + 1
				minetest.add_node(pos, {name = "default:wood"})
			end

			pos.y = pos.y + 1
			pos.z = pos.z - 2
			minetest.add_node(pos, {name = "default:wood"})

			pos.y = pos.y - 7
			pos.z = pos.z + 1
			pos.x = pos.x - 2
			minetest.add_node(pos, {name = "australia:woodshipchest"})

		else
			return
		end
	end
})
