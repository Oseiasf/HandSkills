<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="pt">
	<head>
		<meta charset="iso-8859">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="description" content="">
		<meta name="author" content="">
		<title>Listar produto</title>
		<style>
		#corpo {
			background: #EEE9E9;
		}
		</style>
	</head>
	<body>
		<!-- Navigation -->
		<c:import url="/view/comum/menu.jsp" />
		<!-- Page Content -->
		<div class="container">
			<!-- Modal -->
			<div class="modal fade" id="verMais" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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
								<c:forEach var="p" items="${listaProduto}">
									<h4 class="card-title">${p.nomeProduto}</h4>
									<ul>
										<li>Feito em: ${p.localOrigemProduto}</li>
										<li>Estoque: ${p.quantidadeDisponivel}</li>
										<li class="card-text">Valor: R$ ${p.precoVenda}</li>
									</ul>
									<div class="card-footer">
										<center><a href="#" class="btn btn-info">Comprar</a></center>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			<br><br>
			<!-- Page Features -->
			<div class="row text-center">
				<c:forEach var="p" items="${listaProduto}">
					<div class="col-lg-3 col-md-6 mb-4">
						<div class="card">
							<img class="card-img-top" src="view/img/${p.imagem}" alt="">
							<div class="card-body">
								<h4 class="card-title">${p.nomeProduto}</h4>
							</div>
							<div class="card-footer">
								<a href="#" class="btn btn-info">Comprar</a> 
								<a href="exibirAtualizarProduto?id=${p.id}" class="btn btn-info">Alterar</a>
								<a href="" data-toggle="modal" data-target="#verMais" class="btn btn-info">Mais Informações</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
<c:import url="/view/comum/rodape.jsp" />
		<script src="./resources/vendor/jquery/jquery.min.js"></script>
		<script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	</body>
</html>