<html>
	<head>
	<title>FYP - New Product</title>
	<meta name="layout" content="main" />
	</head>
	<body>
	<h5>You can create your new Auction here</h5>
	<g:form class="simpleform" url="[controller:'auction',action:'newAuction']">
  		<fieldset>
    	<legend>Auction</legend>
    	
    	<p>
          <label for="title" class="col_1">Auction Name</label>
          <g:textField name="title" class="col_3"/>
        </p>
        <p>
          <label for="description" class="col_1">Description</label>
          <g:textArea name="description" class="col_3"/>
        </p>
        <label for="startDate" class="col_1">Start Date</label>
        <g:datePicker name="startDate" class="col_3"/>
        <p>
        <label for="endDate" class="col_1">End Date</label>
        <g:datePicker name="endDate" class="col_3"/>
        <p>
        </p>
    	<p class="button">
    	  <label>&nbsp;</label>
    	  <g:submitButton class="button" name="submitButton" value="Create Auction" class="green" />
    	</p>
    	</fieldset>
    </g:form>
	</body>
</html>