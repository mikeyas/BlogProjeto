<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.util.List , java.util.ArrayList"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Blog de Notícias</title>
</head>
<body>
<h1 align=middle>Blog de Notícias</h1>
<br>
<a href="blog.jsp">(((VOLTAR)))</a>
<br>

<fmt:parseNumber var="id" type="number" value="${param.id}"/>
<c:set var="blogcontrole" scope ="session" value="${sessionScope.blogcontrole}"/>
<c:forEach var="postagem" items="${blogcontrole.getPostagens()}">
<c:if test="${postagem.hashCode()==id}">

<table align="center">
<tr><td align="center"><h3>${postagem.titulo}: ${postagem.subtitulo}</h3></td></tr>
<tr><td align="center">
<font size="3">Categoria: ${postagem.categoria}</font>
<font size="3"> - Em: <fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${postagem.data}"/></font>
</td>
</tr>
<tr>
<td align="center">
<img width="400px" height="400px" src="/BlogProjeto/imagens/${postagem.imagem}"/>
</td>
</tr>
<tr><td align="justify" width=900>
<hr>
${postagem.conteudo}
<hr>
</td>
</tr>
</table>
<br>
<br>
<form> 
			<label for="comentários">Comentários:</label>
			<select name="comentários" > 
			<option value='' selected="selected" ></option> 
            <option value='exibir' >Exibir</option> 
            <option value='ocultar' >Ocultar</option><br>
            </select>
</form>
Valor param: ${param.comentários}
<br>
<fmt:parseNumber var="comentarios" type="number" value="${param.comentários}"/>
Valor int: ${comentarios}
<c:if test="${param.comentários != 'ocultar'}">
<form action="Servlet2" method="post">
<table align="center" width=500>
<tr><td>
Nome: <input type="text" name="usuario"><br>
Email: <input type="text" name="email"><br>
Telefone: <input type="text" name="fone"><br>
<input type="hidden" name="id" value="${param.id}">
<input type="submit" value="Publicar"><br>
</td>
<td>
<textarea name="conteudo" rows="7" cols="40">Insira aqui seu comentário...</textarea>
</td>
</tr>
</table>
</form>



<c:forEach var="comentario" items="${postagem.getComentarios()}">
<table align="center" width=500>
<tr>
<td width=150><font size="2">
${comentario.usuario}<br>
${comentario.email}<br>
${comentario.fone}
</font>
</td>
<td align=justify width=350>
<font size="2"><i>Comentou em: <fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${comentario.data}"/><br></font>
<font size="3">${comentario.conteudo}</font></td>
</tr>
</table>
</c:forEach>
</c:if>
</c:if>
</c:forEach>

</body>
</html>