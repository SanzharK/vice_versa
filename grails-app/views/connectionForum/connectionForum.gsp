<html>
<head>
<title>FYP - Connection Forum</title>
<meta name="layout" content="main">
</head>
<body>
	<div class="col_6">
		<span class="icon green x-large" data-icon="'"></span>
		<g:form url="[controller:'connectionMessages',action:'newConnectionMessages']">
			<div id="messagesForAuction">
				<table class="striped">
					<thead>
						<tr>
							<th> Messages</th>
						</tr>
					</thead>
					<tbody>
						<g:each var="message" in="${params.messages}">
						<tr class="first" style="float: left; height: 80px">
							<td>${message.message }</td>
						</tr>
						<tr class="alt" style="height: 80px">
							<td>Posted by ${message.sender.companyName }</td>
							<td>@ ${message.dateCreated}</td>
						</tr>
						</g:each>
					</tbody>
				</table>
			</div>
			<textarea rows="4" style="width: 100%;"
				placeholder="Max. 145 characters" name="message"></textarea>
			<p>
				<g:hiddenField name="forumId" value="${params.currentForum.id }" />
				<button class="blue pill" type="submit" style="float: right;">
					<span class="icon" data-icon='"'></span>
					<g:message code="Post"></g:message>
				</button>
			</p>
		</g:form>
	</div>
	<div id="twitter" class="col_6">
	<a class="twitter-timeline" href="https://twitter.com/Sanzhik"
		data-widget-id="322740988630138881">Tweets by @Sanzhik</a>
	<script>
		!function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/
					.test(d.location) ? 'http' : 'https';
			if (!d.getElementById(id)) {
				js = d.createElement(s);
				js.id = id;
				js.src = p + "://platform.twitter.com/widgets.js";
				fjs.parentNode.insertBefore(js, fjs);
			}
		}(document, "script", "twitter-wjs");
	</script>
	</div>
</body>
</html>