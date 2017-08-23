-- mods/australia_modpack/australia/craftitems.lua


--[[
	Stairs and slabs
--]]

-- Eucalyptus Wood
stairs.register_stair_and_slab(
	"aus_eucalyptus_wood",
	"australia:eucalyptus_wood",
	{snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	{"aus_eucalyptus_wood.png"},
	"Eucalyptus Wood Stair",
	"Eucalyptus Wood Slab",
	base.node_sound_wood_defaults()
)

-- Blackwood
stairs.register_stair_and_slab(
	"aus_blackwood",
	"australia:blackwood",
	{snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	{"aus_blackwood.png"},
	"Blackwood Stair",
	"Blackwood Slab",
	base.node_sound_wood_defaults()
)

-- Blue Gum
stairs.register_stair_and_slab(
	"aus_blue_gum",
	"australia:blue_gum",
	{snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	{"aus_blue_gum.png"},
	"Blue Gum Stair",
	"Blue Gum Slab",
	base.node_sound_wood_defaults()
)

-- Celery-top Pine
stairs.register_stair_and_slab(
	"aus_celery_top_pine",
	"australia:celery_top_pine",
	{snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	{"aus_celery_top_pine.png"},
	"Celery-top Pine Stair",
	"Celery-top Pine Slab",
	base.node_sound_wood_defaults()
)

-- Red Mahogany
stairs.register_stair_and_slab(
	"aus_red_mahogany",
	"australia:red_mahogany",
	{snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	{"aus_red_mahogany.png"},
	"Red Mahogany Stair",
	"Red Mahogany Slab",
	base.node_sound_wood_defaults()
)

-- Huon Pine
stairs.register_stair_and_slab(
	"aus_huon_pine",
	"australia:huon_pine",
	{snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	{"aus_huon_pine.png"},
	"Huon Pine Stair",
	"Huon Pine Slab",
	base.node_sound_wood_defaults()
)

-- Jarrah
stairs.register_stair_and_slab(
	"aus_jarrah",
	"australia:jarrah",
	{snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	{"aus_jarrah.png"},
	"Jarrah Stair",
	"Jarrah Slab",
	base.node_sound_wood_defaults()
)

-- Karri
stairs.register_stair_and_slab(
	"aus_karri",
	"australia:karri",
	{snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	{"aus_karri.png"},
	"Karri Stair",
	"Karri Slab",
	base.node_sound_wood_defaults()
)

-- Marri
stairs.register_stair_and_slab(
	"aus_marri",
	"australia:marri",
	{snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	{"aus_marri.png"},
	"Marri Stair",
	"Marri Slab",
	base.node_sound_wood_defaults()
)

-- Merbau
stairs.register_stair_and_slab(
	"aus_merbau",
	"australia:merbau",
	{snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	{"aus_merbau.png"},
	"Merbau Stair",
	"Merbau Slab",
	base.node_sound_wood_defaults()
)

-- Red Gum
stairs.register_stair_and_slab(
	"aus_red_gum",
	"australia:red_gum",
	{snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	{"aus_red_gum.png"},
	"Red Gum Stair",
	"Red Gum Slab",
	base.node_sound_wood_defaults()
)

-- Southern Sassafras
stairs.register_stair_and_slab(
	"aus_southern_sassafras",
	"australia:southern_sassafras",
	{snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	{"aus_southern_sassafras.png"},
	"Southern Sassafras Stair",
	"Southern Sassafras Slab",
	base.node_sound_wood_defaults()
)

-- Tasmanian Oak
stairs.register_stair_and_slab(
	"aus_tasmanian_oak",
	"australia:tasmanian_oak",
	{snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	{"aus_tasmanian_oak.png"},
	"Tasmanian Oak Stair",
	"Tasmanian Oak Slab",
	base.node_sound_wood_defaults()
)

-- Tasmanian Myrtle
stairs.register_stair_and_slab(
	"aus_tasmanian_myrtle",
	"australia:tasmanian_myrtle",
	{snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, flammable = 3},
	{"aus_tasmanian_myrtle.png"},
	"Tasmanian Myrtle Stair",
	"Tasmanian Myrtle Slab",
	base.node_sound_wood_defaults()
)


--[[
	Fence gates
--]]

-- Eucalyptus Wood
doors.register_fencegate("australia:fencegate_eucalyptus", {
	description = "Eucalyptus Fence Gate",
	texture = "aus_eucalyptus_wood.png",
	material = "australia:eucalyptus_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = base.node_sound_wood_defaults()
})

-- Blackwood
doors.register_fencegate("australia:fencegate_blackwood", {
description = "Blackwood Fence Gate",
	texture = "aus_blackwood.png",
	material = "australia:blackwood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = base.node_sound_wood_defaults()
})

-- Blue Gum
doors.register_fencegate("australia:fencegate_blue_gum", {
description = "Blue Gum Fence Gate",
	texture = "aus_blue_gum.png",
	material = "australia:blue_gum",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = base.node_sound_wood_defaults()
})

-- Celery-top Pine
doors.register_fencegate("australia:fencegate_celery_top_pine", {
description = "Celery-top Pine Fence Gate",
	texture = "aus_celery_top_pine.png",
	material = "australia:celery_top_pine",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = base.node_sound_wood_defaults()
})

-- Red Mahogany
doors.register_fencegate("australia:fencegate_red_mahogany", {
description = "Red Mahogany Fence Gate",
	texture = "aus_red_mahogany.png",
	material = "australia:red_mahogany",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = base.node_sound_wood_defaults()
})

-- Huon Pine
doors.register_fencegate("australia:fencegate_huon_pine", {
description = "Huon Pine Fence Gate",
	texture = "aus_huon_pine.png",
	material = "australia:huon_pine",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = base.node_sound_wood_defaults()
})

-- Jarrah
doors.register_fencegate("australia:fencegate_jarrah", {
description = "Jarrah Fence Gate",
	texture = "aus_jarrah.png",
	material = "australia:jarrah",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = base.node_sound_wood_defaults()
})

-- Karri
doors.register_fencegate("australia:fencegate_karri", {
description = "Karri Fence Gate",
	texture = "aus_karri.png",
	material = "australia:karri",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = base.node_sound_wood_defaults()
})

-- Marri
doors.register_fencegate("australia:fencegate_marri", {
description = "Marri Fence Gate",
	texture = "aus_marri.png",
	material = "australia:marri",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = base.node_sound_wood_defaults()
})

-- Merbau
doors.register_fencegate("australia:fencegate_merbau", {
description = "Merbau Fence Gate",
	texture = "aus_merbau.png",
	material = "australia:merbau",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = base.node_sound_wood_defaults()
})

-- Red Gum
doors.register_fencegate("australia:fencegate_red_gum", {
description = "Red Gum Fence Gate",
	texture = "aus_red_gum.png",
	material = "australia:red_gum",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = base.node_sound_wood_defaults()
})

-- Southern Sassafras
doors.register_fencegate("australia:fencegate_southern_sassafras", {
description = "Southern Sassafras Fence Gate",
	texture = "aus_southern_sassafras.png",
	material = "australia:southern_sassafras",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = base.node_sound_wood_defaults()
})

-- Tasmanian Oak
doors.register_fencegate("australia:fencegate_tasmanian_oak", {
description = "Tasmanian Oak Fence Gate",
	texture = "aus_tasmanian_oak.png",
	material = "australia:tasmanian_oak",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = base.node_sound_wood_defaults()
})

-- Tasmanian Myrtle
doors.register_fencegate("australia:fencegate_tasmanian_myrtle", {
description = "Tasmanian Myrtle Fence Gate",
	texture = "aus_tasmanian_myrtle.png",
	material = "australia:tasmanian_myrtle",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = base.node_sound_wood_defaults()
})
