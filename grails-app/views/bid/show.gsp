<html>
<head>
<title>FYP - Bid</title>
<meta name="layout" content="main" />
</head>
<body>
	<h3>
		Bid for
		${params.tender.title }
		by
		${params.bid.bidder.companyName }
	</h3>
	<h6>
		Amount:
		${params.bid.amount }
	</h6>
	<h6>
		Comment:
		${params.bid.comment }
	</h6>
	<g:if test="${params.product != null }">
		<h6>
			Product: <img class="caption" title="${params.product.title }"
				src="${createLink(controller:'product', action:'displayImage', id: params.product.id)}" />
		</h6>
	</g:if>
	<g:if test="${params.service != null }">
		<h6>
			Service:
			${params.bid.service.title }
		</h6>
	</g:if>
	<g:form controller="checkout" action="charge" method="POST">
		<g:hiddenField name="amount" value="${params.bid.amount }" />
		<g:hiddenField name="description"
			value="${params.tender.title }" />
		<script src="https://checkout.stripe.com/v2/checkout.js"
			class="stripe-button" data-key="pk_test_CcW6XFMWlFJ7HRytPt9Pi7er"
			data-amount="${params.bid.amount *100} "
			data-name="${params.bid.bidder.companyName}"
			data-description="${params.tender.title }"
			data-image="https://zapier.cachefly.net/storage/services/0cbeb8038d3a9eefbb0963a1f8910822.128x128.png">
			
		</script>
	</g:form>
</body>
</html>