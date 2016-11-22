<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.util.List , java.util.ArrayList"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br" xml:lang="pt-br">
<head>
<title>Blog de Notícias</title>
</head>
<body>

<h1 align="center">Blog de Notícias</h1>

<form action="Servlet1" name="dados" method="post">
Título: <input type="text" name="titulo"><br>
Subtítulo: <input type="text" name="subtitulo"><br>
Categoria: <input type="text" name="categoria"><br>
<textarea name="conteudo" rows="7" cols="30">Insira aqui o conteúdo da postagem...</textarea><br>
<input type="submit" value="Publicar">
</form>
<BR>
<BR>
<BR>
<table align="center" border=1>
<tr>
<td align="center" width=300><b>TÍTULO</b></td>
<td align="center" width=300><b>SUBTÍTULO</b></td>
<td align="center" width=300><b>CATEGORIA </b></td>
</tr>
<c:set var="bcontrole" scope ="session" value="${sessionScope.blogcontrole}"/>
<c:forEach var="postagem" items="${bcontrole.getPostagens()}">
<tr>
<td><a href="noticia.jsp?id=${postagem.hashCode()}">${postagem.titulo}</a></td>
<td>${postagem.subtitulo}</td>
<td>${postagem.categoria}</td>

</c:forEach>
</table>


</body>
</html>