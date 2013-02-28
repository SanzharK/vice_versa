<html>
	<head>
	<title>FYP - Company</title>
	<meta name="layout" content="main" />
	</head>
	<body>
		<!-- This is my Search bar -->
	<input id="text2" class="col_11" type="text" placeholder="Search" />
	<button class="blue">Search</button>
	<p></p>
	<!-- Menu Horizontal -->
	<ul class="menu">
	<li><a href="/final_year_project">Home</a></li>
	<g:if test="${session?.user}">
	<li><a href="/final_year_project/user/myPage">My Page</a></li>
	</g:if>
	<li><a href="">How it Works</a></li>
	<li class="current"><a href="">Contact Us</a></li>
	<g:if test="${session?.user}">
	<li><a></a></li>
	<li><a></a></li>
	<li><a></a></li>
	<li><a></a></li>
	<li><a></a></li>
	<li><a></a></li>
	<li><a></a></li>
	<li><a></a></li>
	<li><a></a></li>
	<li><a></a></li>
	<li><a></a></li>
	<li><a></a></li>
		<li id="login">
    	    ${session?.user?.companyName} (${session?.user?.email}) |
    	<g:link controller="user" action="logout">Logout</g:link></li>
	<!-- END #login -->
	</g:if>
	<g:else>
	<g:form class="simpleform" style="width:50%;" url="[controller:'user',action:'login']">
	<li> <g:textField name="email" placeholder="Email"/> </li>
	<li> <g:passwordField name="password" placeholder="Password"/> </li>
	<li> <g:submitButton class="button" name="submitButton" value="Login" class="small green"/> </li>
	</g:form>
	<li> <a></a> </li>
	<li><g:link controller="user" action="register"> 
    <input type="button" value="Register" class="button" class="red"/> 
    </g:link></li>
	</g:else>
	</ul>
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