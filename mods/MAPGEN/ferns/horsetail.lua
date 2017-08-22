-----------------------------------------------------------------------------------------------
-- Archae Plantae - Horsetail 0.0.5
-----------------------------------------------------------------------------------------------
-- by Mossmanikin
-- License (everything): 	WTFPL
-- Contains code from: 		biome_lib
-- Looked at code from:		default, flowers, trees
-- Dependencies: 			biome_lib
-- Supports:				dryplants, stoneage, sumpf
-----------------------------------------------------------------------------------------------

assert(abstract_ferns.config.enable_horsetails == true)

-- support for i18n
local S = plantlife_i18n.gettext
-----------------------------------------------------------------------------------------------
-- HORSETAIL  (EQUISETUM)
-----------------------------------------------------------------------------------------------

local node_names = {}

local function create_nodes()
	local selection_boxes = {
		{ -0.15, -1/2, -0.15, 0.15, -1/16, 0.15 },
		{ -0.15, -1/2, -0.15, 0.15, 1/16, 0.15 },
		{ -0.15, -1/2, -0.15, 0.15, 4/16, 0.15 },
		{ -0.15, -1/2, -0.15, 0.15, 7/16, 0.15 },
	}

	for i = 1, 4 do
		local node_name = "ferns:horsetail_" .. string.format("%02d", i)
		local node_img = "ferns_horsetail_" .. string.format("%02d", i) .. ".png"
		local node_desc
		local node_on_use = nil
		local node_drop = "ferns:horsetail_04"

		if i == 1 then
			node_desc = S("Young Horsetail (Equisetum)")
			node_on_use = minetest.item_eat(1) -- young ones edible https://en.wikipedia.org/wiki/Equisetum
			node_drop = node_name
		elseif i == 4 then
			node_desc = S("Horsetail (Equisetum)")
		else
			node_desc = S("Horsetail (Equisetum)").." ".. string.format("%02d", i)
		end

		node_names[i] = node_name

		minetest.register_node(node_name, {
			description = node_desc,
			drawtype = "plantlike",
			paramtype = "light",
			tiles = { node_img },
			inventory_image = node_img,
			walkable = false,
			buildable_to = true,
			groups = {snappy=3,flammable=2,attached_node=1,horsetail=1},
			sounds = core.node_sound_leaves_defaults(),
			selection_box = {
				type = "fixed",
				fixed = selection_boxes[i],
			},
			on_use = node_on_use,
			drop = node_drop,
		})
	end
end

-----------------------------------------------------------------------------------------------
-- Init
-----------------------------------------------------------------------------------------------

create_nodes()

-----------------------------------------------------------------------------------------------
-- Spawning
-----------------------------------------------------------------------------------------------
if abstract_ferns.config.enable_horsetails_spawning == true then
	biome_lib:spawn_on_surfaces({
		spawn_delay = 1200,
		spawn_plants = node_names,
		spawn_chance = 400,
		spawn_surfaces = {
			"default:dirt_with_grass",
			"default:mossycobble",
			"default:gravel"
		},
		seed_diff = 329,
		min_elevation = 30,
		max_elevation = 120,
		near_nodes = {
			"group:water",
			"default:gravel"
		},
		near_nodes_size = 2,
		near_nodes_vertical = 1,
		near_nodes_count = 1,
		--random_facedir = { 0, 179 },
	})
end

-----------------------------------------------------------------------------------------------
-- Generating
-----------------------------------------------------------------------------------------------

if abstract_ferns.config.enable_horsetails_on_grass == true then
	biome_lib:register_generate_plant({
		surface = {"default:dirt_with_grass"},
		max_count = 35,
		rarity = 40,
		min_elevation = 30,
		max_elevation = 120,
		near_nodes = {
			"group:water", -- likes water (of course)
			"default:gravel", -- near those on gravel
			"default:clay", -- some like clay
			"default:mossycobble",
			"default:cobble"
		},
		near_nodes_size = 3,
		near_nodes_vertical = 2,
		near_nodes_count = 1,
		plantlife_limit = -0.9,
	},
	node_names
	)
end

if abstract_ferns.config.enable_horsetails_on_stones == true then
	biome_lib:register_generate_plant({
		surface = {
			"default:gravel", -- roots go deep
			"default:mossycobble"
		},
		max_count = 35,
		rarity = 20,
		min_elevation = 30,
		max_elevation = 120,
		plantlife_limit = -0.9,
	},
	node_names
	)
end