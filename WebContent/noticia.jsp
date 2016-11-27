<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.util.List , java.util.ArrayList"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="includes/head.jsp" />

<title>Blog de Notícias</title>
</head>
<body>
	<jsp:include page="includes/menu.jsp" />
	<jsp:include page="includes/modals.jsp" />

	<div class="container theme-showcase" role="main">

		<fmt:parseNumber var="id" type="number" value="${param.id}" />
		<c:set var="blogcontrole" scope="session"
			value="${sessionScope.blogcontrole}" />
		<c:forEach var="postagem" items="${blogcontrole.getPostagens()}">
			<c:if test="${postagem.hashCode()==id}">

				<div class="page-header">
					<h1>
						${postagem.titulo}<small> - ${postagem.subtitulo}</small>
					</h1>
					<small>Categoria: ${postagem.categoria} - Em: <fmt:formatDate
							type="both" dateStyle="short" timeStyle="short"
							value="${postagem.data}" /></small>
				</div>

				<div class="container">
					<img class="img-thumbnail" alt="Imagem não encontrada"
						class="media-object" src="/BlogProjeto/imagens/${postagem.imagem}"
						data-holder-rendered="true" style="width: 200px; height: 200px;">
					${postagem.conteudo}
				</div>

				<hr />

				<!-- Botões Comentários -->
				<div class="row">
					<div class="col-md-3">
						<a href="#" data-toggle="modal" data-target="#novoComentario"
							data-whatever="@mdo" class="btn btn-primary">Novo Post</a>
					</div>

					<div class="col-md-3">
						<form action="noticia.jsp" method="post">
							<input type="hidden" name="id" value="${param.id}"> <input
								type="hidden" name="coments" value="2"> <input
								type="submit" align="middle" class="btn btn-danger"
								value="Ocultar Coments">
						</form>
					</div>

					<div class="col-md-3">
						<form action="noticia.jsp" method="post">
							<input type="hidden" name="id" value="${param.id}"> <input
								type="hidden" name="coments" value="1"> <input
								type="submit" align="middle" class="btn btn-success"
								value="Exibir Coments">
						</form>
					</div>
				</div>
				<!-- ./Botões Comentários -->

				<!-- Modal Novo Comentário -->
				<form action="Servlet2" name="dados" method="post">
					<input type="hidden" name="id" value="${param.id}">
					<div class="modal fade" id="novoComentario" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="exampleModalLabel">Novo
										Comentário</h4>
								</div>
								<div class="modal-body">
									<div class="form-group">
										<label for="recipient-name" class="control-label">Nome:</label>
										<input type="text" class="form-control" id="recipient-name"
											name="usuario" placeholder="Digíte seu nome">
									</div>
									<div class="form-group">
										<label for="recipient-name" class="control-label">E-mail:</label>
										<input type="text" class="form-control" id="recipient-name"
											name="email" placeholder="Digíte seu e-mail">
									</div>
									<div class="form-group">
										<label for="recipient-name" class="control-label">Telefone:</label>
										<input type="text" class="form-control" id="recipient-name"
											name="fone" placeholder="Digíte o nº do seu telefone">
									</div>
									<div class="form-group">
										<label for="message-text" class="control-label">Texto:</label>
										<textarea class="form-control" id="message-text"
											name="conteudo" rows="7" cols="30"
											placeholder="Insira aqui seu comentário"></textarea>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Fechar</button>
									<button type="submit" class="btn btn-primary">Enviar</button>
								</div>
							</div>
						</div>
					</div>
				</form>
				<!-- ./Modal Novo Comentário -->

				<!-- Lista de Comentários -->
				<c:if test="${param.coments!=2}">
				<br />
					<div class="panel panel-default">
						<div class="panel-body">
							<c:forEach var="comentario" items="${postagem.getComentarios()}">

								<div class="panel panel-default">
									<div class="panel-heading">
										<h3 class="panel-title">${comentario.usuario}
											<small>(Comentou em: <fmt:formatDate type="both"
													dateStyle="short" timeStyle="short"
													value="${comentario.data}" /> | E-mail:
												${comentario.email} | Tel.: ${comentario.fone} )
											</small>
										</h3>
									</div>
									<div class="panel-body">

										<p>${comentario.conteudo}</p>
									</div>
								</div>

							</c:forEach>
						</div>
					</div>
				</c:if>
				<!-- ./Lista de Comentários -->

			</c:if>
		</c:forEach>

	</div>
</body>
</html>