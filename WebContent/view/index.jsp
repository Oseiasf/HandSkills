<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>

	<head>
	
	<meta charset="iso-8859">
	<title>Página inicial</title>
	</head>

<body>

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
						<img class="card-img-top" src="view/img/${p.imagem}" alt="">
						<div class="card-body">
							<h4 class="card-title">${p.nomeProduto}</h4>
							<p class="card-text">R$:${p.precoVenda}</p>
							
						</div>
						<div class="card-footer">
							<a href="#" class="btn btn-info">Comprar</a>
						</div>
					</div>
				</div>
			</c:forEach>
			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card">
					<img class="card-img-top" src="./resources/img/img2.jpg" alt="">
					<div class="card-body">
						<h4 class="card-title">Jarro de capim dourado</h4>
						<p class="card-text">R$15,99</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-info">Comprar</a>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card">
					<img class="card-img-top" src="./resources/img/img3.jpg" alt="">
					<div class="card-body">
						<h4 class="card-title">Vazo decorado com tecido</h4>
						<p class="card-text">R$9,99</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-info">Comprar</a>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-6 mb-4">
				<div class="card">
					<img class="card-img-top" src="./resources/img/img4.jpg" alt="">
					<div class="card-body">
						<h4 class="card-title">Boneca de Pernambuco com lantejoulas</h4>
						<p class="card-text">R$9,99</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-info">Comprar</a>
					</div>
				</div>
			</div>

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->
<c:import url="/view/comum/rodape.jsp" />

</body>

</html>