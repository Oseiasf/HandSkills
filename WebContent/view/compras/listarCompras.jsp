<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="iso-8859">
		<title>Itens Comprados</title>
		
		<script type="text/javascript">
		
			function preencherModal(nomeProduto, localOrigemProduto, materialDoProduto, quantidadeDisponivel, precoVenda, usuarioArtesao, idProduto, dataVenda) {
				
				document.getElementById('nomeProduto').innerHTML = nomeProduto;
				document.getElementById('localOrigemProduto').innerHTML = localOrigemProduto;
				document.getElementById('materialDoProduto').innerHTML = materialDoProduto;
				document.getElementById('quantidadeDisponivel').innerHTML = quantidadeDisponivel;
				document.getElementById('precoVenda').innerHTML = precoVenda;
				document.getElementById('usuarioArtesao').innerHTML = usuarioArtesao;
				var complemento = "' class='btn btn-info' role='button'>Atualizar</a>"
					document.getElementById('idProduto').innerHTML = "<a href='exibirAtualizarProduto?id="+idProduto+complemento;
				var complemento2 = "' class='btn btn-info' role='button'>Remover</a>"
					document.getElementById('idProdutoRemover').innerHTML = "<a href='removerProduto?id="+idProduto+complemento2;
				document.getElementById('dataVenda').innerHTML = dataVenda;
			}
		
		</script>
	</head>
	<body>
		<!-- Navigation -->
		<c:import url="/view/comum/menu.jsp" />
		<h1>${mensagem}</h1>
		<!-- Page Content -->
		<div class="container">
			<!-- Modal Ver informações-->
			<div class="modal fade" id="verMais" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLongTitle">Mais Informações</h5>
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
											<li>Comprado em: <label id="dataVenda"></label></li>
											<li class="card-text">Valor: <label id="precoVenda"></label></li>
										</ul>
										<div class="card-footer">
											<center>
												<button type="submit" class="btn btn-info">Comprar</button>
												<a id="idProdutoRemover">Remover</a>
												<a id="idProduto">Atualizar</a>
											</center>
										</div>
									</form>
							</div>
						</div>
					</div>
				</div>
			<br><br>
			<!-- Page Features -->
			<div class="row text-center">
				<c:forEach var="c" items="${listaItensCompra}">
					<div class="col-lg-3 col-md-6 mb-4">
						<div class="card">
							<img class="card-img-top" src="view/img/${c.imagem}" alt="">
							<div class="card-body">
								<h4 class="card-title">${c.nomeProduto}</h4>
							</div>
							<div class="card-footer">
								<a href="#" class="btn btn-info">Comprar</a>
								<c:if test="${usuarioLogado.tipoUsuario == 'ADM'}"><a href="exibirAtualizarProduto?id=${c.id}" class="btn btn-info">Alterar</a></c:if>
								<br><a href="#" onclick="preencherModal('${c.nomeProduto}','${c.localOrigemProduto}', '${c.materialDoProduto.descricao}', '${c.quantidadeDisponivel}', '${c.precoVenda}','${c.usuarioArtesao.nomeCompleto}', '${c.id}', '${c.dataVenda}' );" data-toggle="modal" data-target="#verMais" class="btn btn-info">Mais Informações</a>
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