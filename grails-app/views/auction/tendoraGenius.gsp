<html>
<head>
<title>FYP - Contact Us</title>
<meta name="layout" content="main" />
</head>
<body>
	<script type="text/javascript">
		checkDisplay("check", "form");
	</script>
	<h4>Tendora Genius</h4>
	<!-- <div>${params.results}</div> -->
	<div class="gallery">
		<g:each var="result" in="${params.results}">
			<a href="${result.select('img').attr('src') }"> <img
				src="${result.select('img').attr('src') }" />
			</a>
		</g:each>
	</div>
	<div>
		<g:each var="result" in="${params.resultsIkea}">
			<p>${result }</p>
		</g:each>
	</div>
</body>
</html>