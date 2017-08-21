--[[
	Mushrooms
--]]

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
		fixed = {-4 / 16, -0.5, -4 / 16, 4 / 16, -1 / 16, 4 / 16},
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
		fixed = {-3 / 16, -0.5, -3 / 16, 3 / 16, -2 / 16, 3 / 16},
	}
})


-- Mushroom spread and death

minetest.register_abm({
	label = "Mushroom spread",
	nodenames = {"mushrooms:mushroom_brown", "mushrooms:mushroom_red"},
	interval = 11,
	chance = 50,
	action = function(pos, node)
		if minetest.get_node_light(pos, nil) == 15 then
			minetest.remove_node(pos)
			return
		end
		local random = {
			x = pos.x + math.random(-2, 2),
			y = pos.y + math.random(-1, 1),
			z = pos.z + math.random(-2, 2)
		}
		local random_node = minetest.get_node_or_nil(random)
		if not random_node or random_node.name ~= "air" then
			return
		end
		local node_under = minetest.get_node_or_nil({x = random.x,
			y = random.y - 1, z = random.z})
		if not node_under then
			return
		end

		if (minetest.get_item_group(node_under.name, "soil") ~= 0 or
				minetest.get_item_group(node_under.name, "tree") ~= 0) and
				minetest.get_node_light(pos, 0.5) <= 3 and
				minetest.get_node_light(random, 0.5) <= 3 then
			minetest.set_node(random, {name = node.name})
		end
	end
})

