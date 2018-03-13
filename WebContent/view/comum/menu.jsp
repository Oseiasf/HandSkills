<%@ page language="java" contentType="text/html; charset=iso-8859-1"
	pageEncoding="iso-8859-1"%>
	
<!-- Bootstrap core CSS -->
<link href="./resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- jquery -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<!-- bootstrap -->
<script type="text/javascript" src="js/bootstrap.js"></script>
<!-- chamada da função -->

<c:if test="${usuarioLogado == null }">
	<script type="text/javascript">
	$(window).load(function() {
	    $('#modalLogin').modal('show');
	});
	</script>
</c:if>

<!-- Custom styles for this template -->
<link href="./resources/css/heroic-features.css" rel="stylesheet">
<link href="./resources/css/style.css" rel="stylesheet">
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<link href="./resources/css/styleform.css" rel="stylesheet">
<link href="./resources/css/style.css" rel="stylesheet">

<!-- Modal login -->
<div class="modal fade" id="modalLogin" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header cor-barralogin">
				<h5 class="modal-title cor-login" id="exampleModalLongTitle">Login</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
			<div style="color: red;" align="center"> <h6 class="mensagem-erro"> ${msg} </h6> </div>
				<form action="efetuarLogin" method="post">
					<div class="form-group">
						<p>
							Login<span>*</span>
						</p>
						<span class="icon-case"><i class="fa fa-user"></i></span> <input type="text" name="email" maxlength="80" placeholder="Entre com o email cadastrado no sistema." required/>
					</div>
					<div class="form-group">
						<p>
							Senha<span>*</span>
						</p>
						<span class="icon-case">
							<i class="fa fa-user"></i>
						</span>
						<input type="password" name="senha" maxlength="50" placeholder="Digite sua senha" required/>
					</div>
					<button type="submit" class="col-4 offset-4 btn btn-info">Entrar</button> <br><br>
					<span class="col-4 offset-4"><a href="exibirCadastrarUsuario" class="cor-cadastre cadastre-login">Cadastre-se</a></span>
				</form>
			</div>
		</div>
	</div>
</div>

<!--  Modal Buscar Produto -->
<div class="modal fade modalBuscarProdutos" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
     	<form action="pesquisarProduto" method="post">
     		<h5 class="alinhamento-encontre">Encontre Produtos</h5>
     		<br>
 			<div class="form-group">
						
						<span class="icon-case">
							<i class="fa fa-search"></i>
						</span>
						<input type="text" name="buscar" maxlength="50" placeholder="Buscar" required/>
					</div>
 			<div class="input-group-btn">
 				<button type="submit" class="btn btn-secondary alinhamento-botao-buscar cor-botao" type="button">Buscar</button>
 			</div>
		</form>
    </div>
  </div>
</div>
<!-- Buscar Usuarios -->
<div class="modal fade modalBuscarPessoas" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
     	<form action="pesquisarUsuario" method="post">
     		<h5 class="alinhamento-encontre ">Encontre Usuários</h5>
     		<br>
 			<div class="form-group">
				<span class="icon-case">
					<i class="fa fa-search"></i>
				</span>
				<input type="text" name="nomeCompleto" maxlength="50" placeholder="Buscar Por Nome" />
			</div>
 			<div class="input-group-btn">
 				<button type="submit" class="btn btn-secondary alinhamento-botao-buscar cor-botao" type="button">Buscar</button>
 			</div>
		</form>
    </div>
  </div>
</div>
<br>
<nav class="navbar navbar-expand-lg navbar-dark bg-info fixed-top">
	<div class="container">
		<a class="navbar-brand" href="index">Handskills</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<c:if test="${usuarioLogado.tipoUsuario == 'CLIENTE' }">
					<li class="nav-item">
						<a class="nav-link" href="listarProduto">Listar Produtos</a>
					</li>
					<li>
						<a class="nav-link" href="exibirCarrinho">Carrinho</a>
					</li>
				</c:if>
				
				<c:if test="${usuarioLogado.tipoUsuario == 'ARTESAO' }">
					<li class="nav-item">
						<a class="nav-link" href="listarProduto">Listar Produtos</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="meusProdutos">Meus Produtos</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="exibirCadastrarProduto">Cadastro Produto</a>
					</li>
					<li>
						<a class="nav-link" href="exibirCarrinho">Carrinho</a>
					</li>
				</c:if>
				
				<c:if test="${usuarioLogado.tipoUsuario == 'ADM' }">
					<li class="nav-item">
						<a class="nav-link" href="exibirCadastrarProduto">Cadastro Produto</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="exibirCadastrarMaterial">Cadastro de Material</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="exibirCadastrarUsuario">Cadastrar Usuario</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="listarUsuarios">Listar Usuarios</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="listarMaterial">Listar Materiais</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="listarProduto">Listar Produtos</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="meusProdutos">Meus Produtos</a>
					</li>
					<li>
						<a class="nav-link" href="exibirCarrinho">Carrinho</a>
					</li>
				</c:if>     	
				
				
				<c:if test="${usuarioLogado == null}">
					<li class="nav-item">
						<a class="nav-link" href="#" data-toggle="modal" data-target="#modalLogin">Login</a>
					</li>
				</c:if>
				
				<li>
					<div class="dropdown">
						<a class="nav-link" href="" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							Encontre
						</a>
						<div class="dropdown-menu" aria-labelledby="dropdownMenu2">
							<c:if test="${usuarioLogado.tipoUsuario == 'ADM' }"><a class="dropdown-item" href="" data-toggle="modal" data-target=".modalBuscarPessoas">Usuários</a></c:if>
							<a class="dropdown-item" href="" data-toggle="modal" data-target=".modalBuscarProdutos">Produtos</a>
						</div>
					</div>
				</li>
				
				<c:if test="${usuarioLogado != null}">
					<li class="nav-item">
						<a class="nav-link">Bem vindo, ${usuarioLogado.nomeCompleto}</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="logout">Sair</a>
					</li>
				</c:if>
				
			</ul>
		</div>
	</div>
</nav>
<script src="./resources/js/index.js"></script>
