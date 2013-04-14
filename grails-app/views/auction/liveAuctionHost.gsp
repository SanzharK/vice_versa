<html>
<head>
<title>FYP - Live Auction</title>
<meta name="layout" content="main" />
</head>
<body>
	<h4>
		<font color="#8fc400"> ${params.currentAuction.title}
		</font> <font color="#60abf8">is hosted by</font> <font color="orange" face="verdana"> ${params.currentAuction.host.companyName}
		</font>
	</h4>
	<div class="col_4 column" id="auctionForum">
	<h5><font color="#60abf8">Posts</font></h5>
		<g:form>
			<p>
				<g:textArea name="auctionForumMessage" placeholder="Post here ..."></g:textArea>
			</p>
			<g:submitButton for="auctionForumMessage"
				name="submitAuctionForumMessage" class="small green" value="Post" />
		</g:form>
	</div>
</body>
</html>