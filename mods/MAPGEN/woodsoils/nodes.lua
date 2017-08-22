-- support for i18n
local S = plantlife_i18n.gettext

-- nodes

minetest.register_node("woodsoils:dirt_with_leaves_1", {
	description = S("Forest Soil 1"),
	tiles = {
		"core_dirt.png^woodsoils_ground_cover.png",
		"core_dirt.png",
		"core_dirt.png^woodsoils_ground_cover_side.png"},
	is_ground_content = true,
	groups = {
		crumbly=3,
		soil=1--,
		--not_in_creative_inventory=1
	},
	drop = 'core:dirt',
	sounds = core.node_sound_dirt_defaults({
		footstep = {name="core_grass_footstep", gain=0.4},
	}),
})

minetest.register_node("woodsoils:dirt_with_leaves_2", {
	description = S("Forest Soil 2"),
	tiles = {
		"woodsoils_ground.png",
		"core_dirt.png",
		"core_dirt.png^woodsoils_ground_side.png"},
	is_ground_content = true,
	groups = {
		crumbly=3,
		soil=1--,
		--not_in_creative_inventory=1
	},
	drop = 'core:dirt',
	sounds = core.node_sound_dirt_defaults({
		footstep = {name="core_grass_footstep", gain=0.4},
	}),
})

minetest.register_node("woodsoils:grass_with_leaves_1", {
	description = S("Forest Soil 3"),
	tiles = {
		"core_grass.png^woodsoils_ground_cover2.png",
		"core_dirt.png",
		"core_dirt.png^core_grass_side.png^woodsoils_ground_cover_side2.png"},
	is_ground_content = true,
	groups = {
		crumbly=3,
		soil=1--,
		--not_in_creative_inventory=1
	},
	drop = 'core:dirt',
	sounds = core.node_sound_dirt_defaults({
		footstep = {name="core_grass_footstep", gain=0.4},
	}),
})

minetest.register_node("woodsoils:grass_with_leaves_2", {
	description = S("Forest Soil 4"),
	tiles = {
		"core_grass.png^woodsoils_ground_cover.png",
		"core_dirt.png",
		"core_dirt.png^core_grass_side.png^woodsoils_ground_cover_side.png"},
	is_ground_content = true,
	groups = {
		crumbly=3,
		soil=1--,
		--not_in_creative_inventory=1
	},
	drop = 'core:dirt',
	sounds = core.node_sound_dirt_defaults({
		footstep = {name="core_grass_footstep", gain=0.4},
	}),
})

