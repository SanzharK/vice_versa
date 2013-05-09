<html>
<head>
<title>FYP - Company</title>
<meta name="layout" content="main" />
<link href="${resource(dir:'/rate-it',file:'rateit.css')}"
	rel="stylesheet" type="text/css">
</head>
<body>
	<div class="col_4">
		<h3>
			${params.searchedUser.companyName}
		</h3>
		<label>Average Rating </label><div class="rateit" data-rateit-value="${params.average }"
						data-rateit-ispreset="true" data-rateit-readonly="true"></div>
		<img class="align-left"
			src="${resource(dir:'images',file:'sme-community.jpg')}" width="300"
			height="300" />
		<g:form url="[controller:'user',action:'rate']">
			<h5>Rating & Review</h5>
			<g:hiddenField name="ratedCompany"
				value="${params.searchedUser.companyName}" />
			<p>
				<input type="range" min="0" max="5" value="0" step="0.5"
					id="backing2">
			<div class="rateit" id="rating" data-rateit-backingfld="#backing2"></div>
			<div>
				<g:hiddenField id="ratingField" name="ratingInt" />
			</div>

			<script type="text/javascript">
				$("#rating").bind('rated', function(event, value) {
					$('#ratingField').val(value);
				});
			</script>
			</p>
			<textarea rows="4" style="width: 80%;"
				placeholder="Max. 145 characters" name="comment"></textarea>
			<p>
				<button class="blue pill" type="submit">
					<span class="icon" data-icon='d'></span>
					<g:message code="Review"></g:message>
				</button>
			</p>
		</g:form>
	</div>
	<div class="col_4 column">
		<h4>Ratings & Reviews</h4>
		<ul>
			<g:each var="review" in="${params.reviews}">
				<li><div class="rateit" data-rateit-value="${review.rating }"
						data-rateit-ispreset="true" data-rateit-readonly="true"></div>
					<div>
						<h6>
							${review.comment }
						</h6>
						<p>
						<h6>
							by
							${review.reviewer.companyName }
						</h6>
					</div></li>
			</g:each>
		</ul>
	</div>
	<div class="col_4 column">
		<h4>Services</h4>
		<ul id="services" class="alt">
			<g:each var="service" in="${params.services}">
				<li>
					${service.title}
				</li>
			</g:each>
		</ul>
		<h4>Products</h4>
		<ul id="services" class="alt">
			<g:each var="product" in="${params.products}">
				<li>
					${product.title}
				</li>
			</g:each>
		</ul>
	</div>
	<g:javascript src="rate-it/jquery.rateit.js" />
</body>
</html>