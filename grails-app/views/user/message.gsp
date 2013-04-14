<html>
	<head>
	<title>FYP - Message</title>
	<meta name="layout" content="main" />
	</head>
	<body>
		<g:each var="connection" in="${params.connections}">
	<li> ${connection}</li>
	</g:each>
	</body>
</html>