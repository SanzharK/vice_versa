<html>
<head>
<title>FYP - Tender Central</title>
<meta name="layout" content="main">
</head>
<body>
	<h2>
		<font color='orange'>Tender Central</font>
	</h2>
	<p>Below you can see all tenders which have been created. Choose the
		right one for you and start bidding!</p>
	<div class="col_10 column">
		<h5>Quotes</h5>
		<table class="sortable">
			<thead>
				<tr>
					<th>Company</th>
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
						<td>
							${auction.host.companyName}
						</td>
						<td>
							${auction.title}
						</td>
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
							<td><button class="pill disabled" disabled="disabled">
									<span class="icon" data-icon="c"></span>
									<g:message code="Bid"></g:message>
								</button></td>
						</g:if>
						<g:else>
							<td><button class="green pill"
									onClick="window.location = '/final_year_project/auction/quotesAuctionBidderView/${auction.id }' ">
									<span class="icon" data-icon="c"></span>
									<g:message code="Bid"></g:message>
								</button></td>
						</g:else>
					</tr>
				</g:each>
			</tbody>
		</table>
	</div>
	<div class="col_10 column">
		<h5>Live</h5>
		<table class="sortable">
			<thead>
				<tr>
					<th>Company</th>
					<th>Title</th>
					<th>Category</th>
					<th>Date Created</th>
					<th>Start Date</th>
					<th>Status</th>
				</tr>
			</thead>
			<tbody>
				<g:each var="auction" in="${params.liveAuctions}">
					<tr>
						<td>
							${auction.host.companyName}
						</td>
						<td>
							${auction.title}
						</td>
						<td>
							${auction.category}
						</td>
						<td>
							${auction.dateCreated.format("dd/MM/yyyy")}
						</td>
						<td>
							${auction.startDate.format("HH/mm dd/MM/yyyy")}
						</td>
						<td>
							${auction.status}
						</td>
						<g:if test="${auction.status == 'announced'}">
							<td><button class="pill disabled" disabled="disabled">
									<span class="icon" data-icon="c"></span>
									<g:message code="Bid"></g:message>
								</button></td>
						</g:if>
						<g:else>
							<td><button class="green pill"
									onClick="window.location = '/final_year_project/auction/liveAuctionBidderView/${auction.id }' ">
									<span class="icon" data-icon="c"></span>
									<g:message code="Bid"></g:message>
								</button></td>
						</g:else>
					</tr>
				</g:each>
			</tbody>
		</table>
	</div>
	<div class="col_10 column">
		<h5>General</h5>
		<table class="sortable">
			<thead>
				<tr>
					<th>Company</th>
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
						<td>
							${auction.host.companyName}
						</td>
						<td>
							${auction.title}
						</td>
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
							<td><button class="pill disabled" disabled="disabled">
									<span class="icon" data-icon="c"></span>
									<g:message code="Bid"></g:message>
								</button></td>
						</g:if>
						<g:else>
							<td><button class="green pill"
									onClick="window.location = '/final_year_project/auction/liveAuctionBidderView/${auction.id }' ">
									<span class="icon" data-icon="c"></span>
									<g:message code="Bid"></g:message>
								</button></td>
						</g:else>
					</tr>
				</g:each>
			</tbody>
		</table>
	</div>
</body>
</html>