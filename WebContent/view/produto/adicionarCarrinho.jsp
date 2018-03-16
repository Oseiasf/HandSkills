<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Carrinho</title>

<link rel="stylesheet" type="text/css" href="view/css/estilo.css" />
<link rel="stylesheet" type="text/css" href="view/bootstrap/css/bootstrap.min.css" />
  
<script type="text/javascript" src="view/js/jquery-2.1.4.js"></script>
<script type="text/javascript" src="view/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="view/js/maskedinput.js"></script>

</head>

<body id="corpoPadrao">

	<c:import url="/view/comum/menu.jsp" />

	<div align="center">
	
		<div align="left" style="color: #6E6E6E; width: 70%; margin-top: 4%;">

			<c:if test="${msg ne null}">
				<div class="alert alert-error" style="width: 70%;">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					${msg}
				</div>
			</c:if>

			<hr />
			
			<p>
				<table style="width: 100%">
					<tr>
						<td style="float: left; font-size: 24px;">Adicionar Produto ao <strong>Carrinho</strong> </td>
						<td style="float: right; text-align: right;"> <img src="view/img/editar.jpg" style="width: 20%;">  </td>
					</tr>
				</table>
			</p>
			
			<hr />
			
			<form action="adicionarAoCarrinho" method="post">
			
				<input type="hidden" name="id" value="${p.id}">
				
  				<div class="form-group">
					<label class="nomes">Nome Produto:</label>
					<br>
					<input value="${p.nomeProduto}" readonly>  
				</div>
  				
  				<div class="form-group">
					<label class="nomes">Material Principal:</label>
					<br>
					<input value="${p.materialDoProduto.descricao} " readonly>
				</div>
				
				<div class="form-group">
					<label class="nomes">Valor:</label>
					<br>
					 <input value="${p.precoVenda}" readonly>
				</div>
				
				<div class="form-group">
					<label for="inputQuantidade" class="nomes">Quantidade</label>
					<br>
					<input type="text" id="inputQuantidade" class="form-control" name="quantidade" style="width: 75%;" required="required" />
				</div>
				
				<br />
				
  				<div class="alinhar-botoes">
  				<a href="listarProduto" class="btn btn-danger" role="button">Cancelar</a> &nbsp;
  				<button type="reset" class="btn btn-default"> &nbsp; Limpar &nbsp; </button> &nbsp;
  				<button type="submit" class="btn btn-info"> &nbsp; Adicionar &nbsp; </button>
  				</div>
			</form>
		</div>
			
	</div>
	
	<br />
	
	<hr class="linhaSeparador">
	
	<div class="textoRodape">
		<p><c:import url="/view/comum/rodape.jsp" /></p>
	</div>

</body>
</html>
