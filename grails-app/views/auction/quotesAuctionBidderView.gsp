<html>
<head>
<title>FYP - Quotes Auction</title>
<meta name="layout" content="main">
</head>
<body>
	<h4>
		<font color="#8fc400"> ${params.currentAuction.title}
		</font> <font color="#60abf8">is hosted by</font> <font color="orange"
			face="verdana"> ${params.currentAuction.host.companyName}
		</font>
	</h4>

	<div id="auctionInfo" class="col_4 column">
		<font color="#60abf8"> <span class="icon x-large green"
			data-icon="i"></span>
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
		</font>
	</div>
	<div class="col_4">
		<span class="icon green x-large" data-icon="'"></span>
		<g:form url="[controller:'bid',action:'newBid']">
			<div id="messagesForAuction">
				<table class="striped">
					<thead>
						<tr>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<tr class="first" style="float: left; height: 80px">
							<td>There are no posts yet.</td>
						</tr>
						<tr class="alt" style="height: 80px">
							<td></td>
						</tr>
						<tr style="height: 80px">
							<td></td>
						</tr>
						<tr style="height: 80px">
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
			<textarea rows="4" style="width: 100%;"
				placeholder="Max. 145 characters"></textarea>
			<p>
				<button class="blue pill" type="submit" style="float: right;">
					<span class="icon" data-icon='"'></span>
					<g:message code="Post"></g:message>
				</button>
			</p>
		</g:form>
	</div>
	<div class="col_4">
		<span class="icon green x-large" data-icon="c"></span>
		<g:form name="newBidForm" url="[controller:'bid',action:'newBid']">
			<p>
				<label>Cost</label>
			</p>
			<p>
				<g:if test="${params.currentAuction.currency == 'euro' }">
					<label>€</label>
				</g:if>
				<input name="amount" class="col_2">
			</p>
			<p>
				<label>Comment</label>
			</p>
			<p>
				<textarea rows="5" cols="30" name="comment"></textarea>
			</p>
			<p>
				<g:hiddenField name="auctionId" value="${params.currentAuction.id }" />
				<button class="green pill" type="submit">
					<span class="icon" data-icon='c'></span>
					<g:message code="Submit Quote"></g:message>
				</button>
			</p>
		</g:form>
	</div>
</body>
</html>