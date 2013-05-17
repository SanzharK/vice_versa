<html>
<head>
<title>FYP - Live Auction</title>
<meta name="layout" content="main">
<!-- <meta http-equiv="refresh" content="5"> -->
<link href="${resource(dir:'/jcountdown',file:'jcountdown.css')}"
	rel="stylesheet" type="text/css">
<g:javascript src="jcountdown/jquery.jcountdown.min.js" />
</head>
<body>
	<h4>
		<font color="orange"> ${params.currentAuction.title }
		</font>
	</h4>
	<h4>
		<font color="orange">Time Left:</font>
	</h4>
	<div id="countdown"></div>
	<script>
		jQuery(document).ready(function() {
			jQuery("#countdown").jCountdown({
				timeText : "${params.exactDate}
		",
				timeZone : 1,
				style : "metal",
				color : "black",
				width : 0,
				textGroupSpace : 15,
				textSpace : 0,
				reflection : false,
				reflectionOpacity : 10,
				reflectionBlur : 0,
				dayTextNumber : 4,
				displayDay : false,
				displayHour : true,
				displayMinute : true,
				displaySecond : true,
				displayLabel : false,
				onFinish : function() {
					alert("finish");
				}
			});
		});
	</script>
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
	<div class="col_2">
		<span class="icon green x-large" data-icon="'"></span>
		<g:form url="[controller:'forumMessage',action:'newForumMessage']">
			<div id="messagesForAuction">
				<table class="striped">
					<thead>
						<tr>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<g:each var="message" in="${params.messages}">
							<tr class="first" style="float: left; height: 80px">
								<td>
									${message.message }
								</td>
							</tr>
							<tr class="alt" style="height: 80px">
								<td>Posted by ${message.sender.companyName }</td>
							</tr>
						</g:each>
					</tbody>
				</table>
			</div>
			<textarea rows="4" style="width: 100%;"
				placeholder="Max. 145 characters" name="message"></textarea>
			<p>
				<g:hiddenField name="auctionId" value="${params.currentAuction.id }" />
				<button class="blue pill" type="submit" style="float: right;">
					<span class="icon" data-icon='"'></span>
					<g:message code="Post"></g:message>
				</button>
			</p>
		</g:form>
	</div>
	<div class="col_6">
		<div id="current winner"></div>
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
								onClick="window.location = '/final_year_project/bid/show/${bid.id}' ">
								<span class="icon" data-icon="c"></span>
								<g:message code="Show"></g:message>
							</button>
						</td>
					</tr>
				</g:each>
			</tbody>
		</table>
	</div>
</body>
</html>