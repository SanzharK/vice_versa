<html>
<head>
<title>FYP - Message</title>
<meta name="layout" content="main" />
</head>
<body>
	<h4>Messages</h4>
	<g:each var="forum" in="${params.connectionForums}">
		<div id="messageItem"></div>
		<li><a href="/final_year_project/connectionForum/connectionForum/${forum.id }"> ${forum.participants[0]} - ${forum.participants[1]}
		</a></li>
	</g:each>
</body>
</html>