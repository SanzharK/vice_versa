<html>
<head>
<title>FYP - My Page</title>
<meta name="layout" content="main" />
<!-- This is my Search bar -->
</head>
<body>
	<div class="col_12 column">
		<!-- Tabs Left -->
		<ul class="tabs left">
			<li><a href="#tabr1">Company</a></li>
			<li><a href="#tabr2">Services</a></li>
			<li><a href="#tabr3">Products</a></li>
			<li><a href="#tabr4">Auctions</a></li>
		</ul>
		<div id="tabr1" class="tab-content">
			<div class="col_5 column">
				<!-- Align Left -->
				<img class="align-left"
					src="${resource(dir:'images',file:'sme-community.jpg')}"
					width="300" height="300" />
				<p>Small and medium enterprises or small and medium-sized
					enterprises (SMEs, small and medium-sized businesses, SMBs, and
					variations of these terms) are companies whose personnel numbers
					fall below certain limits. The abbreviation "SME" is used in the
					European Union and by international organizations such as the World
					Bank, the United Nations and the World Trade Organization (WTO).
					Small enterprises outnumber large companies by a wide margin and
					also employ many more people. SMEs are also said to be responsible
					for driving innovation and competition in many economic sectors.</p>
			</div>
			<div class="col_4 column">
				<hr>
				<h4>Address</h4>
				<address>
					<p>
						${session?.user?.addressLine1}<br />
						${session?.user?.addressLine2}<br />
						${session?.user?.city}
					</p>
				</address>
			</div>
			<div class="col_4 column">
				<hr>
				<h4>Representative</h4>
				<address>
					<p>
						${session?.user?.firstName}<br />
						${session?.user?.lastName}<br />
						${session?.user?.email}
					</p>
				</address>
			</div>
		</div>
		<div id="tabr2" class="tab-content">
			<h4>Services</h4>
			<ul id="services" class="alt">
				<g:each var="service" in="${params.services}">
					<li><a> ${service.title}</a></li>
				</g:each>
			</ul>
			<button class="green pill"
				onClick="window.location = '/final_year_project/service/newService' ">
				<span class="icon" data-icon="p"></span>
				<g:message code="Service"></g:message>
			</button>
		</div>
		<div id="tabr3" class="tab-content">
			<h4>Products</h4>
			<ul id="products" class="alt">
				<g:each var="product" in="${params.products}">
					<li><a> ${product.title}</a></li>
				</g:each>
			</ul>
			<button class="green pill"
				onClick="window.location = '/final_year_project/product/newProduct' ">
				<span class="icon" data-icon="p"></span>
				<g:message code="Product"></g:message>
			</button>
		</div>
		<div id="tabr4" class="tab-content">
			<h4>My Auctions</h4>
			<ul id="auctions" class="alt">
				<g:each var="auction" in="${params.createdAuctions}">
					<li><a><g:link controller="auction"
								action="quotesAuctionHostView" id="${auction.id }">
								${auction.title}
							</g:link></a></li>
				</g:each>
			</ul>
			<button class="green pill"
				onClick="window.location = '/final_year_project/auction/chooseAuction' ">
				<span class="icon" data-icon="p"></span>
				<g:message code="Auction"></g:message>
			</button>
		</div>
	</div>
</body>
</html>