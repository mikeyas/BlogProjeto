<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.util.List , java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="includes/head.jsp" />
 
<link href="css/signin.css" rel="stylesheet">

<title>Blog de Login</title>
</head>
<body>

	<div class="container">
		<form class="form-signin" action="login" method="post">
			<h2 class="form-signin-heading">Login</h2>

			<label for="inputEmail" class="sr-only">Login</label> 
			
			<input type="text" id="inputPassword" class="form-control" name="login"
				placeholder="Login" required autofocus> 
				
			<label for="inputPassword" class="sr-only">Senha</label> 
			
			<input type="password" id="inputPassword" class="form-control" name="senha"
			placeholder="Password" required>

			<button class="btn btn-lg btn-success btn-block" type="submit">Entrar</button>
			<a href="blog" class="btn btn-lg btn-primary btn-block">Voltar</a>

			<hr />
			<% if ("error".equals(request.getParameter("user"))) { %>
				
				<div class="alert alert-warning" role="alert">
				  <a href="#" class="alert-link">Usuario inválido</a>
				</div>
			<% } %>
			
			<% if ("error".equals(request.getParameter("pass"))) { %>
				<div class="alert alert-warning" role="alert">
				  <a href="#" class="alert-link">Senha inválido</a>
				</div>
			<% } %>
		</form>

	</div>
	<!-- /container -->


	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
