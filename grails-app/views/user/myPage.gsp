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
			<li><a href="#tabr4">Tenders</a></li>
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
			<div class="col_3 column">
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
			<div class="col_3 column">
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
			<div class="col_4 column">
				<h3>Notifications</h3>
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
					<li><a> ${product.title}</a>
					<p><img class="style2" src="${createLink(controller:'product', action:'displayImage', id: product.id)}" width="180" height="150"/></p>
					</li>
				</g:each>
			</ul>
			<button class="green pill"
				onClick="window.location = '/final_year_project/product/newProduct' ">
				<span class="icon" data-icon="p"></span>
				<g:message code="Product"></g:message>
			</button>
		</div>
		<div id="tabr4" class="tab-content">
			<h4>My Tenders</h4>
			<h6>Live</h6>
			<table class="sortable">
				<thead>
					<tr>
						<th>Title</th>
						<th>Category</th>
						<th>Type</th>
						<th>Date Created</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
					<g:each var="auction" in="${params.liveAuctions}">
						<tr>
							<td><g:link controller="auction"
									action="liveAuctionHostView" id="${auction.id }">
									${auction.title}
								</g:link></td>
							<td>
								${auction.category}
							</td>
							<td>
								${auction.type}
							</td>
							<td>
								${auction.dateCreated}
							</td>
							<td>
								${auction.status}
							</td>
							<g:if test="${auction.status == 'announced'}">
								<td><button class="pill green"
										onClick="window.location = '/final_year_project/auction/startAuction/${auction.id }' ">
										<span class="icon" data-icon="c"></span>
										<g:message code="Start"></g:message>
									</button></td>
							</g:if>
							<g:else>
								<td><button class="green pill"
										onClick="window.location = '/final_year_project/auction/liveAuctionHostView/${auction.id }' ">
										<span class="icon" data-icon="c"></span>
										<g:message code="View"></g:message>
									</button></td>
							</g:else>
						</tr>
					</g:each>
				</tbody>
			</table>
			<h6>Quotes</h6>
			<table class="sortable">
				<thead>
					<tr>
						<th>Title</th>
						<th>Category</th>
						<th>Type</th>
						<th>Date Created</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
					<g:each var="auction" in="${params.quotesAuctions}">
						<tr>
							<td><g:link controller="auction"
									action="quotesAuctionHostView" id="${auction.id }">
									${auction.title}
								</g:link></td>
							<td>
								${auction.category}
							</td>
							<td>
								${auction.type}
							</td>
							<td>
								${auction.dateCreated}
							</td>
							<td>
								${auction.status}
							</td>
							<g:if test="${auction.status == 'announced'}">
								<td><button class="pill green"
										onClick="window.location = '/final_year_project/auction/startAuction/${auction.id }' ">
										<span class="icon" data-icon="c"></span>
										<g:message code="Start"></g:message>
									</button></td>
							</g:if>
							<g:else>
								<td><button class="green pill"
										onClick="window.location = '/final_year_project/auction/quotesAuctionHostView/${auction.id }' ">
										<span class="icon" data-icon="c"></span>
										<g:message code="View"></g:message>
									</button></td>
							</g:else>
						</tr>
					</g:each>
				</tbody>
			</table>
			<h6>General</h6>
			<table class="sortable">
				<thead>
					<tr>
						<th>Title</th>
						<th>Category</th>
						<th>Type</th>
						<th>Date Created</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
					<g:each var="auction" in="${params.generalAuctions}">
						<tr>
							<td><g:link controller="auction"
									action="quotesAuctionHostView" id="${auction.id }">
									${auction.title}
								</g:link></td>
							<td>
								${auction.category}
							</td>
							<td>
								${auction.type}
							</td>
							<td>
								${auction.dateCreated}
							</td>
							<td>
								${auction.status}
							</td>
							<g:if test="${auction.status == 'announced'}">
								<td><button class="pill green"
										onClick="window.location = '/final_year_project/auction/startAuction/${auction.id }' ">
										<span class="icon" data-icon="c"></span>
										<g:message code="Start"></g:message>
									</button></td>
							</g:if>
							<g:else>
								<td><button class="green pill"
										onClick="window.location = '/final_year_project/auction/quotesAuctionHostView/${auction.id }' ">
										<span class="icon" data-icon="c"></span>
										<g:message code="View"></g:message>
									</button></td>
							</g:else>
						</tr>
					</g:each>
				</tbody>
			</table>
			<button class="green pill"
				onClick="window.location = '/final_year_project/auction/chooseAuction' ">
				<span class="icon" data-icon="p"></span>
				<g:message code="Tender"></g:message>
			</button>
		</div>
	</div>
</body>
</html>