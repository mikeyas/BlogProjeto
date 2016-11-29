package blog;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import blog.*;

/**
 * Servlet implementation class Servlet1
 */
public class Servlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet1() {
        super();
        // TODO Auto-generated constructor stub
    }
int ordem = 0;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter(); 
	    HttpSession s = request.getSession(); 
	    BlogController BlogControle = (BlogController) s.getAttribute("blogcontrole"); 
	    if(request.getParameter("ordem")!=null){ 
	      ordem = Integer.parseInt(request.getParameter("ordem")); 
	      for(Postagem p:BlogControle.getPostagens()){ 
	        p.setOrdenaTipo(ordem); 
	        //out.println(p.getTitulo()); 
	      }
	      Collections.sort(BlogControle.getPostagens());
	      s.setAttribute("blogcontrole", BlogControle); 
	      request.getRequestDispatcher("blog.jsp").forward(request,response);
	      }
	    
	    if(request.getParameter("excluir")!=null){
	    	int excluir = Integer.parseInt(request.getParameter("excluir")); 
	    	if(BlogControle.getPostagens()!=null){
		      for(Postagem p:BlogControle.getPostagens()){ 
		    	  if(p.hashCode()==excluir){
		    		  BlogControle.getPostagens().remove(p);
		    		  s.setAttribute("blogcontrole", BlogControle); 
		    	      request.getRequestDispatcher("blog.jsp").forward(request,response);
		    	  }
		      }
	    }
	    }
	    s.setAttribute("blogcontrole", BlogControle); 
	      request.getRequestDispatcher("blog.jsp").forward(request,response); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		Integer id = Integer.parseInt(request.getParameter("id"));
		String form = request.getParameter("form");

		if (form.equals("editar")) {
			editPost(request, response, id);
		} else {
			addPost(request, response);
		}
	}
	
	protected void addPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//PrintWriter out = response.getWriter();
		HttpSession s = request.getSession();
				
		if(s.isNew()){
			
			Postagem postagem = new Postagem();
			postagem.setTitulo(request.getParameter("titulo"));
			postagem.setSubtitulo(request.getParameter("subtitulo"));
			postagem.setCategoria(request.getParameter("categoria"));
			postagem.setConteudo(request.getParameter("conteudo"));
			BlogController BlogControle = new BlogController();
			BlogControle.getPostagens().add(postagem);
			s.setAttribute("blogcontrole", BlogControle);
			s.setAttribute("postagem", postagem);
			request.getRequestDispatcher("imagemupload.jsp").forward(request,response);

			//out.println(postagem.getImagem());
			
		}else{
			BlogController BlogControle = (BlogController) s.getAttribute("blogcontrole");
			Postagem postagem = new Postagem();
			if(BlogControle==null){
				postagem.setId(0);
			}else{
			postagem.setId(BlogControle.getPostagens().size());
			}
			postagem.setTitulo(request.getParameter("titulo"));
			postagem.setSubtitulo(request.getParameter("subtitulo"));
			postagem.setCategoria(request.getParameter("categoria"));
			postagem.setConteudo(request.getParameter("conteudo"));
			//postagem.setImagem("/Imagens/"+request.getParameter("imagem"));
			if(BlogControle!=null){
			BlogControle.getPostagens().add(postagem);
			s.setAttribute("blogcontrole", BlogControle);
			s.setAttribute("postagem", postagem);
			request.getRequestDispatcher("imagemupload.jsp").forward(request,response);
			}else {
				s.invalidate();
				s = request.getSession();
				BlogControle = new BlogController();
				BlogControle.getPostagens().add(postagem);
				s.setAttribute("blogcontrole", BlogControle);
				s.setAttribute("postagem", postagem);
				request.getRequestDispatcher("imagemupload.jsp").forward(request,response);
				
			}
		}
	}
	
	protected void editPost(HttpServletRequest request, HttpServletResponse response, Integer id)
			throws ServletException, IOException {
		HttpSession sessao = request.getSession();
		BlogController BlogControle = (BlogController) sessao.getAttribute("blogcontrole");
		if (BlogControle.getPostagens() == null) {
			response.sendRedirect("blog");
		} else {

			ArrayList<Postagem> psList = (ArrayList<Postagem>) BlogControle.getPostagens();

			String titulo = request.getParameter("titulo");
			String subtitulo = request.getParameter("subtitulo");
			String categoria = request.getParameter("categoria");
			String texto = request.getParameter("conteudo");
			// String image = request.getParameter("imagem");

			Postagem ps = psList.get(id);
			ps.setTitulo(titulo);
			ps.setSubtitulo(subtitulo);
			ps.setCategoria(categoria);
			ps.setConteudo(texto);

			response.sendRedirect("editar.jsp?id=" + id + "&mensagem=sucesso");
		}
	}

}
