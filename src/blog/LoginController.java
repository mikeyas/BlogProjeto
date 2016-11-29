package blog;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jdk.nashorn.internal.ir.BreakableNode;
import blog.Usuario;

/**
 * Servlet implementation class Login
 */
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private Usuario user = new Usuario();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		RequestDispatcher view = request.getRequestDispatcher("login.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		

		
		if(!user.getSenha().equals(request.getParameter("senha"))) {
			response.sendRedirect("login?pass=error");
		}else if(!user.getLogin().equals(request.getParameter("login"))) {
			response.sendRedirect("login?user=error");
		}else if (user.getLogin().equals(request.getParameter("login"))
				&& user.getSenha().equals(request.getParameter("senha"))) {
			
			HttpSession sessao = request.getSession();  
			user.setLogado(true);
			sessao.setAttribute("admin", user);
			response.sendRedirect("blog");
		}else{
			response.sendRedirect("login?erros=erros");
		}
	}

}
