--[[
	Mushrooms
--]]


-- Namespace for functions

mushrooms = {}


-- Mushroom registration

minetest.register_node("mushrooms:mushroom_red", {
	description = "Red Mushroom",
	tiles = {"mushrooms_mushroom_red.png"},
	inventory_image = "mushrooms_mushroom_red.png",
	wield_image = "mushrooms_mushroom_red.png",
	drawtype = "plantlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, attached_node = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_use = minetest.item_eat(-5),
	selection_box = {
		type = "fixed",
		fixed = {-4/16, -8/16, -4/16, 4/16, -1/16, 4/16},
	}
})

minetest.register_node("mushrooms:mushroom_brown", {
	description = "Brown Mushroom",
	tiles = {"mushrooms_mushroom_brown.png"},
	inventory_image = "mushrooms_mushroom_brown.png",
	wield_image = "mushrooms_mushroom_brown.png",
	drawtype = "plantlike",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, attached_node = 1, flammable = 1},
	sounds = default.node_sound_leaves_defaults(),
	on_use = minetest.item_eat(1),
	selection_box = {
		type = "fixed",
		fixed = {-3/16, -8/16, -3/16, 3/16, -2/16, 3/16},
	}
})


-- Mushroom spread and death

function mushrooms.mushroom_spread(pos, node)
	if minetest.get_node_light(pos, nil) == 15 then
		minetest.remove_node(pos)
		return
	end
	local positions = minetest.find_nodes_in_area_under_air(
		{x = pos.x - 1, y = pos.y - 2, z = pos.z - 1},
		{x = pos.x + 1, y = pos.y + 1, z = pos.z + 1},
		{"group:soil", "group:tree"})
	if #positions == 0 then
		return
	end
	local pos2 = positions[math.random(#positions)]
	pos2.y = pos2.y + 1
	if minetest.get_node_light(pos, 0.5) <= 3 and
			minetest.get_node_light(pos2, 0.5) <= 3 then
		minetest.set_node(pos2, {name = node.name})
	end
end

minetest.register_abm({
	label = "Mushroom spread",
	nodenames = {"mushrooms:mushroom_brown", "mushrooms:mushroom_red"},
	interval = 11,
	chance = 150,
	action = function(...)
		mushrooms.mushroom_spread(...)
	end,
})

-- Aliases for schematic nodes
minetest.register_alias("flowers:mushroom_brown", "mushrooms:mushroom_brown")
minetest.register_alias("flowers:mushroom_red", "mushrooms:mushroom_red")
