/obj/item/clothing/shoes/jackboots/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/stack/tape_roll))
		var/obj/item/stack/tape_roll/TR = I
		if(TR.use(4))
			to_chat(user, "You tape the soles of [src] to silence your footsteps.")
			if(istype(src, /obj/item/clothing/shoes/jackboots/jacksandals))
				new /obj/item/clothing/shoes/jackboots_silent/jacksandals_silent(get_turf(user))
			else
				new /obj/item/clothing/shoes/jackboots_silent(get_turf(user))
			qdel(src)
	else
		return ..()

/obj/item/clothing/shoes/jackboots_silent
	name = "jackboots"
	desc = "Nanotrasen-issue Security combat boots for combat scenarios or combat situations. All combat, all the time."
	can_cut_open = 1
	icon_state = "jackboots"
	item_state = "jackboots"
	item_color = "hosred"
	strip_delay = 50
	put_on_delay = 50
	resistance_flags = NONE

/obj/item/clothing/shoes/jackboots_silent/jacksandals_silent
	name = "jacksandals"
	desc = "Nanotrasen-issue Security combat sandals for combat scenarios. They're jacksandals, however that works."
	can_cut_open = 0
	icon_state = "jacksandal"
	item_color = "jacksandal"

/obj/item/clothing/shoes/swagshoes
	name = "swag shoes"
	desc = "They got me for my foams!"
	icon = 'modular_hispania/icons/mob/feet.dmi'
	hispania_icon = TRUE
	icon_state = "SwagShoes"
	item_color = "SwagShoes"
	species_restricted = list("Human", "Slime", "Machine", "Kidan", "Skrell", "Diona" ) //VOX CANT HAVE THIS MUCH SWAG

//Re-Sprite Code

/obj/item/clothing/shoes/jackboots
	icon = 'modular_hispania/icons/obj/clothing/shoes.dmi'
	sprite_sheets = list(
		"Human" = 'modular_hispania/icons/mob/clothing/shoes.dmi',
		"Kidan" = 'modular_hispania/icons/mob/clothing/shoes.dmi',
		"Slime People" = 'modular_hispania/icons/mob/clothing/shoes.dmi',
		"Machine" = 'modular_hispania/icons/mob/clothing/shoes.dmi',
		"Skrell" = 'modular_hispania/icons/mob/clothing/shoes.dmi',
		"Diona" = 'modular_hispania/icons/mob/clothing/shoes.dmi',
		"Nian" = 'modular_hispania/icons/mob/clothing/shoes.dmi',
		"Tajaran" = 'modular_hispania/icons/mob/clothing/shoes.dmi',
		"Vulpkanin" = 'modular_hispania/icons/mob/clothing/shoes.dmi',
		"Unathi" = 'modular_hispania/icons/mob/clothing/shoes.dmi',
		"Grey" = 'modular_hispania/icons/mob/clothing/species/grey/shoes.dmi',
		"Vox" = 'modular_hispania/icons/mob/clothing/species/vox/shoes.dmi'
	)
