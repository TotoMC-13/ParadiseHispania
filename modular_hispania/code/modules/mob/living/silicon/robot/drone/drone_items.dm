/obj/item/gripper
	var/list/hispa_can_hold = list(
		/obj/item/stack/sheet/mineral
	)

/obj/item/gripper/Initialize(mapload)
	can_hold |= hispa_can_hold
	..()


//MEDBORG
/obj/item/robot_module/medical
	var/list/basic_modules_hispa = list(
		/obj/item/bodybag_dispenser,
		/obj/item/reagent_containers/glass/bottle/reagent/formaldehyde
	)

/obj/item/robot_module/medical/Initialize(mapload)
	basic_modules |= basic_modules_hispa
	..()

/obj/item/bodybag_dispenser/
	name = "\improper Body-bag-Fabricator"
	desc = "A device used to rapidly deploy body bags."
	icon = 'icons/obj/bodybag.dmi'
	icon_state = "bodybag_folded"
	opacity = FALSE
	density = FALSE
	anchored = FALSE
	var/matter = 0
	var/mode = 1
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, RAD = 0, FIRE = 0, ACID = 0)
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/bodybag_dispenser/afterattack(atom/A, mob/user as mob, proximity)
	if(!proximity) return
	var/mob/living/silicon/robot/engy = user
	if(istype(A,/obj/structure/closet/body_bag))
		to_chat(user, "Guardando bolsa.. Reciclando energia")
		playsound(loc, 'sound/machines/click.ogg', 10, 1)
		engy.cell.charge = min(engy.cell.charge, (engy.cell.charge+2000)) //recarga 2000
		qdel(A)
		return
	var/spawn_location
	var/turf/T = get_turf(A)
	if(istype(T) && !T.density)
		spawn_location = T
	else
		to_chat(user, "Este lugar no es apto")
		return
	if(isrobot(user))

		if(!engy.cell.use(4000))
			to_chat(user, "<span class='warning'>Insufficient energy.</span>")
			return
	to_chat(user, "Produciendo bolsa para cuerpos")
	playsound(loc, 'sound/machines/click.ogg', 10, 1)
	new /obj/structure/closet/body_bag(spawn_location)
