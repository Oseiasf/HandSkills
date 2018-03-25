<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="iso-8859">
		<title>Itens Vendidos</title>
		
		<script type="text/javascript">
		
			function preencherModal(nomeProduto, localOrigemProduto, materialDoProduto, nomeUsuario, precoVenda, dataVenda) {
				
				document.getElementById('nomeProduto').innerHTML = nomeProduto;
				document.getElementById('localOrigemProduto').innerHTML = localOrigemProduto;
				document.getElementById('materialDoProduto').innerHTML = materialDoProduto;
				document.getElementById('nomeUsuario').innerHTML = nomeUsuario;
				document.getElementById('precoVenda').innerHTML = precoVenda;
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
											<li>Feito por: <label id="nomeUsuario"></label></li>
											<li>Material: <label id="materialDoProduto"></label></li>
											<li class="card-text">Valor: <label id="precoVenda"></label></li>
											<li>Comprado em: <label id="dataVenda"></label></li>
										</ul>
										<div class="card-footer">
										</div>
									</form>
							</div>
						</div>
					</div>
				</div>
			<br><br>
			<!-- Page Features -->
			<div class="row text-center">
				<c:forEach var="c" items="${listaVendas}">
					<div class="col-lg-3 col-md-6 mb-4">
						<div class="card">
							<img class="card-img-top" src="view/img/${c.produto.imagem}" alt="">
							<div class="card-body">
								<h4 class="card-title">${c.produto.nomeProduto}</h4>
							</div>
							<div class="card-footer">
								<br><a href="#" onclick="preencherModal('${c.produto.nomeProduto}','${c.produto.localOrigemProduto}', '${c.produto.materialDoProduto.descricao}', '${c.venda.usuario.nomeCompleto}', '${c.venda.valorTotal}', '${c.venda.dataVenda}' );" data-toggle="modal" data-target="#verMais" class="btn btn-info">Mais Informações</a>
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