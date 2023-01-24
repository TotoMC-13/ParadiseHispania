/obj/item/photo/attack(mob/living/carbon/M, mob/living/carbon/user, def_zone)
	if(!ishuman(M))
		return ..()
	var/mob/living/carbon/human/H = M
	if(user.zone_selected == "eyes")
		user.visible_message("<span class='notice'>[user] holds up a photo and shows it to [H].</span>",
			"<span class='notice'>You show the photo to [H].</span>")
		show(H)
	else
		return ..()

/// Camera Helmet

/obj/item/clothing/head/camerahelmet
	name = "camera helmet"
	desc = "A piece of headgear with a video camera attached to it, its able to send live feed to the entertainment network."
	icon = 'modular_hispania/icons/obj/clothing/head/helmet.dmi'
	icon_state = "camerahelmet"
	item_state = "camerahelmet"
	var/on = FALSE
	var/obj/machinery/camera/camera
	var/icon_on = "camerahelmet_on"
	var/icon_off = "camerahelmet"
	var/canhear_range = 7

	sprite_sheets = list(
		"Human" = 'modular_hispania/icons/mob/clothing/head/helmet.dmi',
		"Kidan" ='modular_hispania/icons/mob/clothing/head/helmet.dmi',
		"Slime People" ='modular_hispania/icons/mob/clothing/head/helmet.dmi',
		"Machine" ='modular_hispania/icons/mob/clothing/head/helmet.dmi',
		"Skrell" ='modular_hispania/icons/mob/clothing/head/helmet.dmi',
		"Diona" ='modular_hispania/icons/mob/clothing/head/helmet.dmi',
		"Grey" = 'modular_hispania/icons/mob/clothing/species/grey/gloves.dmi',
		"Nian" = 'modular_hispania/icons/mob/clothing/head/helmet.dmi',
		"Tajaran" = 'modular_hispania/icons/mob/clothing/head/helmet.dmi',
		"Vulpkanin" = 'modular_hispania/icons/mob/clothing/head/helmet.dmi',
		"Unathi" = 'modular_hispania/icons/mob/clothing/head/helmet.dmi',
		"Vox" = 'modular_hispania/icons/mob/clothing/head/helmet.dmi',
		"Drask" = 'modular_hispania/icons/mob/clothing/head/helmet.dmi',
		"Kidan" = 'modular_hispania/icons/mob/clothing/head/helmet.dmi'
	)

	actions_types = list(/datum/action/item_action/toggle_camera_helmet)

/obj/item/clothing/head/camerahelmet/ui_action_click(mob/user, actiontype)
    if(actiontype == /datum/action/item_action/toggle_camera_helmet)
        camera_state(user)

/obj/item/clothing/head/camerahelmet/proc/camera_state(mob/living/carbon/user)
	if(!on)
		on = TRUE
		camera = new /obj/machinery/camera(src)
		icon_state = icon_on
		item_state = icon_on
		camera.network = list("news")
		camera.c_tag = user.name
	else
		on = FALSE
		icon_state = icon_off
		item_state = icon_off
		camera.c_tag = null
		QDEL_NULL(camera)
	visible_message("<span class='notice'>The camera helmet has been turned [on ? "on" : "off"].</span>")
	update_icon()

/obj/item/clothing/head/camerahelmet/attack_self(mob/user)
	camera_state(user)

/obj/item/clothing/head/camerahelmet/dropped()
	. = ..()
	if(!on)
		return
	camera_state()

/obj/item/clothing/head/camerahelmet/examine(mob/user)
	. = ..()
	if(in_range(user, src))
		. += "It's [on ? "" : "in"]active."

/obj/item/clothing/head/camerahelmet/hear_talk(mob/M as mob, list/message_pieces)
	var/msg = multilingual_to_message(message_pieces)
	if(camera && on)
		if(get_dist(src, M) <= canhear_range)
			talk_into(M, msg)
		for(var/obj/machinery/computer/security/telescreen/T in GLOB.machines)
			if(T.watchers[M] == camera)
				T.atom_say(msg)

/obj/item/clothing/head/camerahelmet/hear_message(mob/M as mob, msg)
	if(camera && on)
		for(var/obj/machinery/computer/security/telescreen/T in GLOB.machines)
			if(T.watchers[M] == camera)
				T.atom_say(msg)
