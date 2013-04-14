<html>
<head>
<title>FYP - Quotes Auction</title>
<meta name="layout" content="main">
</head>
<body>
	<h4>
		<font color="orange"> ${params.currentAuction.title }
		</font>
	</h4>
	<div id="auctionInfo" class="col_4 column">
		<span class="icon x-large green" data-icon="i"></span>
		<table class="striped">
			<thead>
				<tr>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<tr class="first">
					<td>Host</td>
					<td>
						${params.currentAuction.host.companyName }
					</td>
				</tr>
				<tr class="alt">
					<td>Title</td>
					<td>
						${params.currentAuction.title }
					</td>
				</tr>
				<tr>
					<td>Category</td>
					<td>
						${params.currentAuction.category }
					</td>
				</tr>
				<tr>
					<td>Currency</td>
					<td>
						${params.currentAuction.currency }
					</td>
				</tr>
				<tr>
					<td>Date Created</td>
					<td>
						${params.currentAuction.dateCreated }
					</td>
				</tr>
			</tbody>
		</table>
		<div class="visible column">
			<span class="icon blue small" data-icon="s"></span> <label>Description</label>
			<div class="inner">
				${params.currentAuction.description }
			</div>
		</div>
	</div>
	<div class="col_8">
		<table class="sortable">
			<thead>
				<tr>
					<th>Company</th>
					<th>Amount</th>
					<th>Date</th>
					<th>Comment</th>
				</tr>
			</thead>
			<tbody>
				<g:each var="bid" in="${params.currentBids}">
					<tr>
						<td>
							${bid.bidder.companyName}
						</td>
						<td>
							${bid.amount}
						</td>
						<td>
							${bid.dateCreated}
						</td>
						<td>
							${bid.comment}
						</td>
						<td><button class="green pill"
								onClick="window.location = '/final_year_project/' ">
								<span class="icon" data-icon="c"></span>
								<g:message code="Accept"></g:message>
							</button></td>
					</tr>
				</g:each>
			</tbody>
		</table>
	</div>
</body>
</html>