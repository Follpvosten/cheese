local S = minetest.get_translator("cheese")
local CHEESE_ORE_ID = "cheese:stone_with_cheese"

-- The base cheese item used for everything in this mod
minetest.register_craftitem("cheese:cheese_lump", {
    description = S("Cheese Lump"),
    inventory_image = "cheese_cheese_lump.png",
    on_use = minetest.item_eat(2),
})

-- Cheese ore
minetest.register_node(CHEESE_ORE_ID, {
    description = S("Cheese Ore"),
    tiles = { "default_stone.png^cheese_mineral_cheese.png" },
    groups = { cracky = 3 },
    drop = {
        max_items = 4,
        items = {
            {
                items = { "cheese:cheese_lump" }
            },
            {
                items = { "cheese:cheese_lump" },
                rarity = 2
            },
            {
                items = { "cheese:cheese_lump" },
                rarity = 3,
            },
            {
                items = { "cheese:cheese_lump" },
                rarity = 4,
            },
        },
    },
})

minetest.register_ore({
    ore_type = "scatter",
    ore = CHEESE_ORE_ID,
    wherein = "default:stone",
    clust_scarcity = 5 * 5 * 5,
    clust_num_ores = 30,
    clust_size = 5,
    y_max = 64,
    y_min = -127,
})
minetest.register_ore({
    ore_type = "scatter",
    ore = CHEESE_ORE_ID,
    wherein = "default:stone",
    clust_scarcity = 12 * 12 * 12,
    clust_num_ores = 8,
    clust_size = 3,
    y_max = -128,
    y_min = -31000,
})
