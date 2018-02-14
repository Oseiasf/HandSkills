<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Cadastrar Produtos</title>
<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<link href="./resources/css/styleform.css" rel="stylesheet">
<link href="./resources/css/style.css" rel="stylesheet">


</head>

<body>
<body>
	<c:import url="/view/comum/menu.jsp" />
	<form action="CadastrarProduto" method="post">
		<h1 class="cor-cadastrar">Cadastrar produto</h1>

		<div class="contentform">



			<div class="leftcontact">
				<div class="form-group">
					<p>
						Nome do produto<span>*</span>
					</p>
					<span class="icon-case"><i class="fa fa-align-left"></i></span> <input
						type="text" name="nomeProduto" maxlength="50" />

				</div>



				<div class="form-group">
					<p>
						Local de origem do produto <span>*</span>
					</p>
					<span class="icon-case"><i class="fa fa-fighter-jet"></i></span> 
					<select class="form-control" id="style-select">
						<option value="localOrigemProduto">Pernambuco</option>
						<option value="localOrigemProduto">Rio de Janeiro</option>
					</select>

				</div>

				<div class="form-group">
					<p>
						Cores disponíveis <span>*</span>
					</p>
					<span class="icon-case"><i class="fa fa-circle-o"></i></span> <input
						type="text" name="coresDisponiveis 
						" maxlength="20" />

				</div>







			</div>

			<div class="rightcontact">

				<div class="form-group">
					<p>
						Material do produto <span>*</span>
					</p>
					<span class="icon-case"><i class="fa fa-wrench"></i></span> <input
						type="text" name="materialDoProduto" maxlength="30" />

				</div>



				<div class="form-group">
					<p>
						Preço de venda <span>*</span>
					</p>
					<span class="icon-case"><i class="fa fa-dollar"></i></span> <input
						type="text" name="precoVenda" maxlength="20" />

				</div>

				<div class="form-group">
					<p>
						Quantidade disponível <span>*</span>
					</p>
					<span class="icon-case"><i class="fa fa-bar-chart-o"></i></span> <input
						type="text" name="quantidadeDisponivel" maxlength="10" />

				</div>


			</div>
		</div>
		<button type="submit" class="bouton-contact btn-info">Cadastrar</button>

	</form>

	<script src="./resources/js/index.js"></script>

	<footer class="py-5 bg-info">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2018</p>
		</div>
		<!-- /.container -->
	</footer>

</body>
</html>







</body>

</html>
