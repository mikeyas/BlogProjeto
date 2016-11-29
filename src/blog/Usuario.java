package blog;


public class Usuario {
	
	private String nome = "Everson Teixeira";
	private String login = "admin";
	private String senha = "admin";
	private String email = "falaeverson@gmail.com";
	private String tel = "(00) 00000-0000";
	private String tipo = "admin";
	private Boolean logado = false;
	
	/*
	 * Gets and Sets 
	 */
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public Boolean getLogado() {
		return logado;
	}
	public void setLogado(Boolean logado) {
		this.logado = logado;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	
	/*
	 * toString
	 */
	@Override
	public String toString() {
		return "Usuario [nome=" + nome + ", login=" + login + ", senha=" + senha + ", email=" + email + ", tel=" + tel
				+ ", tipo=" + tipo + ", logado=" + logado + "]";
	}

}
