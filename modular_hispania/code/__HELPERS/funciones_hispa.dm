//FUNCIONES HISPANIA

//SIMILAR AL isInTypes de la carpeta experimental by ESwordTheCat!
//con la diferencia que no me funciono asiq tuve que cambiarla un poco
//trabaja con elementos path de la lista, no con strings.

/proc/isIn_types(atom/Object, types)
	var/prototype = Object.type
	var/resultado = FALSE
	Object = null
	for(var/type in (types))
		if(type == prototype)
			resultado = TRUE
			break
	return resultado
