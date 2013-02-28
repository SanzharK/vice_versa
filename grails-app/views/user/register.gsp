<html>
<head>
  <title>FYP - User Registration</title>
  <meta name="layout" content="main" />
  <!-- This is my Search bar -->
	<input id="text2" class="col_11" type="text" placeholder="Search" />
	<button class="blue">Search</button>
	<p></p>
	<!-- Menu Horizontal -->
	<ul class="menu">
	<li><a href="/final_year_project">Home</a></li>
	<li><a href="">How it Works</a></li>
	<li><a href="">Contact Us</a></li>
	<li class="current"><a>Registration</a></li>
	</ul>
</head>
<body>
	<!-- Blockquote Small -->
	<blockquote class="small">
	<p>
	Welcome to our registration page! <strong>A company should choose one representative, who will have the authority 
	to represent the company on this web site</strong>
	</p>
	<p>
	In order to proceed please enter the companies & representatives credentials
	</p>
	<p>
	To prevent fraud each registration will require a confirmation letter
	</p>
	</blockquote>
	<!-- Registration information -->
	<hr class="alt1" />
	<g:form class="simpleform" url="[controller:'user',action:'register']">
  		<fieldset>
    	<legend>Company</legend>
    	<p class="info">
    	  Complete the form below to create an account!
    	</p>
    	<g:hasErrors bean="${user}">
    	  <div class="errors">
    	    <g:renderErrors bean="${user}"/>
    	  </div>
    	</g:hasErrors>
    	<p>
    	
    	<p>
          <label for="companyName" class="col_1">Company</label>
          <g:textField name="companyName" class="col_3"/>
        </p>
        <p>
          <label for="phone" class="col_1">Phone</label>
          <g:textField name="phone" class="col_3"/>
        </p>
        <p>
          <label for="addressLine1" class="col_1">Address</label>
          <g:textField name="addressLine1" class="col_3"/>
        </p>
        <p>
          <label for="addressLine2" class="col_1">Address</label>
          <g:textField name="addressLine2" class="col_3"/>
        </p>
        <p>
          <label for="city" class="col_1">City</label>
          <g:textField name="city" class="col_3"/>
        </p>
        <p>
            <select name="country" id="select2" class="fancy chzn-done" style="width: 17%; dispay: none;">
                <option value="0">-- Choose Country --</option>
                <option value="Ireland">Ireland</option>
                <option value="England">England</option>
                <option value="Wales">Wales</option>
            </select>
        </p>
    	
    	<hr class="alt2" />
    	<legend>Representative</legend>
    	
    	<p>
   	 	  <label for="firstName" class="col_1">First Name</label>
      	<g:textField name="firstName" value="${user?.firstName}"
        	class="${hasErrors(bean:user,field:'firstName','errors')}"  class="col_3"/>
    	</p>
    	<p>
    	  <label for="lastName" class="col_1">Last Name</label>
    	  <g:textField name="lastName" value="${user?.lastName}"
    	    class="${hasErrors(bean:user,field:'lastName','errors')}" class="col_3"/>
    	</p>
    	<p>
    	  <label for="email" class="col_1">Email</label>
    	  <g:textField name="email" value="${user?.lastName}"
    	    class="${hasErrors(bean:user,field:'email','errors')}" class="col_3"/>
    	</p>
    	<p>
    	  <label for="password" class="col_1">Password</label>
    	  <g:passwordField name="password"
    	    class="${hasErrors(bean:user,field:'password','errors')}" class="col_3"/>
    	</p>
    	<p>
    	  <label for="confirm" class="col_1">Confirm Password</label>
    	  <g:passwordField name="confirm"
    	    class="${hasErrors(bean:user,field:'password','errors')}" class="col_3"/>
    	</p>
    	
    	<hr class="alt2" />
    	
    	<p class="button">
    	  <label>&nbsp;</label>
    	  <g:submitButton class="button" name="submitButton" value="Create Account" class="green" />
    	</p>
  	</fieldset>
	</g:form>
</body>
</html>