local S = minetest.get_translator("cheese")
local CHEESE_ORE_NAME = "cheese:stone_with_cheese"
local CHEESE_BLOCK_NAME = "cheese:cheeseblock"
local CHEESE_SWORD_NAME = "cheese:sword_cheese"
local CHEESE_PICKAXE_NAME = "cheese:pick_cheese"
local CHEESE_SHOVEL_NAME = "cheese:shovel_cheese"

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

--
-- Tools
--
minetest.register_tool(CHEESE_SWORD_NAME, {
    description = S("Cheese Sword"),
    inventory_image = "cheese_tool_cheesesword.png",
    tool_capabilities = {
        full_punch_interval = 0.7,
        max_drop_level = 1,
        groupcaps = {
            snappy = {
                -- I'm currently trying to understand what exactly this does. Halp.
                times = { [1]=2.5, [2]=1.20, [3]=0.35 },
                uses = 30,
                maxlevel = 2,
            },
        },
        damage_groups = { fleshy = 6 },
    },
    sound = { breaks = "default_tool_breaks" },
    groups = { sword = 1 },
})
minetest.register_tool(CHEESE_PICKAXE_NAME, {
    description = S("Cheese Pickaxe"),
    inventory_image = "cheese_tool_cheesepick.png",
    tool_capabilities = {
        full_punch_interval = 0.9,
        max_drop_level = 1,
        groupcaps = {
            cracky = {
                times = { [1]=4.00, [2]=1.60, [3]=0.80 },
                uses = 20,
                maxlevel = 2,
            },
        },
        damage_groups = { fleshy = 3 },
    },
    sound = { breaks = "default_tool_breaks" },
    groups = { pickaxe = 1 },
})
minetest.register_tool(CHEESE_SHOVEL_NAME, {
    description = S("Cheese Shovel"),
    inventory_image = "cheese_tool_cheeseshovel.png",
    wield_image = "cheese_tool_cheeseshovel.png^[transformR90",
    tool_capabilities = {
        full_punch_interval = 1.0,
        max_drop_level = 1,
        groupcaps = {
            crumbly = {
                times = { [1]=1.50, [2]=0.90, [3]=0.40 },
                uses = 30,
                maxlevel = 2,
            },
        },
        damage_groups = { fleshy = 3 },
    },
    sound = { breaks = "default_tool_breaks" },
    groups = { shovel = 1 },
})


--
-- Nodes
--

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
-- Cheese block - for storage and decoration (and possibly portal?)
minetest.register_node(CHEESE_BLOCK_NAME, {
    description = S("Cheese Block"),
    tiles = {
        "cheese_cheese_block_top_bottom.png",
        "cheese_cheese_block_top_bottom.png",
        "cheese_cheese_block_sides.png",
    },
    groups = { cracky = 2, oddly_breakable_by_hand = 1 },
})


--
-- Recipes
--

-- Block
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
-- Tools
minetest.register_craft({
    output = CHEESE_SWORD_NAME,
    recipe = {
        { cheese_item_name },
        { cheese_item_name },
        { "group:stick" },
    }
})
minetest.register_craft({
    output = CHEESE_PICKAXE_NAME,
    recipe = {
        { cheese_item_name, cheese_item_name, cheese_item_name },
        { "", "group:stick", "" },
        { "", "group:stick", "" },
    }
})
minetest.register_craft({
    output = CHEESE_SHOVEL_NAME,
    recipe = {
        { cheese_item_name },
        { "group:stick" },
        { "group:stick" },
    }
})

--
-- Ore
--
minetest.register_ore({
    ore_type = "scatter",
    ore = CHEESE_ORE_NAME,
    wherein = "default:stone",
    clust_scarcity = 7 * 7 * 7,
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
