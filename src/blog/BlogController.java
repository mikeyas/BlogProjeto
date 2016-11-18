package blog;

import java.util.ArrayList;
import java.util.List;

public class BlogController {

	private String login = "admin";
	private String senha = "admin";
	private List<Postagem> postagens;
	
	public BlogController(){
		postagens = new ArrayList<Postagem>();
	}

	public String getLogin() {
		return login;
	}

	public String getSenha() {
		return senha;
	}

	public List<Postagem> getPostagens() {
		return postagens;
	}
	
	
}
