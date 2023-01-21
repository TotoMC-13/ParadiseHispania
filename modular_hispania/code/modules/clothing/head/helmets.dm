/obj/item/clothing/head/helmet/riot/rangerh
	name = "Ranger security helmet"
	icon = 'modular_hispania/icons/mob/head.dmi'
	icon_state = "riot_rangerw"
	item_state = "riot_rangerw"
	flags = BLOCKHAIR
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	hispania_icon = TRUE
	species_restricted = list("Human", "Slime", "Machine", "Kidan", "Skrell", "Diona" )

/obj/item/clothing/head/big_chungus
	name = "funny rabbit head"
	desc = "For some reason, seeing this fluffy helmet with its shit-grin smile and fat ears makes you fucking livid, as if you are embedded with the rage of one-thousand hells."
	icon = 'modular_hispania/icons/mob/head.dmi'
	icon_state = "chungus"
	item_state = "chungus"
	flags = BLOCKHAIR
	hispania_icon = TRUE
	species_restricted = list("Human", "Slime", "Machine", "Kidan", "Skrell", "Diona" )

/obj/item/clothing/head/helmet
	drop_sound = 'modular_hispania/sound/items/helmet_drop.ogg'
	pickup_sound = 'modular_hispania/sound/items/helmet_pickup.ogg'

/obj/item/clothing/head/det_hat
	drop_sound = 'modular_hispania/sound/items/hat_drop.ogg'
	pickup_sound = 'modular_hispania/sound/items/hat_pickup.ogg'


//Re-sprite Code//

/obj/item/clothing/head/helmet
	icon = 'modular_hispania/icons/obj/clothing/head/helmet.dmi'
	sprite_sheets = list(
		"Human" = 'modular_hispania/icons/mob/clothing/head/helmet.dmi',
		"Kidan" = 'modular_hispania/icons/mob/clothing/head/helmet.dmi',
		"Slime People" = 'modular_hispania/icons/mob/clothing/head/helmet.dmi',
		"Machine" = 'modular_hispania/icons/mob/clothing/head/helmet.dmi',
		"Skrell" = 'modular_hispania/icons/mob/clothing/head/helmet.dmi',
		"Nian"	= 'modular_hispania/icons/mob/clothing/head/helmet.dmi',
		"Tajaran" = 'modular_hispania/icons/mob/clothing/head/helmet.dmi',
		"Vulpkanin" = 'modular_hispania/icons/mob/clothing/head/helmet.dmi',
		"Diona" = 'modular_hispania/icons/mob/clothing/head/helmet.dmi',
		"Unathi" = 'modular_hispania/icons/mob/clothing/head/helmet.dmi',
		"Grey" = 'modular_hispania/icons/mob/clothing/species/grey/head/helmet.dmi',
		"Vox" = 'modular_hispania/icons/mob/clothing/species/vox/head/helmet.dmi'
	)

/obj/item/clothing/head/helmet/space  //to not have invisible sprites
	icon = 'icons/obj/clothing/hats.dmi'
	sprite_sheets = list(
		"Human" = 'icons/mob/clothing/head.dmi',
		"Vox" = 'icons/mob/clothing/species/vox/helmet.dmi',
		"Drask" = 'icons/mob/clothing/species/drask/helmet.dmi',
		"Grey" = 'icons/mob/clothing/species/grey/helmet.dmi'
		)

