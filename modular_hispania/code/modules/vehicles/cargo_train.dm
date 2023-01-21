/obj/vehicleh/train/cargo/engine
	name = "cargo train tug"
	desc = "A ridable electric car designed for pulling cargo trolleys."
	icon = 'modular_hispania/icons/obj/vehicles.dmi'
	icon_state = "cargo_engine"			//mulebot icons until I get some proper icons
	on = 0
	powered = 1
	locked = 0
	move_delay = 2
	standing_mob = 1
	load_item_visible = 1
	load_offset_x = 0
	load_offset_y = 5

	var/car_limit = 3		//how many cars an engine can pull before performance degrades
	active_engines = 1
	var/obj/item/weapon/key/cargo_train/key

/obj/item/weapon/key/cargo_train
	name = "key"
	desc = "A keyring with a small steel key, and a yellow fob reading \"Choo Choo!\"."
	icon = 'modular_hispania/icons/obj/vehicles.dmi'
	icon_state = "train_keys"
	w_class = 1

/obj/vehicleh/train/cargo/trolley
	name = "cargo train trolley"
	icon = 'modular_hispania/icons/obj/vehicles.dmi'
	icon_state = "cargo_trailer"
	anchored = 0
	passenger_allowed = 0
	locked = 0

	standing_mob = 1
	load_item_visible = 1
	load_offset_x = 0
	load_offset_y = 5

//-------------------------------------------
// Standard procs
//-------------------------------------------
/obj/vehicleh/train/cargo/engine/New()
	..()
	cell = new /obj/item/stock_parts/cell/high
	//verbs -= /atom/movable/verb/pulled
	//key = new()

/obj/vehicleh/train/cargo/engine/Move()
	if(on && cell.charge < power_use)
		turn_off()
		update_stats()
		if(load && is_train_head())
			playsound(src,'sound/machines/buzz-sigh.ogg',50,1)
			to_chat(load, "The drive motor briefly whines, then drones to a stop.")

	if(is_train_head() && !on)
		return 0

	return ..()

/obj/vehicleh/train/cargo/trolley/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(open && istype(W, /obj/item/wirecutters))
		playsound(src,'sound/items/wirecutter.ogg',50,1)
		passenger_allowed = !passenger_allowed
		user.visible_message("<span class='notice'>[user] [passenger_allowed ? "cuts" : "mends"] a cable in [src].</span>","<span class='notice'>You [passenger_allowed ? "cut" : "mend"] the load limiter cable.</span>")
	else
		..()

/obj/vehicleh/train/cargo/engine/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W, /obj/item/borg/upgrade/vtec) && move_delay > 1)
		move_delay = 1.5
		qdel(W)
		to_chat(user, "<span class='notice'>You upgrade [src] with [W].</span>")
		return
	if(istype(W, /obj/item/weapon/key/cargo_train))
		if(!key)
			playsound(src,'modular_hispania/sound/effects/key_insert.ogg',50,1)
			user.drop_item()
			key = W
			W.loc = src
			verbs += /obj/vehicleh/train/cargo/engine/verb/remove_key
		return
	..()

/obj/vehicleh/train/cargo/engine/update_icon_state()
	if(open)
		icon_state = "cargo_engine_open"
	else
		icon_state = initial(icon_state)

/obj/vehicleh/train/cargo/trolley/update_icon_state()
	if(open)
		icon_state = "cargo_trailer_open"
	else
		icon_state = initial(icon_state)

/obj/vehicleh/train/cargo/engine/Emag(mob/user as mob)
	..()
	do_sparks(3, 1, src)
	//flick("mulebot-emagged", src)

/obj/vehicleh/train/cargo/trolley/insert_cell(var/obj/item/stock_parts/cell/C, var/mob/living/carbon/human/H)
	return

/obj/vehicleh/train/cargo/engine/insert_cell(var/obj/item/stock_parts/cell/C, var/mob/living/carbon/human/H)
	..()
	update_stats()

/obj/vehicleh/train/cargo/engine/remove_cell(var/mob/living/carbon/human/H)
	..()
	update_stats()

/obj/vehicleh/train/cargo/engine/Bump(atom/Obstacle, yes)
	var/obj/machinery/door/D = Obstacle
	var/mob/living/carbon/human/H = load
	if(istype(D) && istype(H))
		D.Bumped(H)		//a little hacky, but hey, it works, and repects access rights

	..()

/obj/vehicleh/train/cargo/trolley/Bump(atom/Obstacle, yes)
	if(!lead)
		return //so people can't knock others over by pushing a trolley around
	..()

//-------------------------------------------
// Train procs
//-------------------------------------------
/obj/vehicleh/train/cargo/engine/turn_on()
	if(!key)
		return
	else
		..()
		update_stats()

/obj/vehicleh/train/cargo/RunOver(var/mob/living/carbon/human/H)
	var/list/parts = list("head", "chest", "l_leg", "r_leg", "l_arm", "r_arm")

	H.apply_effects(5, 5)
	for(var/i = 0, i < rand(1,3), i++)
		H.apply_damage(rand(1,5), BRUTE, pick(parts))

/obj/vehicleh/train/cargo/trolley/RunOver(var/mob/living/carbon/human/H)
	..()
	attack_log += text("\[[time_stamp()]\] <font color='red'>ran over [H.name] [key_name(H)]</font>")

/obj/vehicleh/train/cargo/engine/RunOver(var/mob/living/carbon/human/H)
	..()

	if(is_train_head() && istype(load, /mob/living/carbon/human))
		var/mob/living/carbon/human/D = load
		to_chat(D, "<span class='danger'>You ran over [H]!</span>")
		visible_message("<B>\red \The [src] ran over [H]!</B>")
		attack_log += text("\[[time_stamp()]\] <font color='red'>ran over [H.name][key_name(H)], driven by [D.name] [key_name(D)]</font>")
		msg_admin_attack("[D.name] [key_name(D)] ran over [H.name] [key_name(H)]. (<A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[src.x];Y=[src.y];Z=[src.z]'>JMP</a>)")
	else
		attack_log += text("\[[time_stamp()]\] <font color='red'>ran over [H.name] [key_name(H)]</font>")


//-------------------------------------------
// Interaction procs
//-------------------------------------------
/obj/vehicleh/unbuckle_mob(mob/living/buckled_mob, force = FALSE)
	if(istype(buckled_mob))
		buckled_mob.pixel_x = 0
		buckled_mob.pixel_y = 0
	. = ..()

/obj/vehicleh/train/cargo/engine/relaymove(mob/user, direction)
	if(user.incapacitated())
		unload()
		var/mob/living/L  = user
		L.KnockDown(10 SECONDS)
		return

	if(user != load)
		return 0

	if(is_train_head())
		if(direction == reverse_direction(dir))
			return 0
		var/ahead = get_step(src,direction)
		if(istype(ahead, /turf/space))
			return 0
		if(Move(get_step(src, direction)))
			return 1
		return 0
	else
		return ..()

/obj/vehicleh/train/cargo/engine/examine()
	..()

	if(!istype(usr, /mob/living/carbon/human))
		return

	if(get_dist(usr,src) <= 1)
		to_chat(usr, "<span class='notice'>The power light is [on ? "on" : "off"].\nThere are[key ? "" : " no"] keys in the ignition.")

/obj/vehicleh/train/cargo/engine/verb/check_power()
	set name = "Check power level"
	set category = "Object"
	set src in view(1)

	if(!istype(usr, /mob/living/carbon/human))
		return

	if(!cell)
		to_chat(usr, "<span class='notice'>There is no power cell installed in [src].</span>")
		return

	to_chat(usr, "The power meter reads [round(cell.percent(), 0.01)]%")

/obj/vehicleh/train/cargo/engine/verb/start_engine()
	set name = "Start engine"
	set category = "Object"
	set src in view(1)

	if(!istype(usr, /mob/living/carbon/human))
		return

	if(on)
		to_chat(usr, "The engine is already running.")
		return

	turn_on()
	if (on)
		to_chat(usr, "The engine starts")
		playsound(usr,'modular_hispania/sound/effects/engine_start.ogg',50,1)
	else
		if(cell.charge < power_use)
			to_chat(usr, "\The [src] is out of power.")
		else
			to_chat(usr, "[src]'s engine won't start.")

/obj/vehicleh/train/cargo/engine/verb/stop_engine()
	set name = "Stop engine"
	set category = "Object"
	set src in view(1)

	if(!istype(usr, /mob/living/carbon/human))
		return

	if(!on)
		to_chat(usr, "The engine is already stopped")
		return

	turn_off()
	if (!on)
		playsound(src,'modular_hispania/sound/effects/engine_stop.ogg',50,1)
		to_chat(usr, "[src]'s engine stops")

/obj/vehicleh/train/cargo/engine/AltClick(mob/user)
	remove_key()

/obj/vehicleh/train/cargo/engine/verb/remove_key()
	set name = "Remove key"
	set category = "Object"
	set src in view(1)

	if(!istype(usr, /mob/living/carbon/human))
		return

	if(!key || (load && load != usr))
		return

	if(on)
		turn_off()

	key.loc = usr.loc
	if(!usr.get_active_hand())
		usr.put_in_hands(key)
	key = null

	verbs -= /obj/vehicleh/train/cargo/engine/verb/remove_key

//-------------------------------------------
// Loading/unloading procs
//-------------------------------------------
/obj/vehicleh/train/cargo/trolley/load(var/atom/movable/C)
	if(ismob(C) && !passenger_allowed)
		return 0
	if(!istype(C,/obj/machinery) && !istype(C,/obj/structure/closet) && !istype(C,/obj/structure/largecrate) && !istype(C,/obj/structure/reagent_dispensers) && !istype(C,/obj/structure/ore_box) && !ismob(C))
		return 0

	return ..()

/obj/vehicleh/train/cargo/engine/load(var/atom/movable/C)
	if(!ismob(C))
		return 0

	return ..()


//-------------------------------------------------------
// Stat update procs
//
// Update the trains stats for speed calculations.
// The longer the train, the slower it will go. car_limit
// sets the max number of cars one engine can pull at
// full speed. Adding more cars beyond this will slow the
// train proportionate to the length of the train. Adding
// more engines increases this limit by car_limit per
// engine.
//-------------------------------------------------------
/obj/vehicleh/train/cargo/engine/update_train_stats()
	..()

	update_move_delay()

/obj/vehicleh/train/cargo/trolley/update_train_stats()
	..()
	/*
	if(!lead && !tow)
		anchored = 0
		if(verbs.Find(/atom/movable/verb/pull))
			return
		else
			verbs += /atom/movable/verb/pull
	else
		anchored = 1
		verbs -= /atom/movable/verb/pull
		*/

/obj/vehicleh/train/cargo/engine/proc/update_move_delay()
	if(!is_train_head() || !on)
		move_delay = initial(move_delay)		//so that engines that have been turned off don't lag behind
	else
		move_delay = max(1, (-car_limit * active_engines) + (train_length) - active_engines)	//limits base overweight so you cant overspeed trains
		move_delay *= (1 / max(1, active_engines)) * 2 										//overweight penalty (scaled by the number of engines)
		move_delay += GLOB.configuration.movement.base_run_speed 														//base reference speed
		move_delay *= 1.05 																	//makes cargo trains 5% slower than running when not overweight

