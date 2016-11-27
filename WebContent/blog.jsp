<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@page import="javax.servlet.*"%>
	<%@page import="javax.servlet.http.*"%>
	<%@page import="java.util.List , java.util.ArrayList"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
	<jsp:include page="includes/head.jsp" />
	
	<title>Blog de Notícias</title>
</head>
<body>
	<jsp:include page="includes/menu.jsp" />
	<jsp:include page="includes/modals.jsp" />

	<div class="container theme-showcase" role="main">

		<div class="row">
			<c:set var="bcontrole" scope="session"
				value="${sessionScope.blogcontrole}" />
			<c:forEach var="postagem" items="${bcontrole.getPostagens()}">
				<div class="col-md-4">
					<h2>${postagem.subtitulo}</h2>
					<p>${postagem.categoria}</p>
					<p>
						<a class="btn btn-default"
							href="noticia.jsp?id=${postagem.hashCode()}" role="button">Mais
							&raquo;</a>
					</p>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>