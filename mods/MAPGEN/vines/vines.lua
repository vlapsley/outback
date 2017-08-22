-- support for i18n
local S = plantlife_i18n.gettext

vines.register_vine( 'root', {
  description = S("Roots"),
  average_length = 9,
},{
  choose_random_wall = true,
  avoid_nodes = {"vines:root_middle"},
  avoid_radius = 5,
  spawn_delay = 500,
  spawn_chance = 10,
  spawn_surfaces = {
    "base:dirt_with_grass",
    "base:dirt"
  },
  spawn_on_bottom = true,
  plantlife_limit = -0.6,
  humidity_min = 0.4,
})

vines.register_vine( 'vine', {
  description = S("Vines"),
  average_length = 5,
},{
  choose_random_wall = true,
  avoid_nodes = {"group:vines"},
  avoid_radius = 5,
  spawn_delay = 500,
  spawn_chance = 100,
  spawn_surfaces = {
    "australia:merbau_leaves"
  },
  spawn_on_bottom = true,
  plantlife_limit = -0.9,
  humidity_min = 0.7,
})

vines.register_vine( 'side', {
  description = S("Vines"),
  average_length = 6,
},{
  choose_random_wall = true,
  avoid_nodes = {"group:vines", "base:apple"},
  avoid_radius = 3,
  spawn_delay = 500,
  spawn_chance = 100,
  spawn_surfaces = {
    "australia:merbau_leaves"
  },
  spawn_on_side = true,
  plantlife_limit = -0.9,
  humidity_min = 0.4,
})

vines.register_vine( "merbau", {
  description = S("Rainforest Vines"),
  average_length = 7,
},{
  choose_random_wall = true,
  neighbors = {
    "australia:merbau_leaves"
  },
  avoid_nodes = {
    "vines:merbau_middle",
    "vines:merbau_end",
  },
  avoid_radius = 5,
  spawn_delay = 500,
  spawn_chance = 100,
  spawn_surfaces = {
    "australia:merbau_tree"
  },
  spawn_on_side = true,
  plantlife_limit = -0.9,
  humidity_min = 0.2,
})

