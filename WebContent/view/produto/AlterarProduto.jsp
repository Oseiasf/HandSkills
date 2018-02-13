<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<title>Alterar produto</title>
</head>
<body>
	<c:import url="/view/comum/menu.jsp" />
	
	
	
	<form action="alterarProduto" method="post">

		
		<input type="hidden" name="id" value="${p.id}">
		
		<p>
		Nome do produto: <br />
		<input type="text" name="nomeProduto" value="${p.nomeProduto}" maxlength="50">
		</p>
		<p>
		Local de Origem do Produto: <br>
		<input type="text" name="localOrigemProduto" value="${p.localOrigemProduto}" maxlength="50">
		</p>
		<p>
		Cor disponivel: <br>
		<input type="text" name="coresDisponiveis" value="${p.coresDisponiveis}" maxlength="50" >
		</p>
		<p>
		Material feito: <br>
		<input type="text" name="materialDoProduto" value="${p.materialDoProduto}" maxlength="60">
		</p>
		<p>
		Preço de venda: <br>
		<input type="text" name="precoVenda" value="${p.precoVenda}" maxlength="50">
		</p>
		<p>
		Quantidade disponivel: <br>
		<input type="text" name="quantidadeDisponivel" value="${p.quantidadeDisponivel}" maxlength="20">
		</p>
		<p> 
			<input type="submit" class="btn btn-primary" value="Atualizar">
		</p>
	</form>

</body>
</html>