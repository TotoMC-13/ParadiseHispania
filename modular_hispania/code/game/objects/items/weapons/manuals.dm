/obj/item/book/manual/wiki
	var/hispania_article_title = "spacelaw" //valor default
	var/hispania_article = TRUE

/obj/item/book/manual/wiki/Initialize()
	. = ..()
	if(hispania_article) //revisa si el libro tiene la variable hispania article true, si no lo inicializa para paradise
		pages = list({"
		<html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" /></head><body bgcolor='[book_bgcolor]'>
		<a href="http://hispaniastation.net/[hispania_article_title]">Continuar</a>
		</body></html>"})
	else
		pages = list({"
		<html><head></head><body bgcolor='[book_bgcolor]'>
		<iframe width='100%' height='97%' src="[GLOB.configuration.url.wiki_url]/index.php/[wiki_article_title]?action=render" frameborder="0" id="main_frame"></iframe>
		</body></html>"})

/obj/item/book/manual/wiki/security_space_law
	wiki_article_title = "Space_law"
	hispania_article = TRUE
	hispania_article_title = "spacelaw"
