
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
<meta charset="iso-8859">
<title>Pesquisando Produto </title>
		<script type="text/javascript">
		
			function preencherModal(nomeProduto, localOrigemProduto, materialDoProduto, quantidadeDisponivel, precoVenda, usuarioArtesao, idProduto) {
				
				document.getElementById('nomeProduto').innerHTML = nomeProduto;
				document.getElementById('localOrigemProduto').innerHTML = localOrigemProduto;
				document.getElementById('materialDoProduto').innerHTML = materialDoProduto;
				document.getElementById('quantidadeDisponivel').innerHTML = quantidadeDisponivel;
				document.getElementById('precoVenda').innerHTML = precoVenda;
				document.getElementById('usuarioArtesao').innerHTML = usuarioArtesao;
				var complemento = "' class='btn btn-info' role='button'>Adicionar Ao Carrinho</a> &nbsp;"
				document.getElementById('idProduto').innerHTML = "<a href='exibirAdicionarCarrinho?id="+idProduto+complemento;

				
			}
		
		</script>
	</head>
	<body>
		<!-- Modal Ver informa��es-->
			<div class="modal fade" id="verMais" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLongTitle">Mais Informa��es</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							</div>
							<div class="modal-body">
								<h4 class="card-title"><label id="nomeProduto"></label></h4>
									<form action="efetuarPedido" method="post">
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
													Gostou? Quer levar para casa? Fa�a um <a href="exibirCadastrarUsuario">cadastro</a> ou, se j� possuir uma conta, basta apenas <a href="login">logar</a>
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
		<h1>${mensagem}</h1>
		<!-- Page Content -->
		<div class="container">
			
			<br><br>
			<!-- Page Features -->
			<div class="row text-center">
				<c:forEach var="p" items="${pesquisa}">
					<div class="col-lg-3 col-md-6 mb-4">
						<div class="card">
							<img class="card-img-top" src="view/img/${p.imagem}" alt="">
							<div class="card-body">
								<h4 class="card-title">${p.nomeProduto}</h4>
							</div>
							<div class="card-footer">
								<c:if test="${usuarioLogado.tipoUsuario == 'ADM'}"><a href="exibirAtualizarProduto?id=${p.id}" class="btn btn-info">Alterar</a></c:if>
								<br><a href="#" onclick="preencherModal('${p.nomeProduto}','${p.localOrigemProduto}', '${p.materialDoProduto.descricao}', '${p.quantidadeDisponivel}', '${p.precoVenda}','${p.usuarioArtesao.nomeCompleto}', '${p.id}' );
								" data-toggle="modal" data-target="#verMais" class="btn btn-info">Mais Informa��es</a>
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