<html>
	<head>
	<title>FYP - Proposal</title>
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
	<li><a href="">Connections</a></li>
	<li><a href="/final_year_project/user/message">Messages</a></li>
	<li class="current"><a href="/final_year_project/user/proposal">Proposals</a></li>
	<li><a href="">How it Works</a></li>
	<li><a href="/final_year_project/main/contactUs">Contact Us</a></li>
	<g:if test="${session?.user}">
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
	</ul>
	</body>
</html>