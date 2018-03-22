<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Listagem de Carrinho</title>

<link rel="stylesheet" type="text/css" href="view/css/estilo.css" />
<link rel="stylesheet" type="text/css"
	href="view/bootstrap/css/bootstrap.min.css" />

<script type="text/javascript" src="view/js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="view/bootstrap/js/bootstrap.min.js"></script>

</head>

<body id="corpoPadrao">

	<c:import url="/view/comum/menu.jsp" />

	<div align="center">

		<div align="left" style="color: #6E6E6E; width: 70%;">

			<p>
			<table style="width: 100%">
				<tr>
					<td style="float: left; font-size: 24px;">Produtos Adicionados
						ao <strong>Carrinho</strong>
					</td>
				</tr>
			</table>
			</p>

			<hr />
			<h1>${carrinho}</h1>
			<table class="table table-striped table-bordered">
				<thead>
					<tr>
						<th
							style="width: 25%; vertical-align: middle; text-align: center;">Produto</th>
						<th
							style="width: 25%; vertical-align: middle; text-align: center;">Valor
							Unitário</th>
						<th style="width: 25%; vertical-align: middle;">Quantidade</th>
						<th
							style="width: 25%; vertical-align: middle; text-align: center;">Valor
							Total</th>
						<th
							style="width: 25%; vertical-align: middle; text-align: center;">Excluir</th>
					</tr>
				</thead>
				<c:forEach items="${listaCarrinho}" var="item">
					<tr>
						<td style="vertical-align: middle; text-align: center;">${item.produto.nomeProduto}</td>
						<td style="vertical-align: middle; text-align: center;">${item.produto.precoVenda}</td>
						<td style="vertical-align: middle; text-align: center;">${item.quantidade}</td>
						<td style="vertical-align: middle; text-align: center;">${item.produto.precoVenda * item.quantidade}</td>
						<td style="vertical-align: middle; text-align: center;"><a
							href="removerItemCarrinho">X</a></td>
					</tr>
				</c:forEach>
			</table>

			Valor Parcial da Venda: ${valorTotal}

			<p>
				<a href="concluirVenda" class="btn btn-info" role="button">Concluir
					Venda</a> &nbsp;
			</p>

			<c:if test="${listaProduto.size() == 0}">
				Não foram encontrados registros.
			</c:if>
		</div>

	</div>

	<br />

	<hr class="linhaSeparador">

	<div class="textoRodape">
		<script src="./resources/vendor/jquery/jquery.min.js"></script>
		<script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="./resources/js/index.js"></script>

		<footer class="py-5 bg-info"
			style="position: absolute; width: 100%; bottom: 0;">
			<div class="container">
				<p class="m-0 text-center text-white">Copyright &copy;
					HandSkills 2018</p>
			</div>
		</footer>
	</div>

</body>
</html>