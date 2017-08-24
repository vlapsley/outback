-- mods/australia_modpack/australia/biome_tasman_sea.lua

-- localize math routines for performance
local math_random = math.random

-- tasman sea
minetest.register_biome({
	name =            "tasman_sea",
	node_top =        "base:sand",
	depth_top =       3,
	node_filler =     "base:bluestone",
	depth_filler =    4,
	node_stone =      "base:stone",
	node_riverbed =   "base:sand",
	depth_riverbed =  1,
	y_min =           -192,
	y_max =           3,
	heat_point =      10,
	humidity_point =  10,
})


--[[
	Ores
--]]

-- Blob ore first to avoid other ores inside blobs

minetest.register_ore({
	ore_type =        "scatter",
	ore =             "australia:woodship",
	wherein =         {"base:sand"},
	clust_scarcity =  60 * 60 * 60,
	clust_num_ores =  1,
	clust_size =      12,
	biomes =          {"tasman_sea"},
	y_min =           -64,
	y_max =           -6,
})


--[[
	Decorations
--]]

-- Grass
local function register_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		deco_type =     "simple",
		place_on =      {"base:sand"},
		sidelen =       16,
		noise_params =  {
			offset =   offset,
			scale =    scale,
			spread =   {x = 200, y = 200, z = 200},
			seed =     329,
			octaves =  3,
			persist =  0.6
		},
		biomes =        {"tasman_sea"},
		y_min =         3,
		y_max =         3,
		decoration =    "base:grass_"..length,
	})
end

local function register_dry_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		deco_type =     "simple",
		place_on =      {"base:sand"},
		sidelen =       16,
		noise_params =  {
			offset =   offset,
			scale =    scale,
			spread =   {x = 200, y = 200, z = 200},
			seed =     329,
			octaves =  3,
			persist =  0.6
		},
		biomes =        {"tasman_sea"},
		y_min =         3,
		y_max =         3,
		decoration =    "base:dry_grass_"..length,
	})
end

register_grass_decoration(0.015,  0.045, 2)
register_grass_decoration(0.03,   0.03,  1)

register_dry_grass_decoration(0.01, 0.05,  5)
register_dry_grass_decoration(0.03, 0.03,  4)
register_dry_grass_decoration(0.05, 0.01,  3)


--[[
	Trees
--]]

-- Coast Banksia (small)
aus.register_plant({
	nodes = {
		trunk =   "base:coast_banksia_tree",
		leaves =  "base:coast_banksia_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.0005,
	density =   0.001,
	priority =  40,
	check = function(t, pos)
		return pos.y >= 3 and pos.y <= 3 and table.contains({"tasman_sea"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(3, 5)
		local radius =  math_random(2, 3)
		aus.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})


--[[
	ABM's
--]]

minetest.register_abm({
	nodenames =  {"australia:woodship"},
	interval =   1,
	chance =     1,
	action = function(pos, node, active_object_count, active_object_count_wider)
	local yp = {x = pos.x, y = pos.y + 3, z = pos.z}
		if minetest.get_node(pos).name == "australia:woodship" and
		(minetest.get_node(yp).name == "base:water_source" or
		minetest.get_node(yp).name == "australia:water_source") then

			minetest.add_node(pos, {name = "base:sand"})

			pos.y = pos.y + 1
			pos.x = pos.x - 6

			for a = 1, 11 do
				pos.x = pos.x + 1
				minetest.add_node(pos, {name = "base:tree"})
			end

			pos.z = pos.z + 1
			pos.x = pos.x - 10

			for a = 1, 9 do
				pos.x = pos.x + 1
				minetest.add_node(pos, {name = "base:tree"})
			end

			pos.z = pos.z - 2
			pos.x = pos.x - 9

			for a = 1, 9 do
				pos.x = pos.x + 1
				minetest.add_node(pos, {name = "base:tree"})
			end


			pos.y = pos.y + 1
			pos.x = pos.x - 8
			pos.z = pos.z - 1

			for a = 1, 7 do
				pos.x = pos.x + 1
				minetest.add_node(pos, {name = "base:tree"})
			end

			pos.z = pos.z + 4
			pos.x = pos.x - 7

			for a = 1, 7 do
				pos.x = pos.x + 1
				minetest.add_node(pos, {name = "base:tree"})
			end

			pos.z = pos.z - 1
			pos.x = pos.x + 1
			minetest.add_node(pos, {name = "base:wood"})

			pos.z = pos.z - 1
			pos.x = pos.x + 1
			minetest.add_node(pos, {name = "base:wood"})

			pos.x = pos.x + 1
			minetest.add_node(pos, {name = "base:tree"})

			pos.z = pos.z - 1
			pos.x = pos.x - 2
			minetest.add_node(pos, {name = "base:tree"})

			pos.z = pos.z + 2
			pos.x = pos.x - 8
			minetest.add_node(pos, {name = "base:tree"})

			pos.z = pos.z - 1
			pos.x = pos.x - 1
			minetest.add_node(pos, {name = "base:tree"})

			pos.x = pos.x - 1
			minetest.add_node(pos, {name = "base:tree"})

			pos.z = pos.z - 1
			pos.x = pos.x + 2
			minetest.add_node(pos, {name = "base:tree"})


			pos.y = pos.y + 1
			pos.z = pos.z - 1

			for a = 1, 7 do
				pos.x = pos.x + 1
				minetest.add_node(pos, {name = "base:wood"})
			end

			pos.z = pos.z + 4
			pos.x = pos.x - 7

			for a = 1, 7 do
				pos.x = pos.x + 1
				minetest.add_node(pos, {name = "base:wood"})
			end

			pos.z = pos.z - 1
			pos.x = pos.x + 1
			minetest.add_node(pos, {name = "base:wood"})

			pos.z = pos.z - 1
			pos.x = pos.x + 1
			minetest.add_node(pos, {name = "base:wood"})

			pos.z = pos.z - 1
			pos.x = pos.x - 1
			minetest.add_node(pos, {name = "base:wood"})

			pos.z = pos.z + 2
			pos.x = pos.x - 8
			minetest.add_node(pos, {name = "base:wood"})

			pos.z = pos.z - 1
			pos.x = pos.x - 1
			minetest.add_node(pos, {name = "base:wood"})

			for a = 1, 3 do
				pos.x = pos.x - 1
				minetest.add_node(pos, {name = "base:wood"})
			end

			pos.z = pos.z - 1
			pos.x = pos.x + 4
			minetest.add_node(pos, {name = "base:wood"})

			pos.z = pos.z + 1
			pos.x = pos.x + 3
			minetest.add_node(pos, {name = "base:wood"})

			pos.y = pos.y + 1
			minetest.add_node(pos, {name = "base:wood"})

			pos.y = pos.y - 2
			minetest.add_node(pos, {name = "base:wood"})

			pos.y = pos.y + 3
			pos.z = pos.z - 4

			for a = 1, 7 do
				pos.z = pos.z + 1
				minetest.add_node(pos, {name = "base:wood"})
			end

			pos.z = pos.z - 3

			for a = 1, 2 do
				pos.y = pos.y + 1
				minetest.add_node(pos, {name = "base:wood"})
			end

			pos.y = pos.y + 1
			pos.z = pos.z - 3

			for a = 1, 5 do
				pos.z = pos.z + 1
				minetest.add_node(pos, {name = "base:wood"})
			end

			pos.y = pos.y + 1
			pos.z = pos.z - 2
			minetest.add_node(pos, {name = "base:wood"})

			pos.y = pos.y - 7
			pos.z = pos.z + 1
			pos.x = pos.x - 2
			minetest.add_node(pos, {name = "australia:woodshipchest"})

		else
			return
		end
	end
})
