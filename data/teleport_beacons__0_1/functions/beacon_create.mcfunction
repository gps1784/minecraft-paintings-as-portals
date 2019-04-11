tag @s add teleport_beacon
tag @s add teleport_waiting_for_pair

tell @p "Remember: `forceload add ~ ~` so you don't fall into the void!"

# make the name visible in the world
data merge entity @s {CustomName:"\"Portal (unpaired)\"", CustomNameVisible:1b}
