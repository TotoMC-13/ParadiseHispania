/datum/event/feedme
	announceWhen = 3
	endWhen = 10

/datum/event/feedme/announce()
	GLOB.event_announcement.Announce("Ha llegado un prestigioso catador de comida a la estacion. Es importante que se vaya satisfecho o podria haber consecuencias negativas para los trabajadores de servicio")

/datum/event/feedme/start()
	new /obj/effect/portal/(pick(GLOB.feedmespawn))
	new /mob/living/simple_animal/feedme(pick(GLOB.feedmespawn))

/mob/living/simple_animal/feedme
	name = "Catador"
	desc = "Parece hambriento.."
	icon = 'modular_hispania/icons/mob/comensales.dmi'
	var/list/comensales = list("clown","carnivoro","mexicano")
	speak = list("Muero de hambre!", "Escuche varias cosas de la cocina de este lugar.. Y no particularmente buenas", "Deme su mejor platillo", "Tengo tanto hambre que me comeria un planeta","¿Cuanto tiempo hay que esperar para ser atendido?")
	speak_chance = 15
	icon_state = "clown"
	icon_living = "clown"
	icon_dead = "clown_dead"
	health = 60
	maxHealth = 60
	nutrition = -9000
	metabolism_efficiency = 100
	var/turns_since_scan = 0
	var/obj/movement_target
	var/alimentado = 0
	var/meta = 50
	var/paciencia = 10 MINUTES
	var/endtime = 0
	var/list/listaclown = list(
		/obj/item/reagent_containers/food/snacks/bananabreadslice,
		/obj/item/reagent_containers/food/snacks/bananacakeslice,
		/obj/item/reagent_containers/food/snacks/friedbanana,
		/obj/item/reagent_containers/food/snacks/grown/banana,
		/obj/item/reagent_containers/food/snacks/grown/banana/bluespace,
		/obj/item/reagent_containers/food/snacks/sliceable/bananabread,
		/obj/item/reagent_containers/food/snacks/sliceable/bananacake
	)
	var/list/listamexicano = list(/obj/item/reagent_containers/food/snacks/taco,
		/obj/item/reagent_containers/food/snacks/burrito,
	)
	var/list/listacarnivoro = list(/obj/item/reagent_containers/food/snacks/meatsteak,
		/obj/item/reagent_containers/food/snacks/meatpie,
		/obj/item/reagent_containers/food/snacks/meatbreadslice,
		/datum/recipe/oven/meatbread,
		/datum/recipe/oven/meatpizza,
		/obj/item/reagent_containers/food/snacks/grown/meatwheat,
		/obj/item/reagent_containers/food/snacks/stewedsoymeat,
		/obj/item/reagent_containers/food/snacks/xemeatpie,
		/obj/item/reagent_containers/food/snacks/meat/monkey,
		/obj/item/reagent_containers/food/snacks/meatpizzaslice
	)

/mob/living/simple_animal/feedme/New()
	..()
	endtime = world.time + paciencia
	var/pickeado = pick(comensales)
	icon_state = pickeado
	icon_dead = pickeado + "_dead"

	var/T
	for(T in typesof(/obj/item/reagent_containers/food/snacks/meat/))
		listacarnivoro += T

/mob/living/simple_animal/feedme/proc/alimentar(I)
	if(icon_state == "clown")
		for(var/A in listaclown)
			if(istype(I, A))
				atom_say(pick("Honk!!! esta comida si me gusta! ","HOOOONK !!! Que sabroso!! ", "honk honk, esto es digno de un banquete de la honk mother"))
				alimentado += 10
				return
	if(icon_state == "mexicano")
		for(var/A in listamexicano)
			if(istype(I, A))
				atom_say(pick("Orale manito esto si es comida!!","Pero que rico chamaco, traeme mas de esto","Hmmm...Delicioso!!!"))
				alimentado += 10
				return
	if(icon_state == "carnivoro")
		for(var/A in listacarnivoro)
			if(istype(I, A))
				atom_say(pick("Yeeha!! esta comida si que esta buena en proteinas","De eso estoy hablando!!, traeme mas de esta carne!! ","HMM Carne!! amo la carne!!"))
				alimentado += 10
				return

	atom_say(pick("Esta comida es mala...", "No tienes una comida mejor?.", "Meh...wakale", "Preferiria otra comida..", "Esta comida no es de mi agrado"))
	alimentado += 1

/mob/living/simple_animal/feedme/handle_automated_movement()
	. = ..()
	if(world.time > endtime)
		endtime = endtime * 2 //para q no entre denuevo
		GLOB.event_announcement.Announce("El Catador se ha ido y nos ha dejado una muy mala calificacion. Habra consecuencias en el bar..")
		var/locat = src.loc
		new /obj/effect/portal/(locat)
		icon_state = "vacio"
		spawn(15 SECONDS)
			explosion((pick(GLOB.feedmespawn)), 2, 3, 4, 4)
			del(src)

	if(alimentado > meta)
		var/locat = src.loc
		new /obj/effect/portal/(locat)
		GLOB.event_announcement.Announce("El Catador se ha ido totalmente satisfecho. Buen trabajo!")
		del(src)
		return

	if(resting)
		return

	if(++turns_since_scan > 5)
		turns_since_scan = 0

		if(movement_target && !(isturf(movement_target.loc) || ishuman(movement_target.loc)))
			movement_target = null
			stop_automated_movement = FALSE

		// No current target, or current target is out of range.
		var/list/snack_range = oview(src, 3)
		if(!movement_target || !(movement_target.loc in snack_range))
			movement_target = null
			stop_automated_movement = FALSE
			var/obj/item/possible_target = null
			for(var/I in snack_range)
				if(istype(I, /obj/item/reagent_containers/food/snacks)) // Noms
					possible_target = I
					break
			if(possible_target && (isturf(possible_target.loc) || ishuman(possible_target.loc))) // On the ground or in someone's hand.
				movement_target = possible_target
		if(movement_target)
			INVOKE_ASYNC(src, .proc/move_to_target)

/mob/living/simple_animal/feedme/proc/move_to_target()
	stop_automated_movement = TRUE
	step_to(src, movement_target, 1)
	sleep(3)
	step_to(src, movement_target, 1)
	sleep(3)
	step_to(src, movement_target, 1)

	if(movement_target) // Not redundant due to sleeps, Item can be gone in 6 deciseconds
		// Face towards the thing
		dir = get_dir(src, movement_target)

		if(!Adjacent(movement_target)) //can't reach food through windows.
			return

		if(isturf(movement_target.loc))
			movement_target.attack_animal(src) // Eat the thing

/mob/living/simple_animal/feedme/death(gibbed)
	// Only execute the below if we successfully died
	. = ..(gibbed)
	if(!.)
		return
	GLOB.event_announcement.Announce("... Han matado al catador. Esto es inaceptable. El bar sera bombardeado")
	spawn(15 SECONDS)
		explosion((pick(GLOB.feedmespawn)), 2, 3, 4, 4)
