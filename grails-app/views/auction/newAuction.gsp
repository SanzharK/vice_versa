<html>
	<head>
	<title>FYP - New Product</title>
	<meta name="layout" content="main" />
		<!-- This is my Search bar -->
	<input id="text2" class="col_11" type="text" placeholder="Search" />
	<button class="blue">Search</button>
	<p></p>
	<!-- Menu Horizontal -->
	<ul class="menu">
	<li><a href="/final_year_project">Home</a></li>
	<g:if test="${session?.user}">
	<li><a href="/final_year_project/user/myPage">My Page</a></li>
	</g:if>
	<li><a href="">How it Works</a></li>
	<li><a href="">Contact Us</a></li>
	<li class="current"><a href="">New Auction</a></li>
	<g:if test="${session?.user}">
	<li><a></a></li>
	<li><a></a></li>
	<li><a></a></li>
	<li><a></a></li>
	<li><a></a></li>
	<li><a></a></li>
	<li><a></a></li>
	<li><a></a></li>
	<li><a></a></li>
	<li><a></a></li>
	<li><a></a></li>
	<li><a></a></li>
		<li id="login">
    	    ${session?.user?.companyName} (${session?.user?.email}) |
    	<g:link controller="user" action="logout">Logout</g:link></li>
	<!-- END #login -->
	</g:if>
	</ul>
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