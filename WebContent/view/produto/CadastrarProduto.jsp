<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	</head>
	<body>
		<hr><h3>Incluir Produto</h3><hr>
		<center><div>${mensagem}</div></center>
		<form action="CadastrarProduto" method="post" enctype="multipart/form-data">
		<p>
		Nome do produto: <br />
		<input type="text" name="nomeProduto" />
		</p>
		<p>
		Local de Origem do Produto: <br>
		<input type="text" name="localOrigemProduto" >
		</p>
		<p>
		Cor disponivel: <br>
		<input type="text" name="coresDisponiveis" >
		</p>
		<p>
		Material feito: <br>
		<input type="text" name="materialFeito" >
		</p>
		<p>
		Preço de venda: <br>
		<input type="text" name="precoVenda" >
		</p>
		<p>
		Quantidade disponivel: <br>
		<input type="text" name="quantidadeDisponivel" >
		</p>
		<p>
		Imagem: <br>
		<input type="file" name="file" >
		</p>
		<p> <input type="submit" value="Inserir"> </p>
		</form>
	</body>
</html>