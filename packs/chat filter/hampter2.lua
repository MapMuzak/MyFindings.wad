name = "hampter2"
description = "less bloated hive skywars experience"
author = "hampter"

local mutedPrefixes = {
    ["Minimum height for building is 0 blocks"] = true,
    ["§b§l» §r§7§7Finding you a game of"] = true,
    ["§d§l» §r§bThe §dMystery Chest §bwas opened by"] = true,
    ["§a§l» §r§7"] = true,
	["§6[§e!§6]"] = true,
    ["§b§l» §r§7You voted for"] = true,
    ["§h§l» §r§aYour thorns inflicted"] = true,
    ["§6§l» §r§7A statue of kill leader"] = true
}

local mutedPostfixes = {
    ["§b§l» §r§7We'll find a new game shortly..."] = true,
    ["§c§l» §r§cYou're below the playable area. §7Please go back up!"] = true,
    ["§c§l» §r§cYou can't teleport outside the play region!"] = true,
    ["§b§l» §r§a§lVoting has ended!"] = true,
    ["§7votes!"] = true,
    ["§c§l» §r§cThis is a custom server."] = true,
    ["§c§l» §r§7Stats will not save this round!"] = true,
    ["Team!"] = true,
    ["§cLast Life! §eNo more respawns remaining..."] = true,
    ["Team is the WINNER!"] = true,
    ["Team are the WINNERS!"] = true,
    ["§a§l» §rYou have unused unlocks in your Locker!"] = true,
    ["§7§l» §rGather resources by mining lucky ores and claiming the mystery chest. Last team standing wins!"] = true,
    ["§7seconds left of warmup!"] = true,
    ["§a§l» §r§7Warmup over and borders removed! §eFight!"] = true,
    ["§8§l» §r§7Resource Ore: §7Drops helpful resources, like arrows"] = true,
    ["§8§l» §r§eLucky Ore: §7Drops a wide range of items... §oif you're lucky!"] = true,
    ["§8§l» §r§dSpell Ore: §f1 §7in §f4 §7chance to spawn a §dspellbook"] = true,
    ["§8§l» §r§bDiamond Ore: §7Drops a random §bdiamond §7tier item"] = true,
    ["§8§l» §r§aEnchanted Ore: §7Drops a random enchanted item"] = true,
    ["§8§l» §r§cHealth Ore: §7Grants you extra hearts up to a max of 5"] = true,
    ["more seconds§c!"] = true,
    ["§c§l» §r§cYou can't use that during warmup!"] = true,
    ["§c§l» §r§bMinimum play height now §aactive§b! §7§oBeing below the map for too long will now damage you"] = true,
    ["§7minutes remain"] = true,
    ["§7seconds remain"] = true,
    ["§9§l» §r§7§oNo spellbook for you! Maybe next time?"] = true,
    ["§d§l» §r§3You cast §bSpell of Fire Trail§3, igniting the next §e10§3 blocks you step off"] = true,
    ["§d§l» §r§3You cast §bSpell of Swiftness§3, granting you §eSpeed§3 for §f5 seconds"] = true,
    ["§a§l» §r§cYou cast §flife giving§c, healing you for §64 hearts"] = true,
    ["§c§l» §r§7You already have full health!"] = true,
    ["§c§l» §r§cYou can only have §65 extra hearts §cactive!"] = true,
    ["§c§l» §r§cThis Boom Box is not throwable!"] = true,
    ["§c§l» §r§cYou can only throw a Boom Box every §f4 seconds"] = true,
    ["§7§l» §r§3You were hit with an §bicy blast§3..."] = true,
    ["§7§l» §r§aYou were infected with §epoison§a..."] = true,
    ["§h§l» §r§aYou were hit by a wave of §efire§a..."] = true,
    ["§7has been §cELIMINATED§7!"] = true,
    ["§c§l» §r§6You killed the kill leader! §8[+10 XP]"] = true,
    ["§gis the new kill leader!"] = true,
    ["hearts from health-on-kill."] = true,
    ["§aYou respawned."] = true,
    ["§c§l» §r§cYou can't place blocks outside the play region!"] = true,
    ["§6§l» §r§7§oThat wasn't very lucky..."] = true,
    ["§7§l» §r§7Your tracking compass is pointing to the nearest player."] = true,
    ["§eblindness§7..."] = true,
    ["How unlucky..."] = true,
    ["You shot a lightning bolt!"] = true,
    ["You shot an ender pearl!"] = true,
    ["You shot scatter shot arrows!"] = true,
    ["You shot a poison arrow!"] = true,
    ["You shot a slowness arrow!"] = true,
    ["You shot a blindness arrow!"] = true,
    ["You shot a boom box!"] = true
}

onEvent("ChatReceiveEvent", function(message, sender, type)
    for prefix, _ in pairs(mutedPrefixes) do
        if message:sub(1, #prefix) == prefix then
            return true
        end
    end
    
    for postfix, _ in pairs(mutedPostfixes) do
        if #postfix <= #message and message:sub(-#postfix) == postfix then
            return true
        end
    end
    
    return false
end)