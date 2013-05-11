<!DOCTYPE html>
<html>
<head>
<title>FYP - Live Auction</title>
<meta name="layout" content="main">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>

<script>
	function test() {
		if (document.getElementById('categoryG').value == 'Office Supply') {
			document.getElementById('officeTemplate').style.display = 'block';
		} else {
			document.getElementById('officeTemplate').style.display = 'none';
		}

		if (document.getElementById('categoryG').value == 'Logistics') {
			document.getElementById('logisticTemplate').style.display = 'block';
		} else {
			document.getElementById('logisticTemplate').style.display = 'none';
		}

		if (document.getElementById('categoryG').value == 'Electronics') {
			document.getElementById('electronicsTemplate').style.display = 'block';
		} else {
			document.getElementById('electronicsTemplate').style.display = 'none';
		}
	}
</script>
</head>
<body>
	<h1>
		<em><font color="orange">New Live Tender</font></em>
	</h1>
	<!-- Tabs Left -->
	<ul class="tabs left">
		<li><a href="#tabr1">General</a></li>
		<li><a href="#tabr2">Tendora Genius</a></li>
	</ul>
	<div id="tabr1" class="tab-content">
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
						<label for="check1" class="col_3">Increment</label> <input
							type="checkbox" id="check1" /> <input name="increment"
							id="increment" type="text" placeholder="ie. 10" disabled />
						<script>
							$('#check1').change(
									function() {
										$('#increment').attr('disabled',
												!this.checked);
									});
						</script>
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

						<button class="blue pill"
							onClick="window.location = '/final_year_project/auction/tendoraGenius' ">
							<span class="icon social" data-icon="V"></span>
							<g:message code="Tendora Genius"></g:message>
						</button>
					</p>
				</div>
			</div>
		</g:form>
	</div>
	<div id="tabr2" class="tab-content">
		<g:form class="verical"
			url="[controller:'auction',action:'tendoraGenius']">
			<div class="col_8 column">
				<div class="inner">
					<p>
						<label for="title" class="col_3">Tender Title</label> <input
							name="titleG" type="text" />
					</p>
					<p>
						<label for="category" class="col_3">Category</label> <select
							id="categoryG" style="width: 220px;" onclick='test()'
							name="categoryG">
							<option value="0">-- Choose --</option>
							<option value="Office Supply">Office Supply</option>
							<option value="Logistics">Logistics</option>
							<option value="Electronics">Electronics</option>
						</select>
					</p>
					<div id="officeTemplate" style="display: none;">
						<p>
							<label for="currencyOffice" class="col_3">Currency</label> <select
								id="currencyOffice" class="fancy" style="width: 180px;"
								name="currencyOffice">
								<option value="0">-- Choose --</option>
								<option value="Euro">€ Euro</option>
								<option value="Pound">£ Pound</option>
								<option value="Dollar">$ US Dollar</option>
							</select>
						</p>
						<p>
							<label for="incrementOffice" class="col_3">Increment</label> <input
								type="checkbox" id="incrementOfficeCheck" /> <input
								name="incrementOffice" id="incrementOffice" type="text"
								placeholder="ie. 10" disabled />
							<script>
								$('#incrementOfficeCheck').change(
										function() {
											$('#incrementOffice').attr(
													'disabled', !this.checked);
										});
							</script>
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
							<label for="height" class="col_3">Height</label> <input
								name="height" type="text" />
						</p>
						<p>
							<label for="width" class="col_3">Width</label> <input
								name="width" type="text" />
						</p>
						<p>
							<label for="depth" class="col_3">Depth</label> <input
								name="depth" type="text" />
						</p>
					</div>
					<div id="logisticTemplate" style="display: none;">
						<p>
							<select style="width: 212px;">
								<option value="item1">Item</option>
								<option value="item2">Item</option>
								<option value="item3">Item</option>
							</select>
						</p>
					</div>
					<div id="electronicsTemplate" style="display: none;">
						<p>
							<select style="width: 212px;">
								<option value="item1">Item</option>
								<option value="item2">Item</option>
								<option value="item3">Item</option>
							</select>
						</p>
					</div>
				</div>
			</div>
			<button class="orange pill" type="submit">
				<span class="icon" data-icon="p"></span>
				<g:message code="Tendora Genius"></g:message>
			</button>
		</g:form>
	</div>
</body>
</html>