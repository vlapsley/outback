--[[
	Core miscellaneous nodes
--]]

minetest.register_node("core:cloud", {
	description = "Cloud",
	tiles = {"core_cloud.png"},
	is_ground_content = false,
	sounds = core.node_sound_defaults(),
	groups = {not_in_creative_inventory = 1},
})

