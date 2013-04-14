<html>
<head>
<title>FYP - Quotes Auction</title>
<meta name="layout" content="main">
</head>
<body>
	<h1>
		<em><font color="#8fc400">New Quotes Auction</font></em>
	</h1>
	<g:form class="verical"
		url="[controller:'auction',action:'newQuotesAuction']">
		<div class="col_6 column">
			<div class="inner">
				<p>
					<label for="title" class="col_3">Auction Title</label> <input
						name="title" type="text" placeholder="ie. Car Insurance" />
				</p>
				<p>
					<label for="category" class="col_3">Category</label> <select
						id="category" multiple="multiple" class="fancy"
						style="width: 280px;" name="category">
						<option value="0">-- Choose --</option>
						<option value="Information Technology">Information
							Technology</option>
						<option value="Food & Drink">Food & Drink</option>
						<option value="Software">Software</option>
						<option value="Logistics">Logistics</option>
						<option value="Office Supply">Office Supply</option>
						<option value="Electronics">Electronics</option>
					</select>
				</p>
				<p>
					<label for="currency" class="col_3">Currency</label> <select
						id="currency" class="fancy" style="width: 220px;" name="currency">
						<option value="0">-- Choose --</option>
						<option value="Euro">€ Euro</option>
						<option value="Pound">£ Pound</option>
						<option value="Dollar">$ US Dollar</option>
					</select>
				</p>
				<p>
					<label for="currency" class="col_3">Description/Specs</label>
					<textarea rows="10" cols="20"
						placeholder="Give as much information as possible" name="description"></textarea>
				</p>
				<p>
					<button class="green pill" type="submit">
						<span class="icon" data-icon="p"></span>
						<g:message code="Create Quotes Auction"></g:message>
					</button>
				</p>
			</div>
		</div>
	</g:form>
</body>
</html>