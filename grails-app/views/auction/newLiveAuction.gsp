<!DOCTYPE html>
<html>
<head>
<title>FYP - Live Auction</title>
<meta name="layout" content="main">
</head>
<body>
	<h1>
		<em><font color="orange">New Live Tender</font></em>
	</h1>
	<g:form class="verical"
		url="[controller:'auction',action:'newLiveAuction']">
		<div class="col_8 column">
			<div class="inner">
				<p>
					<label for="title" class="col_3">Tender Title</label> <input
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
						id="currency" class="fancy" style="width: 180px;" name="currency">
						<option value="0">-- Choose --</option>
						<option value="Euro">€ Euro</option>
						<option value="Pound">£ Pound</option>
						<option value="Dollar">$ US Dollar</option>
					</select>
				</p>
				<p>
					<script>
						$('#check1').change(function() {
							$('#increment').attr('disabled', !this.checked);
						});
					</script>
					<label for="check1" class="col_3">Increment</label> <input
						type="checkbox" id="check1" /> <input name="increment"
						id="increment" type="text" placeholder="ie. 10"
						disabled="disabled" />
				</p>
				<p>
					<label class="col_3">Start</label>
					<g:datePicker name="startDate" value="${new Date()}"
						noSelection="['':'-Choose-']" />
				</p>
				<p>
					<label class="col_3">End</label>
					<g:datePicker name="endDate" value="${new Date()}"
						noSelection="['':'-Choose-']" />
				</p>
				<p>
					<label for="description" class="col_3">Description/Specs</label>
					<textarea rows="10" cols="20"
						placeholder="Give as much information as possible"
						name="description"></textarea>
				</p>
				<p>
					<button class="orange pill" type="submit">
						<span class="icon" data-icon="p"></span>
						<g:message code="Create Live Tender"></g:message>
					</button>

					<button class="blue pill" type="submit">
						<span class="icon social" data-icon="E"></span>
						<g:message code="Tweet Live Tender"></g:message>
					</button>
				</p>
			</div>
		</div>
	</g:form>
</body>
</html>