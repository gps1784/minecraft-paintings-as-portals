# tag this beacon, then set a 5 second cooldown (30 fps)
tag @s add teleport_cooldown
scoreboard players set @s PortalCooldown 150

# make sure the nametag is updated
data merge entity @s {CustomName:"\"Portal (cooling down)\"", CustomNameVisible:1b}
