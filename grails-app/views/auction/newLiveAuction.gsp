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
				<!-- <p>
					<label class="col_3">Time</label> <select class="fancy"
						name="startTime">
						<option value="9:00 AM">9:00 AM</option>
						<option value="9:15 AM">9:15 AM</option>
						<option value="9:30 AM">9:30 AM</option>
						<option value="9:45 AM">9:45 AM</option>

						<option value="10:00 AM">10:00 AM</option>
						<option value="10:15 AM">10:15 AM</option>
						<option value="10:30 AM">10:30 AM</option>
						<option value="10:45 AM">10:45 AM</option>

						<option value="11:00 AM">11:00 AM</option>
						<option value="11:15 AM">11:15 AM</option>
						<option value="11:30 AM">11:30 AM</option>
						<option value="11:45 AM">11:45 AM</option>

						<option value="12:00 PM">12:00 PM</option>
						<option value="12:15 PM">12:15 PM</option>
						<option value="12:30 PM">12:30 PM</option>
						<option value="12:45 PM">12:45 PM</option>

						<option value="1:00 PM">1:00 PM</option>
						<option value="1:15 PM">1:15 PM</option>
						<option value="1:30 PM">1:30 PM</option>
						<option value="1:45 PM">1:45 PM</option>

						<option value="2:00 PM">2:00 PM</option>
						<option value="2:15 PM">2:15 PM</option>
						<option value="2:30 PM">2:30 PM</option>
						<option value="2:45 PM">2:45 PM</option>

						<option value="3:00 PM">3:00 PM</option>
						<option value="3:15 PM">3:15 PM</option>
						<option value="3:30 PM">3:30 PM</option>
						<option value="3:45 PM">3:45 PM</option>

						<option value="4:00 PM">4:00 PM</option>
						<option value="4:15 PM">4:15 PM</option>
						<option value="4:30 PM">4:30 PM</option>
						<option value="4:45 PM">4:45 PM</option>

						<option value="5:00 PM">5:00 PM</option>
						<option value="5:15 PM">5:15 PM</option>
						<option value="5:30 PM">5:30 PM</option>
						<option value="5:45 PM">5:45 PM</option>

						<option value="6:00 PM">6:00 PM</option>
						<option value="6:15 PM">6:15 PM</option>
						<option value="6:30 PM">6:30 PM</option>
						<option value="6:45 PM">6:45 PM</option>

						<option value="7:00 PM">7:00 PM</option>
					</select>
				</p> -->
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
				</p>
			</div>
		</div>
	</g:form>
</body>
</html>