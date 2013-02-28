<html>
	<head>
	<title>FYP - Homepage</title>
	<meta name="layout" content="main" />
	</head>
	<body>
		<!-- This is my Search bar -->
	<g:form class="simpleform" style="width:50%;" url="[controller:'main',action:'search']">
	<input id="search" class="col_11" type="text" placeholder="Search" />
	<g:submitButton class="button" name="submitButton" value="Search" class="blue"/>
	</g:form>
	<p></p>
	<!-- Menu Horizontal -->
	<ul class="menu">
	<li class="current"><a href="">Home</a></li>
	<g:if test="${session?.user}">
	<li><a href="/final_year_project/user/myPage">My Page</a></li>
	</g:if>
	<li><a href="">How it Works</a></li>
	<li><a href="/final_year_project/main/contactUs">Contact Us</a></li>
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
	Together We Can Achieve Greatness!
	<span>Company Motto</span>
	</p>
	</blockquote>
	
	<div id="displayAllCompanies">
	<a href="/final_year_project/main/search">Find out who has joined us already</a>
	</div>
	
	<!-- Slideshow -->
	<ul class="slideshow" width="550" height="350">
	<li><img src="${resource(dir:'images',file:'latest_tweets.jpg')}" width="550" height="350" /></li>
	<li><img src="http://placehold.it/550x350/E49800/ffffff.png&text=550x350" width="550" height="350" /></li>
	</ul>
	
	</body>
</html>