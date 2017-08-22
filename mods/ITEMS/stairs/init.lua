-- Minetest 0.4 mod: stairs
-- See README.txt for licensing and other information.


-- Global namespace for functions

stairs = {}


-- Register aliases for new pine node names

minetest.register_alias("stairs:stair_pinewood", "stairs:stair_pine_wood")
minetest.register_alias("stairs:slab_pinewood", "stairs:slab_pine_wood")


-- Get setting for replace ABM

local replace = minetest.settings:get_bool("enable_stairs_replace_abm")

local function rotate_and_place(itemstack, placer, pointed_thing)
	local p0 = pointed_thing.under
	local p1 = pointed_thing.above
	local param2 = 0

	local placer_pos = placer:getpos()
	if placer_pos then
		param2 = minetest.dir_to_facedir(vector.subtract(p1, placer_pos))
	end

	local finepos = minetest.pointed_thing_to_face_pos(placer, pointed_thing)
	local fpos = finepos.y % 1

	if p0.y - 1 == p1.y or (fpos > 0 and fpos < 0.5)
			or (fpos < -0.5 and fpos > -0.999999999) then
		param2 = param2 + 20
		if param2 == 21 then
			param2 = 23
		elseif param2 == 23 then
			param2 = 21
		end
	end
	return minetest.item_place(itemstack, placer, pointed_thing, param2)
end

-- Register stairs.
-- Node will be called stairs:stair_<subname>

function stairs.register_stair(subname, recipeitem, groups, images, description, sounds)
	groups.stair = 1
	minetest.register_node(":stairs:stair_" .. subname, {
		description = description,
		drawtype = "mesh",
		mesh = "stairs_stair.obj",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = groups,
		sounds = sounds,
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
				{-0.5, 0, 0, 0.5, 0.5, 0.5},
			},
		},
		collision_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
				{-0.5, 0, 0, 0.5, 0.5, 0.5},
			},
		},
		on_place = function(itemstack, placer, pointed_thing)
			if pointed_thing.type ~= "node" then
				return itemstack
			end

			return rotate_and_place(itemstack, placer, pointed_thing)
		end,
	})

	-- for replace ABM
	if replace then
		minetest.register_node(":stairs:stair_" .. subname .. "upside_down", {
			replace_name = "stairs:stair_" .. subname,
			groups = {slabs_replace = 1},
		})
	end

	if recipeitem then
		minetest.register_craft({
			output = 'stairs:stair_' .. subname .. ' 8',
			recipe = {
				{recipeitem, "", ""},
				{recipeitem, recipeitem, ""},
				{recipeitem, recipeitem, recipeitem},
			},
		})

		-- Flipped recipe for the silly minecrafters
		minetest.register_craft({
			output = 'stairs:stair_' .. subname .. ' 8',
			recipe = {
				{"", "", recipeitem},
				{"", recipeitem, recipeitem},
				{recipeitem, recipeitem, recipeitem},
			},
		})

		-- Fuel
		local baseburntime = minetest.get_craft_result({
			method = "fuel",
			width = 1,
			items = {recipeitem}
		}).time
		if baseburntime > 0 then
			minetest.register_craft({
				type = "fuel",
				recipe = 'stairs:stair_' .. subname,
				burntime = math.floor(baseburntime * 0.75),
			})
		end
	end
end


-- Slab facedir to placement 6d matching table
local slab_trans_dir = {[0] = 8, 0, 2, 1, 3, 4}

-- Register slabs.
-- Node will be called stairs:slab_<subname>

function stairs.register_slab(subname, recipeitem, groups, images, description, sounds)
	groups.slab = 1
	minetest.register_node(":stairs:slab_" .. subname, {
		description = description,
		drawtype = "nodebox",
		tiles = images,
		paramtype = "light",
		paramtype2 = "facedir",
		is_ground_content = false,
		groups = groups,
		sounds = sounds,
		node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		},
		on_place = function(itemstack, placer, pointed_thing)
			local under = minetest.get_node(pointed_thing.under)
			local wield_item = itemstack:get_name()
			local creative_enabled = (creative and creative.is_enabled_for
					and creative.is_enabled_for(placer:get_player_name()))

			if under and under.name:find("stairs:slab_") then
				-- place slab using under node orientation
				local dir = minetest.dir_to_facedir(vector.subtract(
					pointed_thing.above, pointed_thing.under), true)

				local p2 = under.param2

				-- combine two slabs if possible
				if slab_trans_dir[math.floor(p2 / 4)] == dir
						and wield_item == under.name then

					if not recipeitem then
						return itemstack
					end
					local player_name = placer:get_player_name()
					if minetest.is_protected(pointed_thing.under, player_name) and not
							minetest.check_player_privs(placer, "protection_bypass") then
						minetest.record_protection_violation(pointed_thing.under,
							player_name)
						return
					end
					minetest.set_node(pointed_thing.under, {name = recipeitem, param2 = p2})
					if not creative_enabled then
						itemstack:take_item()
					end
					return itemstack
				end

				-- Placing a slab on an upside down slab should make it right-side up.
				if p2 >= 20 and dir == 8 then
					p2 = p2 - 20
				-- same for the opposite case: slab below normal slab
				elseif p2 <= 3 and dir == 4 then
					p2 = p2 + 20
				end

				-- else attempt to place node with proper param2
				minetest.item_place_node(ItemStack(wield_item), placer, pointed_thing, p2)
				if not creative_enabled then
					itemstack:take_item()
				end
				return itemstack
			else
				return rotate_and_place(itemstack, placer, pointed_thing)
			end
		end,
	})

	-- for replace ABM
	if replace then
		minetest.register_node(":stairs:slab_" .. subname .. "upside_down", {
			replace_name = "stairs:slab_".. subname,
			groups = {slabs_replace = 1},
		})
	end

	if recipeitem then
		minetest.register_craft({
			output = 'stairs:slab_' .. subname .. ' 6',
			recipe = {
				{recipeitem, recipeitem, recipeitem},
			},
		})

		-- Fuel
		local baseburntime = minetest.get_craft_result({
			method = "fuel",
			width = 1,
			items = {recipeitem}
		}).time
		if baseburntime > 0 then
			minetest.register_craft({
				type = "fuel",
				recipe = 'stairs:slab_' .. subname,
				burntime = math.floor(baseburntime * 0.5),
			})
		end
	end
end


-- Optionally replace old "upside_down" nodes with new param2 versions.
-- Disabled by default.

if replace then
	minetest.register_abm({
		label = "Slab replace",
		nodenames = {"group:slabs_replace"},
		interval = 16,
		chance = 1,
		action = function(pos, node)
			node.name = minetest.registered_nodes[node.name].replace_name
			node.param2 = node.param2 + 20
			if node.param2 == 21 then
				node.param2 = 23
			elseif node.param2 == 23 then
				node.param2 = 21
			end
			minetest.set_node(pos, node)
		end,
	})
end


-- Stair/slab registration function.
-- Nodes will be called stairs:{stair,slab}_<subname>

function stairs.register_stair_and_slab(subname, recipeitem,
		groups, images, desc_stair, desc_slab, sounds)
	stairs.register_stair(subname, recipeitem, groups, images, desc_stair, sounds)
	stairs.register_slab(subname, recipeitem, groups, images, desc_slab, sounds)
end


-- Register default stairs and slabs

stairs.register_stair_and_slab(
	"wood",
	"core:wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"core_wood.png"},
	"Wooden Stair",
	"Wooden Slab",
	core.node_sound_wood_defaults()
)

stairs.register_stair_and_slab(
	"junglewood",
	"core:junglewood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"core_junglewood.png"},
	"Jungle Wood Stair",
	"Jungle Wood Slab",
	core.node_sound_wood_defaults()
)

stairs.register_stair_and_slab(
	"pine_wood",
	"core:pine_wood",
	{choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	{"core_pine_wood.png"},
	"Pine Wood Stair",
	"Pine Wood Slab",
	core.node_sound_wood_defaults()
)

stairs.register_stair_and_slab(
	"acacia_wood",
	"core:acacia_wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"core_acacia_wood.png"},
	"Acacia Wood Stair",
	"Acacia Wood Slab",
	core.node_sound_wood_defaults()
)

stairs.register_stair_and_slab(
	"aspen_wood",
	"core:aspen_wood",
	{choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	{"core_aspen_wood.png"},
	"Aspen Wood Stair",
	"Aspen Wood Slab",
	core.node_sound_wood_defaults()
)

stairs.register_stair_and_slab(
	"stone",
	"core:stone",
	{cracky = 3},
	{"core_stone.png"},
	"Stone Stair",
	"Stone Slab",
	core.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"cobble",
	"core:cobble",
	{cracky = 3},
	{"core_cobble.png"},
	"Cobblestone Stair",
	"Cobblestone Slab",
	core.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"mossycobble",
	nil,
	{cracky = 3},
	{"core_mossycobble.png"},
	"Mossy Cobblestone Stair",
	"Mossy Cobblestone Slab",
	core.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"stonebrick",
	"core:stonebrick",
	{cracky = 2},
	{"core_stone_brick.png"},
	"Stone Brick Stair",
	"Stone Brick Slab",
	core.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"stone_block",
	"core:stone_block",
	{cracky = 2},
	{"core_stone_block.png"},
	"Stone Block Stair",
	"Stone Block Slab",
	core.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"desert_stone",
	"core:desert_stone",
	{cracky = 3},
	{"core_desert_stone.png"},
	"Desert Stone Stair",
	"Desert Stone Slab",
	core.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"desert_cobble",
	"core:desert_cobble",
	{cracky = 3},
	{"core_desert_cobble.png"},
	"Desert Cobblestone Stair",
	"Desert Cobblestone Slab",
	core.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"desert_stonebrick",
	"core:desert_stonebrick",
	{cracky = 2},
	{"core_desert_stone_brick.png"},
	"Desert Stone Brick Stair",
	"Desert Stone Brick Slab",
	core.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"desert_stone_block",
	"core:desert_stone_block",
	{cracky = 2},
	{"core_desert_stone_block.png"},
	"Desert Stone Block Stair",
	"Desert Stone Block Slab",
	core.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"sandstone",
	"core:sandstone",
	{crumbly = 1, cracky = 3},
	{"core_sandstone.png"},
	"Sandstone Stair",
	"Sandstone Slab",
	core.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"sandstonebrick",
	"core:sandstonebrick",
	{cracky = 2},
	{"core_sandstone_brick.png"},
	"Sandstone Brick Stair",
	"Sandstone Brick Slab",
	core.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"sandstone_block",
	"core:sandstone_block",
	{cracky = 2},
	{"core_sandstone_block.png"},
	"Sandstone Block Stair",
	"Sandstone Block Slab",
	core.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"desert_sandstone",
	"core:desert_sandstone",
	{crumbly = 1, cracky = 3},
	{"core_desert_sandstone.png"},
	"Desert Sandstone Stair",
	"Desert Sandstone Slab",
	core.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"desert_sandstone_brick",
	"core:desert_sandstone_brick",
	{cracky = 2},
	{"core_desert_sandstone_brick.png"},
	"Desert Sandstone Brick Stair",
	"Desert Sandstone Brick Slab",
	core.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"desert_sandstone_block",
	"core:desert_sandstone_block",
	{cracky = 2},
	{"core_desert_sandstone_block.png"},
	"Desert Sandstone Block Stair",
	"Desert Sandstone Block Slab",
	core.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"silver_sandstone",
	"core:silver_sandstone",
	{crumbly = 1, cracky = 3},
	{"core_silver_sandstone.png"},
	"Silver Sandstone Stair",
	"Silver Sandstone Slab",
	core.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"silver_sandstone_brick",
	"core:silver_sandstone_brick",
	{cracky = 2},
	{"core_silver_sandstone_brick.png"},
	"Silver Sandstone Brick Stair",
	"Silver Sandstone Brick Slab",
	core.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"silver_sandstone_block",
	"core:silver_sandstone_block",
	{cracky = 2},
	{"core_silver_sandstone_block.png"},
	"Silver Sandstone Block Stair",
	"Silver Sandstone Block Slab",
	core.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"obsidian",
	"core:obsidian",
	{cracky = 1, level = 2},
	{"core_obsidian.png"},
	"Obsidian Stair",
	"Obsidian Slab",
	core.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"obsidianbrick",
	"core:obsidianbrick",
	{cracky = 1, level = 2},
	{"core_obsidian_brick.png"},
	"Obsidian Brick Stair",
	"Obsidian Brick Slab",
	core.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"obsidian_block",
	"core:obsidian_block",
	{cracky = 1, level = 2},
	{"core_obsidian_block.png"},
	"Obsidian Block Stair",
	"Obsidian Block Slab",
	core.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"brick",
	"core:brick",
	{cracky = 3},
	{"core_brick.png"},
	"Brick Stair",
	"Brick Slab",
	core.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"straw",
	"farming:straw",
	{snappy = 3, flammable = 4},
	{"farming_straw.png"},
	"Straw Stair",
	"Straw Slab",
	core.node_sound_leaves_defaults()
)

stairs.register_stair_and_slab(
	"steelblock",
	"core:steelblock",
	{cracky = 1, level = 2},
	{"core_steel_block.png"},
	"Steel Block Stair",
	"Steel Block Slab",
	core.node_sound_metal_defaults()
)

stairs.register_stair_and_slab(
	"copperblock",
	"core:copperblock",
	{cracky = 1, level = 2},
	{"core_copper_block.png"},
	"Copper Block Stair",
	"Copper Block Slab",
	core.node_sound_metal_defaults()
)

stairs.register_stair_and_slab(
	"bronzeblock",
	"core:bronzeblock",
	{cracky = 1, level = 2},
	{"core_bronze_block.png"},
	"Bronze Block Stair",
	"Bronze Block Slab",
	core.node_sound_metal_defaults()
)

stairs.register_stair_and_slab(
	"goldblock",
	"core:goldblock",
	{cracky = 1},
	{"core_gold_block.png"},
	"Gold Block Stair",
	"Gold Block Slab",
	core.node_sound_metal_defaults()
)

stairs.register_stair_and_slab(
	"ice",
	"core:ice",
	{cracky = 3, puts_out_fire = 1, cools_lava = 1},
	{"core_ice.png"},
	"Ice Stair",
	"Ice Slab",
	core.node_sound_glass_defaults()
)

stairs.register_stair_and_slab(
	"snowblock",
	"core:snowblock",
	{crumbly = 3, puts_out_fire = 1, cools_lava = 1, snowy = 1},
	{"core_snow.png"},
	"Snow Block Stair",
	"Snow Block Slab",
	core.node_sound_dirt_defaults({
		footstep = {name = "core_snow_footstep", gain = 0.15},
		dug = {name = "core_snow_footstep", gain = 0.2},
		dig = {name = "core_snow_footstep", gain = 0.2}
	})
)
