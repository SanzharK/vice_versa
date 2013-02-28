<html>
	<head>
	<title>FYP - Search</title>
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
	<li><a href="">Contact Us</a></li>
	<li class="current"><a href="">Search</a></li>
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
	<blockquote>
	<p>
	We are proud to announce that the following companies have joined our community
	</p>
	</blockquote>
	<ul id="users" class="alt">
	<g:each var="user" in="${params.users}">
	<li>
	<g:form>
	<g:link controller="user" action="show" id="${user.id}">${user.companyName}</g:link> 
	<g:link controller="user" action="addConnection" id="${user.id}" class="green">+</g:link>
	</g:form>
	</li>
	</g:each>
	</ul>
	</body>
</html>