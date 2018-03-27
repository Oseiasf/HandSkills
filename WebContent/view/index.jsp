<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="iso-8859">
<title>Página inicial</title>
<script type="text/javascript">
	function preencherModal(nomeProduto, localOrigemProduto, materialDoProduto,
			quantidadeDisponivel, precoVenda, usuarioArtesao, idProduto) {

		document.getElementById('nomeProduto').innerHTML = nomeProduto;
		document.getElementById('localOrigemProduto').innerHTML = localOrigemProduto;
		document.getElementById('materialDoProduto').innerHTML = materialDoProduto;
		document.getElementById('quantidadeDisponivel').innerHTML = quantidadeDisponivel;
		document.getElementById('precoVenda').innerHTML = precoVenda;
		document.getElementById('usuarioArtesao').innerHTML = usuarioArtesao;
		var complemento = "' class='btn btn-info' role='button'>Adicionar Ao Carrinho</a> &nbsp;"
		document.getElementById('idProduto').innerHTML = "<a href='exibirAdicionarCarrinho?id="
				+ idProduto + complemento;

	}
</script>
<link rel="stylesheet" type="text/css" href="./resources/css/style.css" />
</head>
<body>
	<!-- Modal Ver informações-->
	<div class="modal fade" id="verMais" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">

		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Mais
						Informações</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<h4 class="card-title">
						<label id="nomeProduto"></label>
					</h4>
					<form action="efetuarCompra" method="post">
						<ul>
							<li>Feito em: <label id="localOrigemProduto"></label></li>
							<li>Feito por: <label id="usuarioArtesao"></label></li>
							<li>Estoque: <label id="quantidadeDisponivel"></label></li>
							<li>Material: <label id="materialDoProduto"></label></li>
							<li class="card-text">Valor: <label id="precoVenda"></label></li>
						</ul>
						<div class="card-footer">
							<center>
								<c:if test="${usuarioLogado == null }">
													Gostou? Quer levar para casa? Faça um <a
										href="exibirCadastrarUsuario">cadastro</a> ou, se já possuir uma conta, basta apenas <a
										href="login">logar</a>
								</c:if>
								<c:if test="${usuarioLogado != null }">
									<button type="submit" class="btn btn-info">Comprar</button>
									<span id="idProduto"></span>
								</c:if>
							</center>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Navigation -->
	<c:import url="/view/comum/menu.jsp" />
	<!-- Page Content -->
	<div class="container">
		<div id="carouselExampleIndicators"
			class="carousel slide meu-carrosel" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active imagem-item">
					<img class="d-block w-100" src="./resources/img/img5.jpg"
						alt="First slide">
				</div>
				<div class="carousel-item imagem-item">
					<img class="d-block w-100" src="./resources/img/img6.jpg"
						alt="Second slide">
				</div>
				<div class="carousel-item imagem-item">
					<img class="d-block w-100" src="./resources/img/img7.jpg"
						alt="Third slide">
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
		<!-- Page Features -->
		<div class="row text-center">
			<c:forEach var="p" items="${listaProduto}">
				<div class="col-lg-3 col-md-6 mb-4">
					<div class="card">
						<div style="height: 100%; width: 100%">
							<img class="card-img-top padrao-imagem-index"
								src="view/img/${p.imagem}" alt="">
						</div>
						<div class="card-body">
							<h4 class="card-title">${p.nomeProduto}</h4>
							<p class="card-text">R$:${p.precoVenda}</p>
						</div>
						<div class="card-footer">
							<br> <a href="#"
								onclick="preencherModal('${p.nomeProduto}','${p.localOrigemProduto}', '${p.materialDoProduto.descricao}', '${p.quantidadeDisponivel}', '${p.precoVenda}','${p.usuarioArtesao.nomeCompleto}', '${p.id}' );
								"
								data-toggle="modal" data-target="#verMais" class="btn btn-info">Mais
								Informações</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container -->
	<c:import url="/view/comum/rodape.jsp" />
</body>
</html>