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
	"base:wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"base_wood.png"},
	"Wooden Stair",
	"Wooden Slab",
	base.node_sound_wood_defaults()
)

stairs.register_stair_and_slab(
	"junglewood",
	"base:junglewood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"base_junglewood.png"},
	"Jungle Wood Stair",
	"Jungle Wood Slab",
	base.node_sound_wood_defaults()
)

stairs.register_stair_and_slab(
	"pine_wood",
	"base:pine_wood",
	{choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	{"base_pine_wood.png"},
	"Pine Wood Stair",
	"Pine Wood Slab",
	base.node_sound_wood_defaults()
)

stairs.register_stair_and_slab(
	"acacia_wood",
	"base:acacia_wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"base_acacia_wood.png"},
	"Acacia Wood Stair",
	"Acacia Wood Slab",
	base.node_sound_wood_defaults()
)

stairs.register_stair_and_slab(
	"aspen_wood",
	"base:aspen_wood",
	{choppy = 3, oddly_breakable_by_hand = 2, flammable = 3},
	{"base_aspen_wood.png"},
	"Aspen Wood Stair",
	"Aspen Wood Slab",
	base.node_sound_wood_defaults()
)

stairs.register_stair_and_slab(
	"stone",
	"base:stone",
	{cracky = 3},
	{"base_stone.png"},
	"Stone Stair",
	"Stone Slab",
	base.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"cobble",
	"base:cobble",
	{cracky = 3},
	{"base_cobble.png"},
	"Cobblestone Stair",
	"Cobblestone Slab",
	base.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"mossycobble",
	nil,
	{cracky = 3},
	{"base_mossycobble.png"},
	"Mossy Cobblestone Stair",
	"Mossy Cobblestone Slab",
	base.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"stonebrick",
	"base:stonebrick",
	{cracky = 2},
	{"base_stone_brick.png"},
	"Stone Brick Stair",
	"Stone Brick Slab",
	base.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"stone_block",
	"base:stone_block",
	{cracky = 2},
	{"base_stone_block.png"},
	"Stone Block Stair",
	"Stone Block Slab",
	base.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"diorite",
	"base:diorite",
	{cracky = 2},
	{"base_diorite.png"},
	"Diorite Stair",
	"Diorite Slab",
	base.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"granite",
	"base:granite",
	{cracky = 2},
	{"base_granite.png"},
	"Granite Stair",
	"Granite Slab",
	base.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"marble",
	"base:marble",
	{cracky = 2},
	{"base_marble.png"},
	"Marble Stair",
	"Marble Slab",
	base.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"marble_brick",
	"base:marble_brick",
	{cracky = 2},
	{"base_marble_brick.png"},
	"Marble Brick Stair",
	"Marble Brick Slab",
	base.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"sandstone",
	"base:sandstone",
	{crumbly = 1, cracky = 3},
	{"base_sandstone.png"},
	"Sandstone Stair",
	"Sandstone Slab",
	base.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"sandstonebrick",
	"base:sandstonebrick",
	{cracky = 2},
	{"base_sandstone_brick.png"},
	"Sandstone Brick Stair",
	"Sandstone Brick Slab",
	base.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"sandstone_block",
	"base:sandstone_block",
	{cracky = 2},
	{"base_sandstone_block.png"},
	"Sandstone Block Stair",
	"Sandstone Block Slab",
	base.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"desert_sandstone",
	"base:desert_sandstone",
	{crumbly = 1, cracky = 3},
	{"base_desert_sandstone.png"},
	"Desert Sandstone Stair",
	"Desert Sandstone Slab",
	base.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"desert_sandstone_brick",
	"base:desert_sandstone_brick",
	{cracky = 2},
	{"base_desert_sandstone_brick.png"},
	"Desert Sandstone Brick Stair",
	"Desert Sandstone Brick Slab",
	base.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"desert_sandstone_block",
	"base:desert_sandstone_block",
	{cracky = 2},
	{"base_desert_sandstone_block.png"},
	"Desert Sandstone Block Stair",
	"Desert Sandstone Block Slab",
	base.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"obsidian",
	"base:obsidian",
	{cracky = 1, level = 2},
	{"base_obsidian.png"},
	"Obsidian Stair",
	"Obsidian Slab",
	base.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"obsidianbrick",
	"base:obsidianbrick",
	{cracky = 1, level = 2},
	{"base_obsidian_brick.png"},
	"Obsidian Brick Stair",
	"Obsidian Brick Slab",
	base.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"obsidian_block",
	"base:obsidian_block",
	{cracky = 1, level = 2},
	{"base_obsidian_block.png"},
	"Obsidian Block Stair",
	"Obsidian Block Slab",
	base.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"brick",
	"base:brick",
	{cracky = 3},
	{"base_brick.png"},
	"Brick Stair",
	"Brick Slab",
	base.node_sound_stone_defaults()
)

stairs.register_stair_and_slab(
	"straw",
	"farming:straw",
	{snappy = 3, flammable = 4},
	{"farming_straw.png"},
	"Straw Stair",
	"Straw Slab",
	base.node_sound_leaves_defaults()
)

stairs.register_stair_and_slab(
	"steelblock",
	"base:steelblock",
	{cracky = 1, level = 2},
	{"base_steel_block.png"},
	"Steel Block Stair",
	"Steel Block Slab",
	base.node_sound_metal_defaults()
)

stairs.register_stair_and_slab(
	"copperblock",
	"base:copperblock",
	{cracky = 1, level = 2},
	{"base_copper_block.png"},
	"Copper Block Stair",
	"Copper Block Slab",
	base.node_sound_metal_defaults()
)

stairs.register_stair_and_slab(
	"bronzeblock",
	"base:bronzeblock",
	{cracky = 1, level = 2},
	{"base_bronze_block.png"},
	"Bronze Block Stair",
	"Bronze Block Slab",
	base.node_sound_metal_defaults()
)

stairs.register_stair_and_slab(
	"goldblock",
	"base:goldblock",
	{cracky = 1},
	{"base_gold_block.png"},
	"Gold Block Stair",
	"Gold Block Slab",
	base.node_sound_metal_defaults()
)

stairs.register_stair_and_slab(
	"ice",
	"base:ice",
	{cracky = 3, puts_out_fire = 1, cools_lava = 1},
	{"base_ice.png"},
	"Ice Stair",
	"Ice Slab",
	base.node_sound_glass_defaults()
)

stairs.register_stair_and_slab(
	"snowblock",
	"base:snowblock",
	{crumbly = 3, puts_out_fire = 1, cools_lava = 1, snowy = 1},
	{"base_snow.png"},
	"Snow Block Stair",
	"Snow Block Slab",
	base.node_sound_dirt_defaults({
		footstep = {name = "base_snow_footstep", gain = 0.15},
		dug = {name = "base_snow_footstep", gain = 0.2},
		dig = {name = "base_snow_footstep", gain = 0.2}
	})
)

-- Eucalyptus Wood
stairs.register_stair_and_slab(
	"eucalyptus_wood",
	"base:eucalyptus_wood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"base_eucalyptus_wood.png"},
	"Eucalyptus Wood Stair",
	"Eucalyptus Wood Slab",
	base.node_sound_wood_defaults()
)

-- Blackwood
stairs.register_stair_and_slab(
	"blackwood",
	"base:blackwood",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"base_blackwood.png"},
	"Blackwood Stair",
	"Blackwood Slab",
	base.node_sound_wood_defaults()
)

-- Blue Gum
stairs.register_stair_and_slab(
	"blue_gum",
	"base:blue_gum",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"base_blue_gum.png"},
	"Blue Gum Stair",
	"Blue Gum Slab",
	base.node_sound_wood_defaults()
)

-- Celery-top Pine
stairs.register_stair_and_slab(
	"celery_top_pine",
	"base:celery_top_pine",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	{"base_celery_top_pine.png"},
	"Celery-top Pine Stair",
	"Celery-top Pine Slab",
	base.node_sound_wood_defaults()
)

-- Red Mahogany
stairs.register_stair_and_slab(
	"red_mahogany",
	"base:red_mahogany",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"base_red_mahogany.png"},
	"Red Mahogany Stair",
	"Red Mahogany Slab",
	base.node_sound_wood_defaults()
)

-- Huon Pine
stairs.register_stair_and_slab(
	"huon_pine",
	"base:huon_pine",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	{"base_huon_pine.png"},
	"Huon Pine Stair",
	"Huon Pine Slab",
	base.node_sound_wood_defaults()
)

-- Jarrah
stairs.register_stair_and_slab(
	"jarrah",
	"base:jarrah",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"base_jarrah.png"},
	"Jarrah Stair",
	"Jarrah Slab",
	base.node_sound_wood_defaults()
)

-- Karri
stairs.register_stair_and_slab(
	"karri",
	"base:karri",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"base_karri.png"},
	"Karri Stair",
	"Karri Slab",
	base.node_sound_wood_defaults()
)

-- Marri
stairs.register_stair_and_slab(
	"marri",
	"base:marri",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"base_marri.png"},
	"Marri Stair",
	"Marri Slab",
	base.node_sound_wood_defaults()
)

-- Merbau
stairs.register_stair_and_slab(
	"merbau",
	"base:merbau",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"base_merbau.png"},
	"Merbau Stair",
	"Merbau Slab",
	base.node_sound_wood_defaults()
)

-- Red Gum
stairs.register_stair_and_slab(
	"red_gum",
	"base:red_gum",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"base_red_gum.png"},
	"Red Gum Stair",
	"Red Gum Slab",
	base.node_sound_wood_defaults()
)

-- Southern Sassafras
stairs.register_stair_and_slab(
	"southern_sassafras",
	"base:southern_sassafras",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"base_southern_sassafras.png"},
	"Southern Sassafras Stair",
	"Southern Sassafras Slab",
	base.node_sound_wood_defaults()
)

-- Tasmanian Oak
stairs.register_stair_and_slab(
	"tasmanian_oak",
	"base:tasmanian_oak",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	{"base_tasmanian_oak.png"},
	"Tasmanian Oak Stair",
	"Tasmanian Oak Slab",
	base.node_sound_wood_defaults()
)

-- Tasmanian Myrtle
stairs.register_stair_and_slab(
	"tasmanian_myrtle",
	"base:tasmanian_myrtle",
	{choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	{"base_tasmanian_myrtle.png"},
	"Tasmanian Myrtle Stair",
	"Tasmanian Myrtle Slab",
	base.node_sound_wood_defaults()
)

