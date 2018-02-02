
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
				<!-- Modal -->
		<div class="modal fade" id="verMais" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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
	
		
		<%-- <c:import url="/view/comum/menu.jsp" /> --%>
		<div>${mensagem}</div>
			
			
		<c:forEach var="p" items="${listaProduto}">
			<div class="row text-center">
				<div class="card" style="width: 18rem;">
					<c:choose>
						<c:when test="${not empty p.imagem}">
							<img class="card-img-top"  src="view/img/${p.imagem}" alt="Card image cap">
						</c:when>
						<c:otherwise>
							A imagem não foi carregada.
						</c:otherwise>
					</c:choose>
				<div class="card-body">
					<h5 class="card-title">${p.nomeProduto}</h5>
					
						<ul>
							<li>Local de origem:${p.localOrigemProduto}</li>
							<li>Cores disponíveis: ${p.coresDisponiveis}</li>
							<li>É feito de: ${p.materialFeito}</li>
							<li>${p.quantidadeDisponivel} disponíveis</li>
							<li class="card-text">Valor: ${p.precoVenda}</li>
						</ul>
					<a href="#" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">Comprar</a>
				</div>
			</div>
			</div>
		</c:forEach>
			

	</body>
</html>