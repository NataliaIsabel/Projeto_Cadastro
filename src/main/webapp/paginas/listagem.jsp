<%@ page language="java" contentType="text/html; charset=UTF-8"
    	 pageEncoding="UTF-8"%>
    	 
<%@ page import="java.util.List, java.util.ArrayList, br.loja.classes.Produto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<p>
	<a href="<%= application.getContextPath() %>/cadastro.jsp">+ Produto</a>
	</p>
	<%
		List<Produto> produtos = 
			(List<Produto>) application.getAttribute("banco");
	%>
	
	<% if (produtos == null || produtos.size() == 0) { %>
		<strong>Nenhum produto cadastrado.</strong>
	<% }
	   else { %>
	<table>
		<tr>
			<th>ID</th>
			<th>Nome</th>
			<th>Categoria</th>
			<th>Preço</th>
			<th>Quantidade</th>
			<th colspan="2">Ações</th>
		</tr>
		<% 
			int somaQtd = 0;
			for (Produto p : produtos) { 
				somaQtd += p.getQuantidade();
		%>
	
			<tr>
				<td><%= p.getId() %></td>
				<td><%= p.getNome() %></td>
				<td><%= p.getCategoria() %></td>
				<td><%= p.getPreco() %></td>
				<td><%= p.getQuantidade() %></td>
				<td><a href="<%= application.getContextPath() %>/EditarProduto?id=<%= p.getId() %>">Editar</a></td>
				<td><a href="<%= application.getContextPath() %>/RemoveProduto?id=<%= p.getId() %>">Remover</a></td>
			</tr>
		<% } %>
	</table>
	<p>Total de Produtos: <%= somaQtd %></p>
	<% } %>  
	
		
</body>
</html>