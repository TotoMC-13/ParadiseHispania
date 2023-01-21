
//Re-Sprite Code

/obj/item/storage/belt/security
	icon = 'modular_hispania/icons/obj/clothing/belts.dmi'
	sprite_sheets = list(
		"Human" = 'modular_hispania/icons/mob/clothing/belt.dmi',
		"Kidan" = 'modular_hispania/icons/mob/clothing/belt.dmi',
		"Slime People" = 'modular_hispania/icons/mob/clothing/belt.dmi',
		"Machine" = 'modular_hispania/icons/mob/clothing/belt.dmi',
		"Skrell" = 'modular_hispania/icons/mob/clothing/belt.dmi',
		"Diona" = 'modular_hispania/icons/mob/clothing/belt.dmi',
		"Nian" = 'modular_hispania/icons/mob/clothing/belt.dmi',
		"Tajaran" = 'modular_hispania/icons/mob/clothing/belt.dmi',
		"Vulpkanin" = 'modular_hispania/icons/mob/clothing/belt.dmi',
		"Unathi" = 'modular_hispania/icons/mob/clothing/belt.dmi',
		"Grey" = 'modular_hispania/icons/mob/clothing/species/grey/belt.dmi',
	)
	var/list/hispa_can_hold = list(/obj/item/taperoll)

/obj/item/storage/belt/medical
	icon = 'modular_hispania/icons/obj/clothing/belts.dmi'
	sprite_sheets = list(
		"Human" = 'modular_hispania/icons/mob/clothing/belt.dmi',
		"Kidan" = 'modular_hispania/icons/mob/clothing/belt.dmi',
		"Slime People" = 'modular_hispania/icons/mob/clothing/belt.dmi',
		"Machine" = 'modular_hispania/icons/mob/clothing/belt.dmi',
		"Skrell" = 'modular_hispania/icons/mob/clothing/belt.dmi',
		"Diona" = 'modular_hispania/icons/mob/clothing/belt.dmi',
		"Nian" = 'modular_hispania/icons/mob/clothing/belt.dmi',
		"Tajaran" = 'modular_hispania/icons/mob/clothing/belt.dmi',
		"Vulpkanin" = 'modular_hispania/icons/mob/clothing/belt.dmi',
		"Unathi" = 'modular_hispania/icons/mob/clothing/belt.dmi',
		"Grey" = 'modular_hispania/icons/mob/clothing/species/grey/belt.dmi',
	)

/obj/item/storage/belt/security/Initialize(mapload)
	can_hold |= hispa_can_hold
	..()

/obj/item/storage/belt/utility
	var/list/hispa_can_hold = list(/obj/item/taperoll)

/obj/item/storage/belt/utility/Initialize(mapload)
	can_hold |= hispa_can_hold
	..()

