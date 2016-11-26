package blog;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Servlet2
 */
public class Servlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession s = request.getSession();
		Integer id = Integer.parseInt(request.getParameter("id"));
		Comentario coment = new Comentario();
		coment.setUsuario(request.getParameter("usuario"));
		coment.setEmail(request.getParameter("email"));
		coment.setFone(request.getParameter("fone"));
		coment.setConteudo(request.getParameter("conteudo"));
		
		BlogController BlogControle = (BlogController) s.getAttribute("blogcontrole");
		for(Postagem post:BlogControle.getPostagens()){
			if(post.hashCode()==id){
				post.getComentarios().add(coment);
			}
			
		}
		s.setAttribute("blogcontrole", BlogControle);
		request.getRequestDispatcher("noticia.jsp").forward(request,response);
	}
}
