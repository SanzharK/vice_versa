<html>
	<head>
	<title>FYP - New Product</title>
	<meta name="layout" content="main" />
	</head>
	<body>
	<h5>You can create your new Product here</h5>
	<g:form class="simpleform" url="[controller:'product',action:'newProduct']" enctype="multipart/form-data">
  		<fieldset>
    	<legend>Product</legend>
    	<p>
          <label for="title" class="col_1">Product Name</label>
          <g:textField name="title" class="col_3"/>
        </p>
        <p>
        <label for="file1">Image</label>
        <input id="file1" type="file" class="file" name="image">
        </p>
        <p>
          <label for="description" class="col_1">Description</label>
          <g:textArea name="description" class="col_3"/>
        </p>
    	<p class="button">
    	  <label>&nbsp;</label>
    	  <g:submitButton class="button" name="submitButton" value="Create Product" class="green" />
    	</p>
    	</fieldset>
    </g:form>
	</body>
</html>