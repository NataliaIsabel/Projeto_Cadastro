<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form action="<%= application.getContextPath() %>/InsereProduto" method="post">
		<label>Nome do Produto:</label>
		<input type="text" name="nome" id="nome">
		<br>
		
		<label>Categoria:</label>
		<select name="categoria" id="categoria">
			<option value="1">Notebook</option>
			<option value="2">Desktop</option>
			<option value="3">Periféricos</option>
			<option value="4">Componentes</option>
		</select>
		<br>
		
		<label>Preço:</label>
		<input type="text" name="preco" id="preco">
		<br>
		
		<label>Quantidade:</label>
		<input type="number" name="quantidade" id="quantidade">
		<br>
		
		<button type="submit">Enviar</button>
	</form>
</body>
</html>