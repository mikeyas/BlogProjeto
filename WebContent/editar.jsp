<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="javax.servlet.*"%>
<%@page import="javax.servlet.http.*"%>
<%@page import="java.util.List , java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="includes/head.jsp" />

<title>Editar Postagem</title>
</head>
<body>

	<jsp:include page="includes/menu.jsp" />
	<jsp:include page="includes/modals.jsp" />


	<div class="container theme-showcase" role="main">

		<div class="row">
			<%
				blog.BlogController BlogControle = (blog.BlogController) session.getAttribute("blogcontrole");
				blog.Usuario user = null;
				if (session.getAttribute("admin") != null) {
					user = (blog.Usuario) session.getAttribute("admin");
				}

				ArrayList<blog.Postagem> posts = null;
				if (session.getAttribute("admin") != null) {
					posts = (ArrayList<blog.Postagem>) BlogControle.getPostagens();
				}
				if (posts != null) {

					blog.Postagem post = posts.get(Integer.parseInt(request.getParameter("id")));
			%>

			<!-- Modal Novo Post -->
			<form action="Servlet1" name="dados" method="post">
				<input type="hidden" name="id" value="<%=post.getId() %>"> <input
					type="hidden" name="form" value="editar">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-body">
							<div class="form-group">
								<label for="recipient-name" class="control-label">Título:</label>
								<input type="text" class="form-control" id="recipient-name"
									name="titulo" placeholder="Digíte o título da postagem"
									value="<%=post.getTitulo()%>">
							</div>
							<div class="form-group">
								<label for="recipient-name" class="control-label">Sub-titulo:</label>
								<input type="text" class="form-control" id="recipient-name"
									value="<%=post.getSubtitulo()%>" name="subtitulo"
									placeholder="Digíte o sub-titulo da postagem">
							</div>
							<div class="form-group">
								<label for="recipient-name" class="control-label">Categoria:</label>
								<input type="text" class="form-control" id="recipient-name"
									value="<%=post.getCategoria()%>" name="categoria"
									placeholder="Digíte a categoria da postagem">
							</div>
							<div class="form-group">
								<label for="message-text" class="control-label">Texto:</label>
								<textarea class="form-control" id="message-text" name="conteudo"
									placeholder="Insira aqui o conteúdo da postagem..." rows="5"
									cols="30"><%=post.getConteudo()%></textarea>
							</div>
						</div>
						<div class="modal-footer">
							<%
								if ("sucesso".equals(request.getParameter("mensagem"))) {
							%>
							<div class="btn btn-success disabled" role="alert">
								Dados alterado com sucesso !!!
							</div>
							<%
								}
							%>
							<a href="blog" class="btn btn-default" data-dismiss="modal">Voltar</a>
							<button type="submit" class="btn btn-primary">Enviar</button>
						</div>
					</div>
				</div>
			</form>
			<!-- ./Modal Novo Post -->
			<%
				}
			%>
		</div>
	</div>
</body>
</html>