-- support for i18n
local S = plantlife_i18n.gettext

-- nodes

minetest.register_node("woodsoils:dirt_with_leaves_1", {
	description = S("Forest Soil 1"),
	tiles = {
		"base_dirt.png^woodsoils_ground_cover.png",
		"base_dirt.png",
		"base_dirt.png^woodsoils_ground_cover_side.png"},
	is_ground_content = true,
	groups = {
		crumbly=3,
		soil=1--,
		--not_in_creative_inventory=1
	},
	drop = 'base:dirt',
	sounds = base.node_sound_dirt_defaults({
		footstep = {name="base_grass_footstep", gain=0.4},
	}),
})

minetest.register_node("woodsoils:dirt_with_leaves_2", {
	description = S("Forest Soil 2"),
	tiles = {
		"woodsoils_ground.png",
		"base_dirt.png",
		"base_dirt.png^woodsoils_ground_side.png"},
	is_ground_content = true,
	groups = {
		crumbly=3,
		soil=1--,
		--not_in_creative_inventory=1
	},
	drop = 'base:dirt',
	sounds = base.node_sound_dirt_defaults({
		footstep = {name="base_grass_footstep", gain=0.4},
	}),
})

minetest.register_node("woodsoils:grass_with_leaves_1", {
	description = S("Forest Soil 3"),
	tiles = {
		"base_grass.png^woodsoils_ground_cover2.png",
		"base_dirt.png",
		"base_dirt.png^base_grass_side.png^woodsoils_ground_cover_side2.png"},
	is_ground_content = true,
	groups = {
		crumbly=3,
		soil=1--,
		--not_in_creative_inventory=1
	},
	drop = 'base:dirt',
	sounds = base.node_sound_dirt_defaults({
		footstep = {name="base_grass_footstep", gain=0.4},
	}),
})

minetest.register_node("woodsoils:grass_with_leaves_2", {
	description = S("Forest Soil 4"),
	tiles = {
		"base_grass.png^woodsoils_ground_cover.png",
		"base_dirt.png",
		"base_dirt.png^base_grass_side.png^woodsoils_ground_cover_side.png"},
	is_ground_content = true,
	groups = {
		crumbly=3,
		soil=1--,
		--not_in_creative_inventory=1
	},
	drop = 'base:dirt',
	sounds = base.node_sound_dirt_defaults({
		footstep = {name="base_grass_footstep", gain=0.4},
	}),
})

