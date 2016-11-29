	<%@page import="blog.Usuario"%>
	<%
	blog.Usuario user = null;
	if(session.getAttribute("admin") != null ){
		user = (blog.Usuario)session.getAttribute("admin");
	}
	%>


<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="./">Blog de Notícias</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li class="active"><a href="./">Home</a></li>
				<% if(user != null && user.getLogado()){ %>
				<li><a href="#" data-toggle="modal" data-target="#novaPostagem"
					data-whatever="@mdo">Novo Post</a></li>
				<% } %>
				
			</ul>

			<div class="navbar-form navbar-right">
				<% if(user != null && user.getLogado()){ %>
				<span class="label label-default"><%=user.getNome() %></span> 
				<a onclick="window.location='sair.jsp'" class="btn btn-danger btn-xs">Sair</a> 
				<% } else { %>
				<a href="login" class="btn btn-success btn-xs">Entrar</a>
				<% } %>
				<a href="#" data-toggle="modal" class="btn btn-default btn-xs"
				data-target="#busca" data-whatever="@mdo">Pesquisar</a>
			</div>

		</div>
		<!--/.navbar-collapse -->
	</div>
</nav>