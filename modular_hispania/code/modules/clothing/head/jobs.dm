///Hispania Job Hats

/*Nota: todos los sprites que sean pertenecientes al code hispania y tengan sus
respectivos sprites en las carpetas de iconos de hispania , es decir icons/hispania
deberan tener una linea de codigo demas para que funcionen "hispania_icon = TRUE"*/



//Captain formal hat by Danaleja
/obj/item/clothing/head/caphat/dark
	name = "captain's formal blue hat"
	desc = "A nice and formal hat made of silk, only for station captains. Made by D&N Corp."
	icon = 'modular_hispania/icons/mob/head.dmi'
	icon_state = "caphat_dark"
	item_state = "caphat_dark"
	hispania_icon = TRUE
	species_restricted = list("exclude", "Grey", "Vox")

/obj/item/clothing/head/caphat/light
	name = "captain's formal white hat"
	desc = "A nice and formal hat made of silk, only for station captains. Made by D&N Corp."
	icon = 'modular_hispania/icons/mob/head.dmi'
	icon_state = "caphat_light"
	item_state = "caphat_light"
	hispania_icon = TRUE
	species_restricted = list("exclude", "Grey", "Vox")

//Private Sec Berets (Danaleja2005)
/obj/item/clothing/head/beret/sec/private
	name = "blue security beret"
	desc = "A blue security beret, its have a badge of Security Department. Made by D&N Corp."
	icon = 'modular_hispania/icons/mob/head.dmi'
	icon_state = "secberetprivateofficer_blue"
	item_state = "secberetprivateofficer_blue"
	hispania_icon = TRUE
	species_restricted = list("exclude", "Vox", "Grey")

/obj/item/clothing/head/beret/sec/private/red
	name = "red security beret"
	desc = "A red security beret, its have a badge of Security Department. Made by D&N Corp."
	icon = 'modular_hispania/icons/mob/head.dmi'
	icon_state = "secberetprivateofficer_red"
	item_state = "secberetprivateofficer_red"
	hispania_icon = TRUE

/obj/item/clothing/head/officer/hat
	name = "officer's blue hat"
	desc = "A blue hat with a badge of Security Department. Made by D&N Corp."
	icon = 'modular_hispania/icons/mob/head.dmi'
	icon_state = "sechat_blue"
	item_state = "sechat_blue"
	strip_delay = 80
	hispania_icon = TRUE
	species_restricted = list("exclude", "Grey")
	sprite_sheets = list(
		"Vox" = 'modular_hispania/icons/mob/species/vox/head.dmi'
		)

/obj/item/clothing/head/officer/hat/red
	name = "officer's red hat"
	desc = "A red hat with a badge of Security Department."
	icon = 'modular_hispania/icons/mob/head.dmi'
	icon_state = "sechat_red"
	item_state = "sechat_red"
	hispania_icon = TRUE

// Chaplain Hats

/obj/item/clothing/head/lady_elzra
	name = "Lady Elzra's Hat"
	desc = "a Lady Elzra's Hat worn by high religious priests of the order of the great lady (lady elzra) made of silk. Made by D&N Corp."
	icon = 'modular_hispania/icons/mob/head.dmi'
	icon_state = "elzrahat"
	item_state = "elzrahat"
	strip_delay = 40
	hispania_icon = TRUE
	flags = BLOCKHEADHAIR
	species_restricted = list("exclude", "Grey")

/obj/item/clothing/head/miter
	name = "Bishop Miter"
	desc = "A miter used by Christian Bishops. Made by D&N Corp."
	icon = 'modular_hispania/icons/mob/head.dmi'
	icon_state = "miter"
	item_state = "miter"
	strip_delay = 40
	hispania_icon = TRUE
	species_restricted = list("exclude", "Grey")

//Re-sprite Code//

/obj/item/clothing/head/HoS
	icon = 'modular_hispania/icons/obj/clothing/head/hats.dmi'
	sprite_sheets = list(
		"Human" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Kidan" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Slime People" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Machine" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Skrell" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Diona" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Nian" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Tajaran" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Vulpkanin" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Unathi" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Grey" = 'modular_hispania/icons/mob/clothing/species/grey/head/hats.dmi',
		"Vox" = 'modular_hispania/icons/mob/clothing/species/vox/head/hats.dmi'
	)

//

/obj/item/clothing/head/HoS/formal
	name = "Head of Security Formal Cap"
	desc = "For some more serious batoning."
	icon_state = "hosformal"

//

/obj/item/clothing/head/HoS/beret
	icon = 'modular_hispania/icons/obj/clothing/head/berets.dmi'
	sprite_sheets = list(
		"Human" = 'modular_hispania/icons/mob/clothing/head/beret.dmi',
		"Kidan" = 'modular_hispania/icons/mob/clothing/head/beret.dmi',
		"Slime People" = 'modular_hispania/icons/mob/clothing/head/beret.dmi',
		"Machine" = 'modular_hispania/icons/mob/clothing/head/beret.dmi',
		"Skrell" = 'modular_hispania/icons/mob/clothing/head/beret.dmi',
		"Diona" = 'modular_hispania/icons/mob/clothing/head/beret.dmi',
		"Tajaran" = 'modular_hispania/icons/mob/clothing/head/beret.dmi',
		"Vulpkanin" = 'modular_hispania/icons/mob/clothing/head/beret.dmi',
		"Unathi" = 'modular_hispania/icons/mob/clothing/head/beret.dmi',
		"Grey" = 'modular_hispania/icons/mob/clothing/species/grey/head/beret.dmi',
		"Vox" = 'modular_hispania/icons/mob/clothing/species/vox/head/beret.dmi'
	)

/obj/item/clothing/head/warden
	icon = 'modular_hispania/icons/obj/clothing/head/hats.dmi'
	sprite_sheets = list(
		"Human" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Kidan" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Slime People" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Machine" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Skrell" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Diona" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Nian" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Tajaran" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Vulpkanin" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Unathi" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Grey" = 'modular_hispania/icons/mob/clothing/species/grey/head/hats.dmi',
		"Vox" = 'modular_hispania/icons/mob/clothing/species/vox/head/hats.dmi'
	)

// Warden Red Hat

/obj/item/clothing/head/warden/red
	icon_state = "wardenred"

//

/obj/item/clothing/head/officer
	icon = 'modular_hispania/icons/obj/clothing/head/hats.dmi'
	icon_state = "sechat"
	sprite_sheets = list(
		"Human" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Kidan" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Slime People" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Machine" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Skrell" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Diona" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Nian" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Tajaran" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Vulpkanin" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Unathi" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Grey" = 'modular_hispania/icons/mob/clothing/species/grey/head/hats.dmi',
		"Vox" = 'modular_hispania/icons/mob/clothing/species/vox/head/hats.dmi'
	)

/obj/item/clothing/head/beret/sec
	icon = 'modular_hispania/icons/obj/clothing/head/berets.dmi'
	sprite_sheets = list(
		"Human" = 'modular_hispania/icons/mob/clothing/head/beret.dmi',
		"Kidan" = 'modular_hispania/icons/mob/clothing/head/beret.dmi',
		"Slime People" = 'modular_hispania/icons/mob/clothing/head/beret.dmi',
		"Machine" = 'modular_hispania/icons/mob/clothing/head/beret.dmi',
		"Skrell" = 'modular_hispania/icons/mob/clothing/head/beret.dmi',
		"Diona" = 'modular_hispania/icons/mob/clothing/head/beret.dmi',
		"Nian" = 'modular_hispania/icons/mob/clothing/head/beret.dmi',
		"Tajaran" = 'modular_hispania/icons/mob/clothing/head/beret.dmi',
		"Vulpkanin" = 'modular_hispania/icons/mob/clothing/head/beret.dmi',
		"Unathi" = 'modular_hispania/icons/mob/clothing/head/beret.dmi',
		"Grey" = 'modular_hispania/icons/mob/clothing/species/grey/head/beret.dmi',
		"Vox" = 'modular_hispania/icons/mob/clothing/species/vox/head/beret.dmi'
	)

/obj/item/clothing/head/det_hat
	icon = 'modular_hispania/icons/obj/clothing/head/hats.dmi'
	sprite_sheets = list(
		"Human" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Kidan" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Slime People" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Machine" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Skrell" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Diona" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Nian" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Tajaran" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Vulpkanin" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Unathi" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Grey" = 'modular_hispania/icons/mob/clothing/species/grey/head/hats.dmi',
		"Vox" = 'modular_hispania/icons/mob/clothing/species/vox/head/hats.dmi'
	)

//Cool Black Hat for the Det Oh yeah

/obj/item/clothing/head/det_hat/black
	icon_state = "detblack"
	name = "Detective Black Fedora"
	desc = "Someone who wears this will look very cool."

/obj/item/clothing/head/beret/med
	icon = 'modular_hispania/icons/obj/clothing/head/berets.dmi'
	sprite_sheets = list(
		"Human" = 'modular_hispania/icons/mob/clothing/head/beret.dmi',
		"Kidan" = 'modular_hispania/icons/mob/clothing/head/beret.dmi',
		"Slime People" = 'modular_hispania/icons/mob/clothing/head/beret.dmi',
		"Machine" = 'modular_hispania/icons/mob/clothing/head/beret.dmi',
		"Skrell" = 'modular_hispania/icons/mob/clothing/head/beret.dmi',
		"Diona" = 'modular_hispania/icons/mob/clothing/head/beret.dmi',
		"Nian" = 'modular_hispania/icons/mob/clothing/head/beret.dmi',
		"Tajaran" = 'modular_hispania/icons/mob/clothing/head/beret.dmi',
		"Vulpkanin" = 'modular_hispania/icons/mob/clothing/head/beret.dmi',
		"Unathi" = 'modular_hispania/icons/mob/clothing/head/beret.dmi',
		"Grey" = 'modular_hispania/icons/mob/clothing/species/grey/head/beret.dmi',
		"Vox" = 'modular_hispania/icons/mob/clothing/species/vox/head/beret.dmi'
	)

/obj/item/clothing/head/beret/med/paramedic
	name = "paramedic beret"
	desc = "a blue beret with a white cross, wear by paramedic and EMT teams."
	icon_state = "paramed"
	item_state = "paramed"
	item_color = "paramed"

/obj/item/clothing/head/surgery
	icon = 'modular_hispania/icons/obj/clothing/head/hats.dmi'
	sprite_sheets = list(
		"Human" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Kidan" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Slime People" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Machine" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Skrell" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Diona" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Nian" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Tajaran" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Vulpkanin" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Unathi" = 'modular_hispania/icons/mob/clothing/head/hats.dmi',
		"Grey" = 'modular_hispania/icons/mob/clothing/species/grey/head/hats.dmi',
		"Vox" = 'modular_hispania/icons/mob/clothing/species/vox/head/hats.dmi'
	)
