<html>
<head>
  <title>FYP - Homepage</title>
  <meta name="layout" content="main" />
</head>
<body>
<g:if test="${session?.user}">
</g:if>
<g:else>
  <g:form class="simpleform" style="width:50%;" url="[controller:'user',action:'login']">
    <fieldset>
      <legend>Login</legend>
      <p class="info">
        Please login with your username and password. <br />
        Don't have an account?
        <g:link controller="user" action="register">Sign up now!</g:link>
      </p>
      <g:if test="${flash.message}">
          <div class="message">${flash.message}</div>
      </g:if>
      <p>
        <label for="username">Username</label>
        <g:textField name="username" />
      </p>
      <p>
        <label for="password">Password</label>
        <g:passwordField name="password" />
      </p>
      <p class="button">
        <label>&nbsp;</label>
        <g:submitButton class="button" name="submitButton" value="Login" />
      </p>
    </fieldset>
  </g:form>
</g:else>
<div id="multi_media">
<video style="background:#000" id="video" preload="auto" autobuffer="" controls="" poster="http://videos.mozilla.org/serv/webmademovies/popcornposter.png">
              <source src="http://videos.mozilla.org/serv/webmademovies/wtfpopcorn.mp4" type="video/mp4">
              <source src="http://videos.mozilla.org/serv/webmademovies/wtfpopcorn.webm" type="video/webM">
              <source src="http://videos.mozilla.org/serv/webmademovies/wtfpopcorn.ogv" type="video/ogg">
</video>
<img src="${resource(dir:'images',file:'latest_tweets.jpg')}" alt="header" />
</div>
</body>
</html>