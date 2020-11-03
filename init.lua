local S = minetest.get_translator("cheese")
local CHEESE_ORE_NAME = "cheese:stone_with_cheese"
local CHEESE_BLOCK_NAME = "cheese:cheeseblock"

-- The base cheese item used for everything in this mod
-- Adapt to cheese from petz if applicable
local cheese_item_name
if petz then
    cheese_item_name = "petz:cheese"
else
    cheese_item_name = "cheese:cheese_lump"
    minetest.register_craftitem(cheese_item_name, {
        description = S("Cheese Lump"),
        inventory_image = "cheese_cheese_lump.png",
        on_use = minetest.item_eat(2),
    })
end


-- Cheese ore - easy way to find cheese, at least that's what it's supposed to be.
minetest.register_node(CHEESE_ORE_NAME, {
    description = S("Cheese Ore"),
    tiles = { "default_stone.png^cheese_mineral_cheese.png" },
    groups = { cracky = 3 },
    drop = {
        max_items = 4,
        items = {
            {
                items = { cheese_item_name }
            },
            {
                items = { cheese_item_name },
                rarity = 2
            },
            {
                items = { cheese_item_name },
                rarity = 3,
            },
            {
                items = { cheese_item_name },
                rarity = 4,
            },
        },
    },
})
-- Cheese block - for storage and decoration
minetest.register_node(CHEESE_BLOCK_NAME, {
    description = S("Cheese Block"),
    tiles = { "cheese_cheese_block.png" },
    groups = { cracky = 1, oddly_breakable_by_hand = 1 },
})

-- Recipes
minetest.register_craft({
    type = "shapeless",
    output = CHEESE_BLOCK_NAME,
    recipe = {
        cheese_item_name,
        cheese_item_name,
        cheese_item_name,
        cheese_item_name,
        cheese_item_name,
        cheese_item_name,
        cheese_item_name,
        cheese_item_name,
        cheese_item_name,
    },
})
minetest.register_craft({
    type = "shapeless",
    output = cheese_item_name .. " 9",
    recipe = {
        CHEESE_BLOCK_NAME,
    },
})

minetest.register_ore({
    ore_type = "scatter",
    ore = CHEESE_ORE_NAME,
    wherein = "default:stone",
    clust_scarcity = 6 * 6 * 6,
    clust_num_ores = 25,
    clust_size = 5,
    y_max = 256,
    y_min = 128,
})
minetest.register_ore({
    ore_type = "scatter",
    ore = CHEESE_ORE_NAME,
    wherein = "default:stone",
    clust_scarcity = 8 * 8 * 8,
    clust_num_ores = 9,
    clust_size = 3,
    y_max = 127,
    y_min = -127,
})
minetest.register_ore({
    ore_type = "scatter",
    ore = CHEESE_ORE_NAME,
    wherein = "default:stone",
    clust_scarcity = 12 * 12 * 12,
    clust_num_ores = 8,
    clust_size = 3,
    y_max = -128,
    y_min = -512,
})
