<html>
<head>
<title>FYP - Homepage</title>
<meta name="layout" content="main" />
</head>
<body>
	<blockquote>
		<p>
			Together We Can Achieve Greatness! <span>Company Motto</span>
		</p>
	</blockquote>

	<div id="displayAllCompanies">
		<a href="/final_year_project/main/search">Find out who has joined
			us already</a>
	</div>

	<!-- Slideshow -->
	<div id="slideshow" class="col_8">
		<ul class="slideshow" width="750" height="450">
			<li><img
				src="${resource(dir:'images',file:'auction_hammer.jpg')}"
				width="750" height="450" /></li>
			<li><img
				src="${resource(dir:'images',file:'savings.jpg')}"
				width="750" height="450" /></li>
			<li><img
				src="${resource(dir:'images',file:'real-time-bidding.jpg')}"
				width="750" height="450" /></li>
			<li><img
				src="${resource(dir:'images',file:'get_connected_logo.jpg')}"
				width="750" height="450" /></li>		
		</ul>
	</div>

	<div id="twitter" class="col_4">
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