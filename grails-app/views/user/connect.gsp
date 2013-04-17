<html>
<head>
<title>FYP - Message</title>
<meta name="layout" content="main" />
</head>
<body>
	<div class="col_6">
		<h2>
			<font color='orange'>Connect</font>
		</h2>
		<g:each var="connection" in="${params.possibleConnections}">
			<h5>
				<font color='#3498DB'> ${connection.companyName}
				</font>
			</h5>
			<button class="green pill" id="${connection.id}"
				onClick="window.location = '/final_year_project/user/addConnection/${connection.id}' "
				name="connectButton">
				<g:message code="Connect"></g:message>
			</button>
		</g:each>
	</div>
	<div class="col_6">
		<h2>
			<font color='orange'>Connected</font>
		</h2>
		<g:each var="connection" in="${params.existingConnections}">
			<h5>
				<font color='#3498DB'> ${connection}
				</font>
			</h5>
		</g:each>
	</div>
</body>
</html>
