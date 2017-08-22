--[[
	Base miscellaneous nodes
--]]

minetest.register_node("base:cloud", {
	description = "Cloud",
	tiles = {"base_cloud.png"},
	is_ground_content = false,
	sounds = base.node_sound_defaults(),
	groups = {not_in_creative_inventory = 1},
})

