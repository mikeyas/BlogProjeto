package blog;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


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

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//PrintWriter out = response.getWriter();
		HttpSession s = request.getSession();
				
		if(s.isNew()){
			
			Postagem postagem = new Postagem();
			postagem.setTitulo(request.getParameter("titulo"));
			postagem.setSubtitulo(request.getParameter("subtitulo"));
			postagem.setCategoria(request.getParameter("categoria"));
			postagem.setConteudo(request.getParameter("conteudo"));
			//postagem.setImagem("/Imagens/"+request.getParameter("imagem"));
			BlogController BlogControle = new BlogController();
			BlogControle.getPostagens().add(postagem);
			s.setAttribute("blogcontrole", BlogControle);
			request.getRequestDispatcher("blog.jsp").forward(request,response);

			//out.println(postagem.getImagem());
			
		}else{
			Postagem postagem = new Postagem();
			postagem.setTitulo(request.getParameter("titulo"));
			postagem.setSubtitulo(request.getParameter("subtitulo"));
			postagem.setCategoria(request.getParameter("categoria"));
			postagem.setConteudo(request.getParameter("conteudo"));
			//postagem.setImagem("/Imagens/"+request.getParameter("imagem"));
			BlogController BlogControle = (BlogController) s.getAttribute("blogcontrole");
			if(BlogControle!=null){
			BlogControle.getPostagens().add(postagem);
			s.setAttribute("blogcontrole", BlogControle);
			request.getRequestDispatcher("blog.jsp").forward(request,response);
			//out.println(postagem.getImagem());
			}else {
				s.invalidate();
				s = request.getSession();
				BlogControle = new BlogController();
				BlogControle.getPostagens().add(postagem);
				s.setAttribute("blogcontrole", BlogControle);
				request.getRequestDispatcher("blog.jsp").forward(request,response);
				//out.println(postagem.getImagem());

			}
		}
	}

}
