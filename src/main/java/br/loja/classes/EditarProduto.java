package br.loja.classes;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class EditarProduto
 */
@WebServlet("/EditarProduto")
public class EditarProduto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditarProduto() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt( request.getParameter("id") );

		@SuppressWarnings("unchecked")
		List<Produto> banco = (List<Produto>) getServletContext().getAttribute("banco");
		if (banco == null) {
		    response.sendRedirect("paginas/listagem.jsp");
		    return;
		}
		
		Produto produtoEncontrado = null;
		
		for(Produto p : banco) {
			if(p.getId() == id) {
				produtoEncontrado = p;
				break;
			}
		}
		
		request.setAttribute("produto", produtoEncontrado);
			
		RequestDispatcher rd = request
				.getRequestDispatcher("paginas/formEditar.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		String nome = request.getParameter("nome");
		int categoria = Integer.parseInt(request.getParameter("categoria"));
		float preco = Float.parseFloat(request.getParameter("preco"));
		int quantidade = Integer.parseInt(request.getParameter("quantidade"));
		
		@SuppressWarnings("unchecked")
		List<Produto> bancoProdutos = 
				(List<Produto>) getServletContext().getAttribute("banco");
		
		if (bancoProdutos == null) {
		    response.sendRedirect("paginas/listagem.jsp");
		    return;
		}
		
		for(Produto p : bancoProdutos) {
			if(p.getId() == id) {
				p.setNome(nome);
				p.setCategoria(categoria);
				p.setPreco(preco);
				p.setQuantidade(quantidade);
				break;
			}
		}
		
		getServletContext().setAttribute("banco", bancoProdutos);
		response.sendRedirect(request.getContextPath() + "/paginas/listagem.jsp");
		
	}

}
