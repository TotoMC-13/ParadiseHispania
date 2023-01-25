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

/obj/item/clothing/head/helmet/camerahelmet
	name = "camera helmet"
	desc = "A piece of headgear with a video camera attached to it, its able to send live feed to the entertainment network."
	icon = 'modular_hispania/icons/obj/clothing/head/helmet.dmi'
	icon_state = "camerahelmet"
	item_state = "camerahelmet"
	hispania_icon = TRUE
	var/on = FALSE
	var/obj/machinery/camera/camera
	var/icon_on = "camerahelmet_on"
	var/icon_off = "camerahelmet"
	var/canhear_range = 7

	actions_types = list(/datum/action/item_action/toggle)

/obj/item/clothing/head/helmet/camerahelmet/ui_action_click(mob/user,toggle)
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
	update_icon(UPDATE_ICON_STATE)
	user.update_icon()
	user.update_inv_head()
	user.update_action_buttons_icon()

/obj/item/clothing/head/helmet/camerahelmet/dropped()
	. = ..()
	if(!on)
		return

/obj/item/clothing/head/helmet/camerahelmet/examine(mob/user)
	. = ..()
	if(in_range(user, src))
		. += "It's [on ? "" : "in"]active."

/obj/item/clothing/head/helmet/camerahelmet/hear_talk(mob/M as mob, list/message_pieces)
	var/msg = multilingual_to_message(message_pieces)
	if(camera && on)
		if(get_dist(src, M) <= canhear_range)
			talk_into(M, msg)
		for(var/obj/machinery/computer/security/telescreen/T in GLOB.machines)
			if(!(isemptylist(T.watchers))) //hay al menos 1 viewer, hablemos!
				T.atom_say(msg)
