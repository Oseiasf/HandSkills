
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Listar produtos</title>

</head>
<body>
	<c:import url="/view/comum/menu.jsp" />
	<!-- Modal -->
	<div class="modal fade" id="verMais" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Login</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="exampleInputLogin">Login</label> <input type="text"
								class="form-control" id="exampleInputLogin"
								aria-describedby="loginHelp" placeholder="Entre com seu email">
							<small id="loginHelp" class="form-text text-muted">Para
								acessar, use o e-mail cadastrado.</small>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Senha</label> <input
								type="password" class="form-control" id="exampleInputPassword1"
								placeholder="Senha">
						</div>
						<center>
							<button type="submit" class="btn btn-primary">Entrar</button>
						</center>
					</form>
				</div>
			</div>
		</div>
	</div>


	 
	<div>${mensagem}</div>

	<div class="row text-center">
		<c:forEach var="p" items="${listaProduto}">
			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card">
					<img class="img-circle" src="view/img${p.imagem}">
					<div class="card-body">
						<h4 class="card-title">${p.nomeProduto}</h4>
						<ul>
							<li>Local de origem:${p.localOrigemProduto}</li>
							<li>Cores disponíveis: ${p.coresDisponiveis}</li>
							<li>É feito de: ${p.materialDoProduto}</li>
							<li>${p.quantidadeDisponivel} produtos disponíveis</li>
							<li class="card-text">Valor: ${p.precoVenda}</li>
						</ul>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-info">Comprar</a>
						<a href="exibirAtualizarProduto?id=${p.id}" class="btn btn-info">Alterar</a>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<footer class="py-5 bg-info">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2018</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="./resources/vendor/jquery/jquery.min.js"></script>
	<script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>



</body>
</html>