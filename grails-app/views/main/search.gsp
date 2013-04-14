<html>
	<head>
	<title>FYP - Search</title>
	<meta name="layout" content="main" />
	</head>
	<body>
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