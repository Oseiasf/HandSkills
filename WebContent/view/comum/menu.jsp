
<!-- Bootstrap core CSS -->
<link href="./resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="./resources/css/heroic-features.css" rel="stylesheet">
<link href="./resources/css/style.css" rel="stylesheet">


	<!-- Modal login -->
	<div class="modal fade" id="modalLogin" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
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
						<button type="submit" class="col-4 offset-4 btn btn-primary">Entrar</button>
					</form>
				</div>
			</div>
		</div>
	</div>
<br><br>
<nav class="navbar navbar-expand-lg navbar-dark bg-info fixed-top">
		<div class="container">
			<a class="navbar-brand" href="/handskills">Handskills</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link" href="/handskills">Home
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#"
						data-toggle="modal" data-target="#modalLogin">Login</a></li>
					<!-- <li class="nav-item"><a class="nav-link" href="#"
						data-toggle="modal" data-target="#exampleModalCenter">Cadastro</a>
					</li> -->
					<li class="nav-item"><a class="nav-link" href="exibirCadastrarProduto">Cadastrar Produtos</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="listarProduto">Listar Produtos</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="exibirCadastrarUsuario">Cadastrar Usuario</a>
					</li>
				</ul>
			</div>
		</div>
		<div class="col-lg-2">
			<div class="input-group">
				<input type="text" class="form-control" placeholder="Buscar">
				<span class="input-group-btn">
					<button class="btn btn-secondary" type="button">Buscar</button>
				</span>
			</div>
		</div>
	</nav>