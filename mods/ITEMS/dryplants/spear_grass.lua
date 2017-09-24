--------------------------------------------------------------------------------
-- Grasses - Spear Grass 0.1
--------------------------------------------------------------------------------
-- new code and textures by demon_boy
-- original by Mossmanikin
-- textures & ideas partly by Neuromancer

-- License (everything): 	BSD
-- Contains code from: 		biome_lib
-- Looked at code from:		default, trees
--------------------------------------------------------------------------------

-- NOTES (from wikipedia, some of this might get implemented)
-- rhizomes are edible
-- outer portion of young plants can be peeled and the heart can be eaten raw or boiled and eaten like asparagus
-- leaf bases can be eaten raw or cooked
-- sheath can be removed from the developing green flower spike, which can then be boiled and eaten like corn on the cob
-- pollen can be collected and used as a flour supplement or thickener
-- Typha stems and leaves can be used to make paper
-- The seed hairs were used by some Native American groups as tinder for starting fires

--------------------------------------------------------------------------------
-- SPEAR GRASS SHAPES
--------------------------------------------------------------------------------

abstract_dryplants.grow_spear_grass = function(pos)
	local size = math.random(1,3)
	local spikes = math.random(1,3)
	local pos_01 = {x = pos.x, y = pos.y + 1, z = pos.z}
	local pos_02 = {x = pos.x, y = pos.y + 2, z = pos.z}
	local pos_03 = {x = pos.x, y = pos.y + 3, z = pos.z}
	if minetest.get_node(pos_01).name == "air"  -- bug fix
	or minetest.get_node(pos_01).name == "dryplants:reedmace_sapling" then
		if minetest.get_node(pos_02).name ~= "air" then
			minetest.set_node(pos_01, {name="dryplants:reedmace_top"})
		elseif minetest.get_node(pos_03).name ~= "air" then
			minetest.set_node(pos_01, {name="dryplants:reedmace_height_2"})
		elseif size == 1 then
			minetest.set_node(pos_01, {name="dryplants:reedmace_top"})
		elseif size == 2 then
			minetest.set_node(pos_01, {name="dryplants:reedmace_height_2"})
		elseif size == 3 then
			if spikes == 1 then
				minetest.set_node(pos_01, {name="dryplants:reedmace_height_3_spikes"})
			else
				minetest.set_node(pos_01, {name="dryplants:reedmace_height_3"})
			end
		end
	end
end


--------------------------------------------------------------------------------
-- SPEAR GRASS (Sorghum intrans)
--------------------------------------------------------------------------------
minetest.register_node("dryplants:spear_grass", {
	description = "Spear Grass (Sorghum intrans)",
	drawtype = "plantlike",
	waving = 1,
	visual_scale = 2,
	paramtype = "light",
	tiles = {"dryplants_spear_grass.png"},
	inventory_image = "dryplants_spear_grass.png",
	walkable = false,
	buildable_to = false,
	floodable = true,
	groups = {
		snappy=3,
		flammable=2,
		flora=1,
		attached_node=1
	},
	drop = 'dryplants:spear_grass',
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.5, 0.3}
	},
})

