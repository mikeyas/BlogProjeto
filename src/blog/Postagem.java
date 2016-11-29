package blog;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.imageio.ImageIO;

public class Postagem implements Comparable<Postagem>{

	private String titulo;
	private String subtitulo;
	private String conteudo;
	private String categoria;
	private Date data = new Date();
	private List<Comentario> comentarios;
	private String imagem;
	private int ordenaTipo; 
	   
	  public int getOrdenaTipo() { 
	    return ordenaTipo; 
	  } 
	 
	  public void setOrdenaTipo(int ordenaTipo) { 
	    this.ordenaTipo = ordenaTipo; 
	  } 

	
	public String getImagem() {
		return imagem;
	}

	public void setImagem(String imagem) {
		this.imagem = imagem;
	}

	public Postagem(){
		comentarios = new ArrayList<Comentario>();
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getSubtitulo() {
		return subtitulo;
	}

	public void setSubtitulo(String subtitulo) {
		this.subtitulo = subtitulo;
	}

	public String getConteudo() {
		return conteudo;
	}

	public void setConteudo(String conteudo) {
		this.conteudo = conteudo;
	}

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public Date getData() {
		return data;
	}

	public List<Comentario> getComentarios() {
		return comentarios;
	}

	 @Override 
	  public int compareTo(Postagem o) { 
	     
	    switch(this.getOrdenaTipo()){ 
	     
	    case 1: 
	      return this.getTitulo().compareToIgnoreCase(o.getTitulo()); 
	       
	     
	    case 2: 
	      return this.getSubtitulo().compareToIgnoreCase(o.getSubtitulo()); 
	       
	       
	    case 3: 
	      return this.getCategoria().compareToIgnoreCase(o.getCategoria()); 
	       
	     
	    case 4: 
	      return this.getData().toString().compareToIgnoreCase(o.getData().toString()); 
	       
	     
	    default: 
	      return this.getData().toString().compareToIgnoreCase(o.getData().toString()); 
	       
	    } 
	  } 
	
}
