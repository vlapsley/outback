--
-- All biome API mapgens
--

local function register_flower(seed, flower_name)
	minetest.register_decoration({
		name = "flowers:"..flower_name,
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = -0.02,
			scale = 0.04,
			spread = {x = 200, y = 200, z = 200},
			seed = seed,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"grassland", "deciduous_forest", "floatland_grassland"},
		y_max = 31000,
		y_min = 1,
		decoration = "flowers:"..flower_name,
	})
end

local function register_mushroom(mushroom_name)
	minetest.register_decoration({
		name = "flowers:"..mushroom_name,
		deco_type = "simple",
		place_on = {"default:dirt_with_grass", "default:dirt_with_coniferous_litter"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.006,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"deciduous_forest", "coniferous_forest",
			"floatland_coniferous_forest"},
		y_max = 31000,
		y_min = 1,
		decoration = "flowers:"..mushroom_name,
	})
end

function flowers.register_decorations()
	register_flower(436,     "rose")
	register_flower(19822,   "tulip")
	register_flower(1220999, "dandelion_yellow")
	register_flower(800081,  "chrysanthemum_green")
	register_flower(36662,   "geranium")
	register_flower(1133,    "viola")
	register_flower(73133,   "dandelion_white")
	register_flower(42,      "tulip_black")
	register_mushroom("mushroom_brown")
	register_mushroom("mushroom_red")
end


--
-- Detect mapgen to select functions
--

flowers.register_decorations()
