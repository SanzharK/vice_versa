<html>
	<head>
	<title>FYP - Message</title>
	<meta name="layout" content="main" />
	</head>
	<body>
	<h4>Messages</h4>
		<g:each var="connection" in="${params.connections}">
		<div id="messageItem"></div>
	<li> ${connection}</li>
	</g:each>
	</body>
</html>