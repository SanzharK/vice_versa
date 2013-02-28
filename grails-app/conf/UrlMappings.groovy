class UrlMappings {

	static mappings = {
		"/"(controller:"main", action:"/homepage")
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}
		"500"(view:'/error')
	}
}
