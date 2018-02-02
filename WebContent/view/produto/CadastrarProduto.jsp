<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="./resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="./resources/css/style.css" rel="stylesheet">
<title>Cadastrar Produtos</title>
</head>
<body>
		<c:import url="/view/comum/menu.jsp" />
	<h3 class=" cor-fonte  col-5 offset-5">Incluir Produto</h3>
	<br>
	<br>
	<center>
		<div>${mensagem}</div>
	</center>
	<form action="CadastrarProduto" method="post" enctype="multipart/form-data">
		<div class="col-4 offset-4">
			<p class="cor-fonte">
				Nome do produto:<input type="text" name="nomeProduto" class="style-form" />
			</p>
			<p class="cor-fonte">
				Local de Origem do Produto: <input type="text"
					name="localOrigemProduto" class="style-form">
			</p>
			<p class="cor-fonte">
				Cor disponivel: <input type="text" name="coresDisponiveis" class="style-form">
			</p>
			<p class="cor-fonte">
				Material do produto : <input type="text" name="materialDoProduto" class="style-form">
			</p>
			<p class="cor-fonte">
				Preço de venda: <input type="text" name="precoVenda" class="style-form">
			</p>
			<p class="cor-fonte">
				Quantidade disponivel: <input type="text" name="quantidadeDisponivel" class="style-form">
			</p>
			<p class="cor-fonte">
				Imagem: <input type="file" name="file" class="style-form">
			</p>
			<p>
				<input type="submit" value="Inserir"
					class=" btn btn-info  col-4 offset-4">
			</p>
		</div>
	</form>
	<footer class="py-5 bg-info">
	<div class="container">
		<p class="m-0 text-center text-white">Copyright &copy; Your
			Website 2018</p>
	</div>
	<!-- /.container --> </footer>

	<!-- Bootstrap core JavaScript -->
	<script src="./resources/vendor/jquery/jquery.min.js"></script>
	<script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>