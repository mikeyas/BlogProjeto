<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="blog.Usuario"%>
<html lang="pt-br">
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@page import="javax.servlet.*"%>
	<%@page import="javax.servlet.http.*"%>
	<%@page import="java.util.List , java.util.ArrayList, java.util.Collections"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<jsp:include page="includes/head.jsp" />
	
	<title>Blog de Notícias</title>
</head>
<body>
	<jsp:include page="includes/menu.jsp" />
	<jsp:include page="includes/modals.jsp" />

	<div class="container theme-showcase" role="main">
		Ordenar: <a class="btn btn-default"
							href="Servlet1?ordem=${1}" role="button">Por Título &raquo;</a>
				 <a class="btn btn-default"
							href="Servlet1?ordem=${2}" role="button">Por Subtítulo &raquo;</a>
				 <a class="btn btn-default"
							href="Servlet1?ordem=${3}" role="button">Por Categoria &raquo;</a>
				 <a class="btn btn-default"
							href="Servlet1?ordem=${4}" role="button">Por Data &raquo;</a>
		<div class="row">
		
		<%
				Usuario user = null;
				if (session.getAttribute("admin") != null) {
					user = (Usuario) session.getAttribute("admin");
				}%>
			<c:set var="bcontrole" scope="session"
				value="${sessionScope.blogcontrole}" />
			<c:forEach var="postagem" items="${bcontrole.getPostagens()}">
				<div class="col-md-4" align="center">
					<h2>${postagem.titulo}: ${postagem.subtitulo}</h2>
					<p>${postagem.categoria}</p>
					<small>Em: <fmt:formatDate
							type="both" dateStyle="short" timeStyle="short"
							value="${postagem.data}" /></small>
					<p>
					<% if (user != null) { %>
					<a class="btn btn-primary  btn-xs"
						href="editar.jsp?id=${postagem.getId()}" role="button">Editar</a> 
					<a class="btn btn-primary  btn-xs"
							href="Servlet1?excluir=${postagem.hashCode()}" role="button">Excluir</a>
				<% } %>
					<br>
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