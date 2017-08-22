--[[
	Core craftitems
--]]

minetest.register_craftitem("core:stick", {
	description = "Stick",
	inventory_image = "core_stick.png",
	groups = {stick = 1, flammable = 2},
})

minetest.register_craftitem("core:paper", {
	description = "Paper",
	inventory_image = "core_paper.png",
	groups = {flammable = 3},
})

minetest.register_craftitem("core:skeleton_key", {
	description = "Skeleton Key",
	inventory_image = "core_key_skeleton.png",
	groups = {key = 1},
	on_use = function(itemstack, user, pointed_thing)
		if pointed_thing.type ~= "node" then
			return itemstack
		end

		local pos = pointed_thing.under
		local node = minetest.get_node(pos)

		if not node then
			return itemstack
		end

		local on_skeleton_key_use = minetest.registered_nodes[node.name].on_skeleton_key_use
		if not on_skeleton_key_use then
			return itemstack
		end

		-- make a new key secret in case the node callback needs it
		local random = math.random
		local newsecret = string.format(
			"%04x%04x%04x%04x",
			random(2^16) - 1, random(2^16) - 1,
			random(2^16) - 1, random(2^16) - 1)

		local secret, _, _ = on_skeleton_key_use(pos, user, newsecret)

		if secret then
			local inv = minetest.get_inventory({type="player", name=user:get_player_name()})

			-- update original itemstack
			itemstack:take_item()

			-- finish and return the new key
			local new_stack = ItemStack("core:key")
			local meta = new_stack:get_meta()
			meta:set_string("secret", secret)
			meta:set_string("description", "Key to "..user:get_player_name().."'s "
				..minetest.registered_nodes[node.name].description)

			if itemstack:get_count() == 0 then
				itemstack = new_stack
			else
				if inv:add_item("main", new_stack):get_count() > 0 then
					minetest.add_item(user:getpos(), new_stack)
				end -- else: added to inventory successfully
			end

			return itemstack
		end
	end
})

minetest.register_craftitem("core:coal_lump", {
	description = "Coal Lump",
	inventory_image = "core_coal_lump.png",
	groups = {coal = 1, flammable = 1}
})

minetest.register_craftitem("core:iron_lump", {
	description = "Iron Lump",
	inventory_image = "core_iron_lump.png",
})

minetest.register_craftitem("core:copper_lump", {
	description = "Copper Lump",
	inventory_image = "core_copper_lump.png",
})

minetest.register_craftitem("core:tin_lump", {
	description = "Tin Lump",
	inventory_image = "core_tin_lump.png",
})

minetest.register_craftitem("core:mese_crystal", {
	description = "Mese Crystal",
	inventory_image = "core_mese_crystal.png",
})

minetest.register_craftitem("core:gold_lump", {
	description = "Gold Lump",
	inventory_image = "core_gold_lump.png",
})

minetest.register_craftitem("core:diamond", {
	description = "Diamond",
	inventory_image = "core_diamond.png",
})

minetest.register_craftitem("core:clay_lump", {
	description = "Clay Lump",
	inventory_image = "core_clay_lump.png",
})

minetest.register_craftitem("core:steel_ingot", {
	description = "Steel Ingot",
	inventory_image = "core_steel_ingot.png",
})

minetest.register_craftitem("core:copper_ingot", {
	description = "Copper Ingot",
	inventory_image = "core_copper_ingot.png",
})

minetest.register_craftitem("core:tin_ingot", {
	description = "Tin Ingot",
	inventory_image = "core_tin_ingot.png",
})

minetest.register_craftitem("core:bronze_ingot", {
	description = "Bronze Ingot",
	inventory_image = "core_bronze_ingot.png",
})

minetest.register_craftitem("core:gold_ingot", {
	description = "Gold Ingot",
	inventory_image = "core_gold_ingot.png"
})

minetest.register_craftitem("core:mese_crystal_fragment", {
	description = "Mese Crystal Fragment",
	inventory_image = "core_mese_crystal_fragment.png",
})

minetest.register_craftitem("core:clay_brick", {
	description = "Clay Brick",
	inventory_image = "core_clay_brick.png",
})

minetest.register_craftitem("core:obsidian_shard", {
	description = "Obsidian Shard",
	inventory_image = "core_obsidian_shard.png",
})

minetest.register_craftitem("core:flint", {
	description = "Flint",
	inventory_image = "core_flint.png"
})

