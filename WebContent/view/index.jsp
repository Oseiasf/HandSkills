<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>HandSkills</title>

<!-- Bootstrap core CSS -->
<link href="./resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="./resources/css/heroic-features.css" rel="stylesheet">
<link href="./resources/css/style.css" rel="stylesheet">

</head>

<body>
	

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Login</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
	  <div class="modal-body">
	  <form>
		  <div class="form-group">
		    <label for="exampleInputLogin">Login</label>
		    <input type="text" class="form-control" id="exampleInputLogin" aria-describedby="loginHelp" placeholder="Entre com seu email">
		    <small id="loginHelp" class="form-text text-muted">Para acessar, use o e-mail cadastrado.</small>
		  </div>
		  <div class="form-group">
		    <label for="exampleInputPassword1">Senha</label>
		    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Senha">
		  </div>
	  	  <center><button type="submit" class="btn btn-primary">Entrar</button></center>
	  </form>  
	  </div>
    </div>
  </div>
</div>
	
	<!-- Navigation -->
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
					<li class="nav-item"><a class="nav-link" href="#" data-toggle="modal" data-target="#exampleModalCenter">Login</a></li>
					<li class="nav-item"><a class="nav-link" href="#" data-toggle="modal" data-target="#exampleModalCenter">Cadastro</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="listarProduto">Produtos</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Page Content -->
	<div class="container">

		<!-- Jumbotron Header -->
		<!-- <header class="jumbotron my-4 imagem-pessoa text-white">
			<h1 class="display-3">Bem vindo ao Handskill!</h1>
			<p class="lead">Valorize o que é feito a mão.</p>
		</header> -->

		<div id="carouselExampleIndicators" class="carousel slide meu-carrosel"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active imagem-item">
					<img class="d-block w-100" src="./resources/img/img5.jpg" alt="First slide">
				</div>
				<div class="carousel-item imagem-item">
					<img class="d-block w-100" src="./resources/img/img6.jpg" alt="Second slide">
				</div>
				<div class="carousel-item imagem-item">
					<img class="d-block w-100" src="./resources/img/img7.jpg" alt="Third slide">
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

			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card">
					<img class="card-img-top" src="./resources/img/img1.jpg" alt="">
					<div class="card-body">
						<h4 class="card-title">Bonecas de barro.</h4>
						<p class="card-text">R$19,99.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-info">Comprar!</a>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card">
					<img class="card-img-top" src="./resources/img/img2.jpg" alt="">
					<div class="card-body">
						<h4 class="card-title">Jarro de capim dourado</h4>
						<p class="card-text">R$15,99.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-info">Comprar!</a>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card">
					<img class="card-img-top" src="./resources/img/img3.jpg" alt="">
					<div class="card-body">
						<h4 class="card-title">Vazo decorado com tecido</h4>
						<p class="card-text">R$9,99.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-info">Comprar!</a>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card">
					<img class="card-img-top" src="./resources/img/img4.jpg" alt="">
					<div class="card-body">
						<h4 class="card-title">Boneca de Pernambuco com lantejoulas</h4>
						<p class="card-text">R$9,99.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-info">Comprar!</a>
					</div>
				</div>
			</div>

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->

	<!-- Footer -->
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
