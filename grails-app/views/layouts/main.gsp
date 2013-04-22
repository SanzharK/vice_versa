<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><g:layoutTitle default="Grails" /></title>
<link rel="stylesheet"
	href="${resource(dir:'css',file:'kickstart.css')}" />
<link rel="stylesheet"
	href="${resource(dir:'css',file:'kickstart-buttons.css')}" />
<link rel="stylesheet"
	href="${resource(dir:'css',file:'kickstart-forms.css')}" />
<link rel="stylesheet"
	href="${resource(dir:'css',file:'kickstart-grid.css')}" />
<link rel="stylesheet"
	href="${resource(dir:'css',file:'kickstart-icons.css')}" />
<link rel="stylesheet"
	href="${resource(dir:'css',file:'kickstart-menus.css')}" />
<link rel="stylesheet" href="${resource(dir:'css',file:'prettify.css')}" />
<link rel="stylesheet"
	href="${resource(dir:'css',file:'jquery.fancybox-1.3.4.css')}" />
<g:javascript src="jquery-1.7.2.min.js" />
<g:javascript src="kickstart.js" />
<g:javascript src="prettify.js" />
<link rel="shortcut icon"
	href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
<g:layoutHead />
</head>
<body>
	<div id="wrapper" class="col_12 column">
		<div class="inner">

			<!-- header picture -->
			<div id="header">
				<div id="nav">
					<!-- 
					<input id="text2" class="col_11" type="text" placeholder="Search" />
					<button class="blue pill"
									onClick="window.location = '/final_year_project/main/search' ">
									<g:message code="Search"></g:message>
								</button>
					<p></p>
					 -->
					<!-- Menu Horizontal -->
					<ul class="menu">
						<li><a href="/final_year_project"><span
								class="icon medium blue" data-icon="I"></span>Home</a></li>
						<g:if test="${session?.user}">
							<li class="has-menu"><a
								href="/final_year_project/user/myPage"><span
									class="icon medium blue" data-icon="u"></span>My Page</a>
								<ul>
									<li><a href="/final_year_project/user/connect"><span class="icon small blue"
											data-icon="U"></span>Connections</a></li>
									<li><a href="/final_year_project/user/message"><span
											class="icon small blue" data-icon='"'></span>Messages</a></li>
									<li><a href="/final_year_project/user/proposal"><span
											class="icon small blue" data-icon='@'></span>Proposals</a></li>
								</ul></li>
						</g:if>
						<li><a href="/final_year_project/auction/auctionHome"><span
								class="icon medium blue" data-icon="j"></span>Tenders</a></li>
						<li><a href=""><span class="icon medium blue"
								data-icon="i"></span>How it Works</a></li>
						<li><a href="/final_year_project/main/contactUs"><span
								class="icon medium blue" data-icon="8"></span>Contact Us</a></li>
						<g:if test="${session?.user}">
						<li id="login" style="float: right;">
								${session?.user?.companyName} (${session?.user?.email}) |
								<button class="orange pill"
									onClick="window.location = '/final_year_project/user/logout' ">
									<span class="icon" data-icon="Q"></span>
									<g:message code="Logout"></g:message>
								</button>
							</li>
							<!-- END #login -->
						</g:if>
						<g:else>
							<g:form url="[controller:'user',action:'login']">
								<li><g:textField name="email" placeholder="Email"
										class="input" /></li>
								<li><g:passwordField name="password" placeholder="Password" /></li>
								<li><g:submitButton class="button" name="submitButton"
										value="Login" class="green pill" /></li>
							</g:form>
							<li>
								<button class="orange pill"
									onClick="window.location = '/final_year_project/user/register' " name="registrationButton">
									<g:message code="Register"></g:message>
								</button>
							</li>
						</g:else>
					</ul>
				</div>
				<!-- END #nav -->
				<div id="content">
					<g:layoutBody />
				</div>
				<!-- END #content -->
			</div>
			<!-- END #wrapper -->
		</div>
	</div>
</body>
</html>