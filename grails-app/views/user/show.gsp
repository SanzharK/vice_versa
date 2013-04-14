<html>
	<head>
	<title>FYP - Company</title>
	<meta name="layout" content="main" />
	</head>
	<body>
	<h3>${params.searchedUser.companyName}</h3>
	<h4>Services</h4>
	<ul id="services" class="alt">
	<g:each var="service" in="${params.services}">
	<li> ${service.title}</li>
	</g:each>
	</ul>
	<h4>Products</h4>
	<ul id="services" class="alt">
	<g:each var="product" in="${params.products}">
	<li> ${product.title}</li>
	</g:each>
	</ul>
	</body>
</html>