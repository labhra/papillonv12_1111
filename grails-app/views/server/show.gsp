
<%@ page import="shiro_test.Server" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="noreen_kevin">
    <link rel="shortcut icon" href="${assetPath(src: 'butterfly_icon.gif')}" type="image/x-icon">

    <title>Show Server</title>

	<asset:stylesheet src="application.css"/>
	<asset:javascript src="application.js"/>
	
    <!-- Bootstrap core CSS -->
     <asset:stylesheet src="bootstrap.min.css"/>
    

    <!-- Custom styles for this template -->
     <asset:stylesheet src="jumbotron.css"/>

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
		<g:set var="entityName" value="${message(code: 'server.label', default: 'Server')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
	
		<div class="navbar navbar-inverse navbar-fixed-top" role="navigation" style='font-family:"Ubuntu-C";' >
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Papillon.this</a>
        </div>
        <div class="navbar-collapse collapse">
        
          <form class="navbar-form navbar-right" role="form" action="home/signin">
            <div class="form-group">
              <input name="username" type="text" placeholder="Username" class="form-control">
            </div>
            <div class="form-group">
              <input name="password" type="password" placeholder="Password" class="form-control">
            </div>
            <button type="submit" class="btn" style="background-color:#EBFAFA; color:#33CCCC;">Sign in</button>
          </form>
          
        </div><!--/.navbar-collapse -->
      </div>
    </div>
	
		<a href="#show-server" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation" style='font-family:"Ubuntu-C";'>
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-server" class="content scaffold-show" style='font-family:"Ubuntu-C";' role="main">
			<h1 style="color: #33CCCC"><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status" style='font-family:"Ubuntu-C";'>${flash.message}</div>
			</g:if>
			<ol class="property-list server">
			
				<g:if test="${serverInstance?.serverName}">
				<li class="fieldcontain">
					<span id="serverName-label" class="property-label"><g:message code="server.serverName.label" default="Server Name" /></span>
					
						<span class="property-value" aria-labelledby="serverName-label"><g:fieldValue bean="${serverInstance}" field="serverName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serverInstance?.location}">
				<li class="fieldcontain">
					<span id="location-label" class="property-label"><g:message code="server.location.label" default="Location" /></span>
					
						<span class="property-value" aria-labelledby="location-label"><g:fieldValue bean="${serverInstance}" field="location"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serverInstance?.rack}">
				<li class="fieldcontain">
					<span id="rack-label" class="property-label"><g:message code="server.rack.label" default="Rack" /></span>
					
						<span class="property-value" aria-labelledby="rack-label"><g:fieldValue bean="${serverInstance}" field="rack"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serverInstance?.floor}">
				<li class="fieldcontain">
					<span id="floor-label" class="property-label"><g:message code="server.floor.label" default="Floor" /></span>
					
						<span class="property-value" aria-labelledby="floor-label"><g:fieldValue bean="${serverInstance}" field="floor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serverInstance?.costcenters}">
				<li class="fieldcontain">
					<span id="costcenters-label" class="property-label"><g:message code="server.costcenters.label" default="Costcenters" /></span>
					
						<g:each in="${serverInstance.costcenters}" var="c">
						<span class="property-value" aria-labelledby="costcenters-label"><g:link controller="cost_Center" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${serverInstance?.results}">
				<li class="fieldcontain">
					<span id="results-label" class="property-label"><g:message code="server.results.label" default="Results" /></span>
					
						<g:each in="${serverInstance.results}" var="r">
						<span class="property-value" aria-labelledby="results-label"><g:link controller="result" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:serverInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons" style='font-family:"Ubuntu-C";'>
					<g:link class="edit" action="edit" resource="${serverInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
