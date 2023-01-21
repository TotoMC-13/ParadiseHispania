/mob/living/simple_animal/hostile/mimic/copy/machine/death(gibbed)
	visible_message("<span class='userdanger'>[src] blows apart!</span>")
	do_sparks(3, 1, src)
	playsound(src, 'sound/effects/sparks4.ogg', 50, 1)
	var/obj/machinery/aux = new forma_anterior(loc)
	aux.obj_break()
	..()

/mob/living/simple_animal/hostile/mimic
	var/forma_anterior
