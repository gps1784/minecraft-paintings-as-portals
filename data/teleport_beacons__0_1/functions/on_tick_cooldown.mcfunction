scoreboard players remove @s PortalCooldown 1
execute at @s run particle smoke ~ ~ ~ 0.1 0.4 0.1 0 1
execute at @s if score @s PortalCooldown < __zero Ints run function teleport_beacons__0_1:beacon_enable
