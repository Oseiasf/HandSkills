
<!-- Bootstrap core CSS -->
<link href="./resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="./resources/css/heroic-features.css" rel="stylesheet">
<link href="./resources/css/style.css" rel="stylesheet">
<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<link href="./resources/css/styleform.css" rel="stylesheet">
<link href="./resources/css/style.css" rel="stylesheet">



<!-- Modal login -->
<div class="modal fade" id="modalLogin" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header cor-barralogin">
				<h5 class="modal-title cor-login" id="exampleModalLongTitle">Login</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form>
					<div class="form-group">
						<p>
							Login<span>*</span>
						</p>
						<span class="icon-case"><i class="fa fa-user"></i></span> <input
							type="text" name="email" maxlength="80" placeholder="Entre com o email cadastrado no sistema."/>

					</div>
					<div class="form-group">
						<p>
							Senha<span>*</span>
						</p>
						<span class="icon-case"><i class="fa fa-user"></i></span> <input
							type="text" name="senha" maxlength="50" />

					</div>
					<button type="submit" class="col-4 offset-4 btn btn-info">Entrar</button>
				</form>
			</div>
		</div>
	</div>
</div>
<br>
<br>
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
				<li class="nav-item active"><a class="nav-link"
					href="/handskills">Home <span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#modalLogin">Login</a></li>
				<!-- <li class="nav-item"><a class="nav-link" href="#"
						data-toggle="modal" data-target="#exampleModalCenter">Cadastro</a>
					</li> -->
				<li class="nav-item"><a class="nav-link"
					href="exibirCadastrarProduto">Cadastrar Produtos</a></li>
				<li class="nav-item"><a class="nav-link" href="listarProduto">Listar
						Produtos</a></li>
				<li class="nav-item"><a class="nav-link"
					href="exibirCadastrarUsuario">Cadastrar Usuario</a></li>
					<li class="nav-item"><a class="nav-link"
					href="pesquisarUsuario">Encontre Pessoas</a></li>
			</ul>
		</div>
	</div>
	<div class="col-lg-2">
		<div class="input-group">
			<form action="pesquisar" method="post">
			<input type="text" class="form-control" placeholder="Buscar" name="nomeProduto">
			</form>
			<span class="input-group-btn">
				<button type="submit" class="btn btn-secondary" type="button">Buscar</button>
			</span>
		</div>
	</div>
</nav>

<script src="./resources/js/index.js"></script>