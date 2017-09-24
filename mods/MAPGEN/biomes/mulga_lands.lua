--[[
	Mulga Lands
--]]


-- localize math routines for performance
local math_random = math.random

-- mulga lands
minetest.register_biome({
	name =             "mulga_lands",
	node_top =         "default:dirt_with_dry_grass",
	depth_top =        1,
	node_filler =      "base:red_dirt",
	depth_filler =     2,
	node_stone =       "default:stone",
	node_river_water = "base:muddy_water_source",
	node_riverbed =    "default:dirt",
	depth_riverbed =   1,
	y_min =            4,
	y_max =            31000,
	heat_point =       62,
	humidity_point =   75,
})


--[[
	Ores
--]]

-- Blob ore first to avoid other ores inside blobs

-- Copper (Mount Isa)
minetest.register_ore({
	ore_type =        "blob",
	ore =             "default:stone_with_copper",
	wherein =         {"default:stone"},
	clust_scarcity =  85184,
	clust_size =      8,
	biomes =          {"mulga_lands"},
	y_min =           -31,
	y_max =           36,
	noise_threshold = 1.3,
	noise_params =    {
		offset =  0,
		scale =   3,
		spread =  {x = 16, y = 16, z = 16},
		seed =    555,
		octaves = 3,
		persist = 0.6
	},
})

-- Lead (Mount Isa)
minetest.register_ore({
	ore_type =        "blob",
	ore =             "technic:mineral_lead",
	wherein =         {"default:stone"},
	clust_scarcity =  85184,
	clust_size =      8,
	biomes =          {"mulga_lands"},
	y_min =           -31,
	y_max =           36,
	noise_threshold = 1,
	noise_params =    {
		offset =  0,
		scale =   3,
		spread =  {x = 16, y = 16, z = 16},
		seed =    556,
		octaves = 3,
		persist = 0.6
	},
})

-- Silver (Mount Isa)
minetest.register_ore({
	ore_type =        "blob",
	ore =             "base:stone_with_silver",
	wherein =         {"default:stone"},
	clust_scarcity =  85184,
	clust_size =      8,
	biomes =          {"mulga_lands"},
	y_min =           -31,
	y_max =           36,
	noise_threshold = 1,
	noise_params =    {
		offset =  0,
		scale =   3,
		spread =  {x = 16, y = 16, z = 16},
		seed =    557,
		octaves = 3,
		persist = 0.6
	},
})

-- Zinc (Mount Isa)
minetest.register_ore({
	ore_type =        "blob",
	ore =             "technic:mineral_zinc",
	wherein =         {"default:stone"},
	clust_scarcity =  85184,
	clust_size =      8,
	biomes =          {"mulga_lands"},
	y_min =           -31,
	y_max =           36,
	noise_threshold = 1,
	noise_params =    {
		offset =  0,
		scale =   3,
		spread =  {x = 16, y = 16, z = 16},
		seed =    558,
		octaves = 3,
		persist = 0.6
	},
})


--[[
	Decorations
--]]

-- Grass
local function register_dry_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		deco_type =     "simple",
		place_on =      {"default:dirt_with_dry_grass"},
		sidelen =       16,
		noise_params =  {
			offset =   offset,
			scale =    scale,
			spread =   {x = 200, y = 200, z = 200},
			seed =     329,
			octaves =  3,
			persist =  0.6
		},
		biomes =        {"mulga_lands"},
		y_min =         4,
		y_max =         240,
		decoration =    "default:dry_grass_"..length,
	})
end

register_dry_grass_decoration(0.01, 0.2,  5)
register_dry_grass_decoration(0.03, 0.06,  4)
register_dry_grass_decoration(0.05, 0.02,  3)
register_dry_grass_decoration(0.07, -0.01, 2)
register_dry_grass_decoration(0.09, -0.03, 1)

-- Grass near rivers
local function register_rivergrass(length)
	plants_api.register_plant({
		nodes =     {"default:grass_"..length},
		cover =     0.33,
		density =   0.5,
		priority =  25,
		check = function(t, pos)
			return t.v2 > 0 and t.v2 < 0.02 and pos.y >= 4 and pos.y <= 240 and table.contains({"mulga_lands"}, t.biome)
		end,
	})
end

register_rivergrass(5)
register_rivergrass(4)

-- Bush Tomato
plants_api.register_plant({
	nodes =     {"base:tomato_bush"},
	cover =     0.0003,
	density =   0.01,
	priority =  30,
	check = function(t, pos)
		return t.valleys > 0.25 and pos.y >= 15 and pos.y <= 153 and table.contains({"mulga_lands"}, t.biome)
	end,
})

-- Mitchell Grass
plants_api.register_plant({
	nodes =     {"base:mitchell_grass"},
	cover =     0.01,
	density =   0.01,
	priority =  35,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.2 and pos.y >= 5 and pos.y <= 70 and table.contains({"mulga_lands"}, t.biome)
	end,
})

-- Small stone rocks
local function register_small_stone_rocks(number)
	minetest.register_decoration({
		deco_type =   "simple",
		decoration =  "base:small_stone_rocks"..number,
		sidelen =     80,
		place_on =    {"default:dirt_with_dry_grass"},
		fill_ratio =  0.001,
		y_min =       24,
		biomes =      {"mulga_lands"},
		flags =       "place_center_x, place_center_z",
		rotation =    "random",
	})
end

register_small_stone_rocks(6)
register_small_stone_rocks(5)
register_small_stone_rocks(4)
register_small_stone_rocks(3)
register_small_stone_rocks(2)
register_small_stone_rocks(1)


--[[
	Trees
--]]

-- Coolabah Tree
plants_api.register_plant({
	nodes = {
		trunk =   "base:coolabah_tree",
		leaves =  "base:coolabah_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.0025,
	density =   0.001,
	priority =  40,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.02 and pos.y >= 5 and pos.y < 60 and table.contains({"mulga_lands"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(7, 9)
		local radius =  math_random(4, 5)
		local limbs =   true
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- Mulga Tree
plants_api.register_plant({
	nodes = {
		trunk =   "base:mulga_tree",
		leaves =  "base:mulga_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.01,
	density =   0.1,
	priority =  80,
	check = function(t, pos)
		return pos.y >= 5 and pos.y <= 30 and table.contains({"mulga_lands"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(4, 6)
		local radius =  math_random(2, 3)
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Quandong
plants_api.register_plant({
	nodes = {
		trunk =   "base:quandong_tree",
		leaves =  "base:quandong_leaves",
		fruit =   "base:quandong",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.0005,
	density =   0.0025,
	priority =  50,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.03 and pos.y >= 10 and pos.y <= 77 and table.contains({"mulga_lands"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =        math_random(2, 3)
		local radius =        2
		local limbs =         nil
		local fruit_chance =  0.2
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs, fruit_chance, nodes.fruit)
	end,
})

-- Quandong
plants_api.register_plant({
	nodes = {
		trunk =   "base:quandong_tree",
		leaves =  "base:quandong_leaves",
		fruit =   "base:quandong",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.0005,
	density =   0.001,
	priority =  50,
	check = function(t, pos)
		return t.v4 > 0.5 and pos.y >= 10 and pos.y <= 77 and table.contains({"mulga_lands"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =        math_random(2, 3)
		local radius =        2
		local limbs =         nil
		local fruit_chance =  0.1
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs, fruit_chance, nodes.fruit)
	end,
})

-- River Oak
plants_api.register_plant({
	nodes = {
		trunk =   "base:river_oak_tree",
		leaves =  "base:river_oak_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.005,
	density =   0.0025,
	priority =  30,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.05 and pos.y >= 40 and pos.y <= 120 and table.contains({"mulga_lands"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(10, 12)
		local radius =  math_random(3, 4)
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- River Red Gum
plants_api.register_plant({
	nodes = {
		trunk =   "base:river_red_gum_tree",
		leaves =  "base:river_red_gum_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.001,
	density =   0.001,
	priority =  25,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.02 and pos.y >= 5 and pos.y <= 72 and table.contains({"mulga_lands"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(10, 15)
		local radius =  math_random(5, 7)
		local limbs =   true
		base.make_river_red_gum(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore, limbs)
	end,
})

-- Shoestring Acacia
plants_api.register_plant({
	nodes = {
		trunk =   "base:shoestring_acacia_tree",
		leaves =  "base:shoestring_acacia_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.001,
	density =   0.005,
	priority =  60,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.05 and pos.y >= 5 and pos.y <= 50 and table.contains({"mulga_lands"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(3, 5)
		local radius =  math_random(3, 4)
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})

-- Shoestring Acacia
plants_api.register_plant({
	nodes = {
		trunk =   "base:shoestring_acacia_tree",
		leaves =  "base:shoestring_acacia_leaves",
		air =     "air",
		ignore =  "ignore",
	},
	cover =     0.001,
	density =   0.005,
	priority =  60,
	check = function(t, pos)
		return t.v2 > 0 and t.v2 < 0.2 and t.v4 > 0.5 and pos.y >= 5 and pos.y <= 50 and table.contains({"mulga_lands"}, t.biome)
	end,
	grow = function(nodes, pos, data, area)
		local height =  math_random(3, 5)
		local radius =  math_random(3, 4)
		base.make_tree(pos, data, area, height, radius, nodes.trunk, nodes.leaves, nodes.air, nodes.ignore)
	end,
})
