<html>
<head>
<title>FYP - Choose Tender</title>
<meta name="layout" content="main">
</head>
<body>
	<div class="col_4 column" id="quoteTenderSection">
		<h3>
			<font color="#8fc400">Quotes Tender</font>
		</h3>
		<img class="align-left"
			src="${resource(dir:'images',file:'price_quote.png')}" width="300"
			height="300" />
		<button class="tooltip green pill"
			onClick="window.location = '/final_year_project/auction/newQuotesAuction' "
			data-content="#quotesTenderTooltip">
			<span class="icon" data-icon="p"></span>
			<g:message code="Quotes Tender"></g:message>
		</button>
		<div class="tooltip-content" id="quotesTenderTooltip">
			<h5>Description</h5>
			<p>This type of Tender allows companies to leave Quotes for your
				desired Product or Service.</p>
		</div>
	</div>
	<div class="col_4 column" id="liveTenderSection">
		<h3>
			<font color="orange">Live Tender</font>
		</h3>
		<img class="align-left"
			src="${resource(dir:'images',file:'ready_steady_bid.jpg')}"
			width="300" height="300" />
		<button class="tooltip orange pill"
			onClick="window.location = '/final_year_project/auction/newLiveAuction' "
			data-content="#liveTenderTooltip">
			<span class="icon" data-icon="p"></span>
			<g:message code="Live Tender"></g:message>
		</button>
		<div class="tooltip-content" id="liveTenderTooltip">
			<h5>Description</h5>
			<p>You will need to set a specific time period on which this Tender will be held.</p>
		</div>
	</div>
	<div class="col_4 column" id="generalTenderSection">
		<h3>
			<font color="#60abf8">General Tender</font>
		</h3>
		<img class="align-left"
			src="${resource(dir:'images',file:'general_auction.jpg')}"
			width="300" height="300" />
		<button class="tooltip blue pill"
			onClick="window.location = '/final_year_project/auction/newGeneralAuction' "
			data-content="#generalTenderTooltip">
			<span class="icon" data-icon="p"></span>
			<g:message code="General Tender"></g:message>
		</button>
		<div class="tooltip-content" id="generalTenderTooltip">
			<h5>Description</h5>
			<p>A Genral Tender will allow you to create an Tender that can go on for days.</p>
		</div>
	</div>
</body>
</html>