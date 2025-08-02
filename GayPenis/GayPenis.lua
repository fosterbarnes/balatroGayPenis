--- STEAMODDED HEADER
--- MOD_NAME: GayPenis
--- MOD_ID: GayPenis
--- MOD_AUTHOR: [FosterBarnes, THEGODBOYYT]
--- MOD_DESCRIPTION: Turns Straights -> Gay and Venus -> Penis (Now with Anus)
--- BADGE_COLOR: FF46A2
--- DISPLAY_NAME: Hehe, Penis

----------------------------------------------
------------MOD CODE -------------------------

-- Function to recursively print tables
function printTable(tbl, indent)
    indent = indent or 0
    local indentStr = string.rep("  ", indent)

    for key, value in pairs(tbl) do
        if type(value) == "table" then
            sendDebugMessage(indentStr .. tostring(key) .. " (table):")
            printTable(value, indent + 1)
        else
            sendDebugMessage(indentStr .. tostring(key) .. ": " .. tostring(value))
        end
    end
end

function SMODS.INIT.GayPenis()
    sendDebugMessage("Gay Penis is ready to FUCK")

    -- Print all contents of G.localization.misc
    if G and G.localization and G.localization.misc then
        sendDebugMessage("Iterating over G.localization.misc:")
        printTable(G.localization.misc)
    else
        sendDebugMessage("G.localization.misc is not available")
    end

    -- Modify atlas for consumables
    SMODS.Atlas {
        key = 'Penis',
        path = 'Tarots.png',
        px = 71,
        py = 95,
    }
    SMODS.Atlas {
        key = 'Anus',
        path = 'Tarots.png',
        px = 71,
        py = 95,
    }
    SMODS.Consumable:take_ownership('c_venus', {
        atlas = 'Penis', 
        pos = {x=1,y=3},
    })
    SMODS.Consumable:take_ownership('c_uranus', {
        atlas = 'Anus', 
        pos = {x=6,y=3},
    })

    -- Modify localization for poker hands
    if G and G.localization and G.localization.misc and G.localization.misc.poker_hands then
        G.localization.misc.poker_hands['Straight Flush'] = "Gay Flush"
        G.localization.misc.poker_hands['Straight'] = "Gay"
        G.localization.descriptions.Planet.c_venus.name = "Penis"
        G.localization.descriptions.Planet.c_uranus.name = "Anus"
        sendDebugMessage("Homosexuality complete.")
    else
        sendDebugMessage("Homophobia has blocked this Gay Penis... smh")
    end
end

----------------------------------------------
------------MOD CODE END----------------------
