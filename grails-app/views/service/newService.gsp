<html>
	<head>
	<title>FYP - New Service</title>
	<meta name="layout" content="main" />
	</head>
	<body>
	<h5>You can create your new Service here</h5>
	<g:form class="simpleform" url="[controller:'service',action:'newService']">
  		<fieldset>
    	<legend>Service</legend>
    	
    	<p>
          <label for="title" class="col_1">Service Title</label>
          <g:textField name="title" class="col_3"/>
        </p>
        <p>
          <label for="description" class="col_1">Description</label>
          <g:textArea name="description" class="col_3"/>
        </p>
    	<p class="button">
    	  <label>&nbsp;</label>
    	  <g:submitButton class="button" name="submitButton" value="Create Service" class="green" />
    	</p>
    	</fieldset>
    </g:form>
	</body>
</html>