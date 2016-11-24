<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.util.List , java.util.ArrayList"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br" xml:lang="pt-br">
<head>
<title>Blog de Notícias</title>
</head>
<body>

<h1 align="center">Blog de Notícias</h1>
<input type="button" onClick="window.location.href='blog.jsp'"value="Voltar">

<BR>
<BR>
<BR>
<c:set var="buscar" scope ="request" value="${param.buscar}"/>
<form action="pesquisa.jsp" name="pesquisa">
Pesquisar no site: <textarea name="buscar" rows="1" cols="30" placeholder="buscar..."></textarea>
<input type="submit" value="Buscar">
</form>
<table align="center" border=1>
<tr>
<td align="center" width=300><b>TÍTULO</b></td>
<td align="center" width=300><b>SUBTÍTULO</b></td>
<td align="center" width=300><b>CATEGORIA </b></td>
</tr>
<c:set var="bcontrole" scope ="session" value="${sessionScope.blogcontrole}"/>
<c:forEach var="postagem" items="${bcontrole.getPostagens()}">
<c:if test="${fn:contains(postagem.titulo, param.buscar) || fn:contains(postagem.subtitulo, param.buscar) || fn:contains(postagem.conteudo, param.buscar) }">
<tr>
<td><a href="noticia.jsp?id=${postagem.hashCode()}">${postagem.titulo}</a></td>
<td>${postagem.subtitulo}</td>
<td>${postagem.categoria}</td>
</tr>
</c:if>
</c:forEach>
</table>


</body>
</html>