<!-- Modal Novo Post -->
<form action="Servlet1" name="dados" method="post"> 
<input type="hidden" name="id" value="0">
<input type="hidden" name="form" value="novo">
	<div class="modal fade" id="novaPostagem" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">Novo Post</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="recipient-name" class="control-label">Título:</label>
						<input type="text" class="form-control" id="recipient-name"
							name="titulo" placeholder="Digíte o título da postagem">
					</div>
					<div class="form-group">
						<label for="recipient-name" class="control-label">Subtítulo:</label>
						<input type="text" class="form-control" id="recipient-name"
							name="subtitulo" placeholder="Digíte o subtítulo da postagem">
					</div>
					<div class="form-group">
						<label for="recipient-name" class="control-label">Categoria:</label>
						<input type="text" class="form-control" id="recipient-name"
							name="categoria" placeholder="Digíte a categoria da postagem">
					</div>
					<div class="form-group">
						<label for="message-text" class="control-label">Texto:</label>
						<textarea class="form-control" id="message-text" name="conteudo"
							rows="5" cols="30"
							placeholder="Insira aqui o conteúdo da postagem..."></textarea>
					</div>
				</div>
				<div class="modal-footer">
					<!-- button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button -->
					<button type="submit" class="btn btn-primary">Enviar</button>
				</div>
			</div>
		</div>
	</div>
</form>
<!-- ./Modal Novo Post -->


<!-- Modal Busca -->
<form action="pesquisa.jsp" name="dados" method="get">
	<div class="modal fade" id="busca" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="exampleModalLabel">Pesquisar no
						site</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label for="recipient-name" class="control-label">Busca:</label> <input
							type="text" class="form-control" id="recipient-name" name="buscar"
							placeholder="Buscar ...">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
					<button type="submit" class="btn btn-primary">Buscar</button>
				</div>
			</div>
		</div>
	</div>
</form>
<!-- ./Modal Busca-->