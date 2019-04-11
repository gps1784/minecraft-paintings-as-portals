scoreboard players remove @s PortalWarmupT 1
scoreboard players operation @s PortalWarmup = @s PortalWarmupT
scoreboard players operation @s PortalWarmup /= __30 Ints
execute as @s at @s run title @a[distance=..2] title ["Teleporting in ",{"score":{"name":"@e[tag=teleport_paired,limit=1,sort=nearest]","objective":"PortalWarmup"}}]
execute as @s at @s if score @s PortalWarmupT <= __zero Ints run function teleport_beacons__0_1:beacon_do
