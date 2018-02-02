
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Listar produtos</title>

<!-- Bootstrap core CSS -->
<link href="./resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="./resources/css/heroic-features.css" rel="stylesheet">
<link href="./resources/css/style.css" rel="stylesheet">

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-info fixed-top">
		<div class="container">
			<a class="navbar-brand" href="/">Handskills</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link" href="">Home
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#"
						data-toggle="modal" data-target="#exampleModalCenter">Login</a></li>
					<li class="nav-item"><a class="nav-link" href="#"
						data-toggle="modal" data-target="#exampleModalCenter">Cadastro</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="listarProduto">Produtos</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
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


	<%-- <c:import url="/view/comum/menu.jsp" /> --%>
	<div>${mensagem}</div>

	<div class="row text-center">
		<c:forEach var="p" items="${listaProduto}">
			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card">
					<img class="card-img-top" src="${p.imagem}" alt="">
					<div class="card-body">
						<h4 class="card-title">${p.nomeProduto}</h4>
						<ul>
							<li>Local de origem:${p.localOrigemProduto}</li>
							<li>Cores disponíveis: ${p.coresDisponiveis}</li>
							<li>É feito de: ${p.materialDoProduto}</li>
							<li>${p.quantidadeDisponivel}disponíveis</li>
							<li class="card-text">Valor: ${p.precoVenda}</li>
						</ul>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-info">Comprar</a>
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