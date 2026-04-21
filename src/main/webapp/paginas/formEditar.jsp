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

	<%
		Produto p = (Produto) request.getAttribute("produto");
	%>
	

	<form action="<%= application.getContextPath() %>/EditarProduto" method="post">
        
        <!-- ID escondido -->
        <input type="hidden" name="id" value="<%= p.getId() %>">

        <label>Nome do Produto:</label>
        <input type="text" name="nome" value="<%= p.getNome() %>">
        <br><br>
        
        <label>Categoria:</label>
        <select name="categoria">
        <!-- Uso do tenario para deixar a seleção marcada anteriormente aparecendo "primeiro". Antes da alteração (Se tiver) -->
            <option value="1" <%= (p.getCategoria()==1 ? "selected" : "") %>>Notebook</option>
            <option value="2" <%= (p.getCategoria()==2 ? "selected" : "") %>>Desktop</option>
            <option value="3" <%= (p.getCategoria()==3 ? "selected" : "") %>>Periféricos</option>
            <option value="4" <%= (p.getCategoria()==4 ? "selected" : "") %>>Componentes</option>
        </select>
        <br><br>
        
        <label>Preço:</label>
        <input type="text" name="preco" value="<%= p.getPreco() %>">
        <br><br>
        
        <label>Quantidade:</label>
        <input type="number" name="quantidade" value="<%= p.getQuantidade() %>">
        <br><br>
        
        <button type="submit">Salvar Alterações</button>
    </form>

</body>
</html>