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

<!-- Custom styles for this template -->
<link href="./resources/css/heroic-features.css" rel="stylesheet">
<link href="./resources/css/style.css" rel="stylesheet">
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<link href="./resources/css/styleform.css" rel="stylesheet">
<link href="./resources/css/style.css" rel="stylesheet">

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
				<input type="text" name="nomeProduto" maxlength="50" placeholder="Buscar por nome"/>
				<br><br>
				<span class="icon-case">
					<i class="fa fa-search"></i>
				</span>
				<input type="text" name="localOrigemProduto" maxlength="50" placeholder="Buscar por localidade" />
			</div>
 			<div class="input-group-btn">
 				<button type="submit" class="btn btn-secondary alinhamento-botao-buscar cor-botao" type="button">Buscar</button>
 			</div>
		</form>
    </div>
  </div>
</div>
<!--  Modal Buscar Material -->
<div class="modal fade modalBuscarMateriais" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
     	<form action="pesquisarMaterial" method="post">
     		<h5 class="alinhamento-encontre">Encontre Materiais</h5>
     		<br>
 			<div class="form-group">
				<span class="icon-case">
					<i class="fa fa-search"></i>
				</span>
				<input type="text" name="descricao" maxlength="50" placeholder="Buscar por nome do material"/>
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
		<a class="navbar-brand" href="index" style="font-style: italic" >Handskills</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<c:if test="${usuarioLogado == null}">
					<li class="nav-item">
						<a class="nav-link" href="login" >Login</a>
					</li>
				</c:if>
				<c:if test="${usuarioLogado.tipoUsuario == 'CLIENTE' }">
					<li class="nav-item">
						<div class="dropdown">
							<a class="nav-link" href="" id="dropdownProdutoCliente" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									Produtos
							</a>
							<div class="dropdown-menu" aria-labelledby="dropdownProdutoCliente">
								<a class="dropdown-item" href="listarProduto">Listar Produtos</a>
								<a class="dropdown-item" href="exibirCarrinho">Carrinho</a>
							</div>
						</div>
					</li>
				</c:if>
				<c:if test="${usuarioLogado.tipoUsuario == 'ARTESAO' }">
					<li class="nav-item">
						<div class="dropdown">
							<a class="nav-link" href="" id="dropdownProdutoArtesao" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								Produtos
							</a>
							<div class="dropdown-menu" aria-labelledby="dropdownProdutoArtesao">
								<a class="dropdown-item" href="exibirCadastrarProduto">Cadastro Produto</a>
								<a class="dropdown-item" href="listarProduto">Listar Produtos</a>
								<a class="dropdown-item" href="exibirListaCompras">Minhas compras</a>
								<a class="dropdown-item" href="exibirCarrinho">Carrinho</a>
							</div>
						</div>
					</li>
				</c:if>
				<c:if test="${usuarioLogado.tipoUsuario == 'ADM' }">
					<li class="nav-item">
						<div class="dropdown">
							<a class="nav-link" href="" id="dropdownProdutoADM" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								Produtos
							</a>
							<div class="dropdown-menu" aria-labelledby="dropdownProdutoADM">
								<a class="dropdown-item" href="exibirCadastrarProduto">Cadastro Produto</a>
								<a class="dropdown-item" href="listarProduto">Listar Produtos</a>
								<a class="dropdown-item" href="exibirListaCompras">Minhas compras</a>
								<a class="dropdown-item" href="exibirCarrinho">Carrinho</a>
							</div>
						</div>
					</li>
				</c:if>
				<c:if test="${usuarioLogado.tipoUsuario == 'ADM' }">
					<li class="nav-item">
						<div class="dropdown">
							<a class="nav-link" href="" id="dropdownMaterialADM" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								Material
							</a>
							<div class="dropdown-menu" aria-labelledby="dropdownMaterialADM">
								<a class="dropdown-item" href="listarMaterial">Listar Materiais</a>
								<a class="dropdown-item" href="exibirCadastrarMaterial">Cadastro de Material</a>
							</div>
						</div>
					</li>
				</c:if>	
				<li class="nav-item">
					<div class="dropdown">
						<a class="nav-link" href="" id="dropdowPesquisa" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							Encontre
						</a>
						<div class="dropdown-menu" aria-labelledby="dropdowPesquisa">
							<c:if test="${usuarioLogado.tipoUsuario == 'ADM' }">
								<a class="dropdown-item" href="" data-toggle="modal" data-target=".modalBuscarPessoas">Usuários</a>
								<a class="dropdown-item" href="" data-toggle="modal" data-target=".modalBuscarMateriais">Material</a>
							</c:if>
							<a class="dropdown-item" href="" data-toggle="modal" data-target=".modalBuscarProdutos">Produtos</a>
						</div>
					</div>
				</li>
				<c:if test="${usuarioLogado != null && usuarioLogado.tipoUsuario == 'ARTESAO'}">
					<li class="nav-item">
						<div class="dropdown">
							<a class="nav-link" href="" id="dropdownArtesao" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								Bem vindo, Artesão
							</a>
							<div class="dropdown-menu" aria-labelledby="dropdownArtesao">
								<a class="dropdown-item" href="exibirAtualizarUsuario?id=${usuarioLogado.id}">Alterar dados</a>
								<a class="dropdown-item" href="meusProdutos">Meus Produtos</a>
								<a class="dropdown-item" href="logout">Sair</a>
				
							</div>
						</div>
					</li>
				</c:if>
				<c:if test="${usuarioLogado != null && usuarioLogado.tipoUsuario == 'ADM'}">
					<li class="nav-item">
						<div class="dropdown">
							<a class="nav-link" href="" id="dropdownADM" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								Bem vindo, Administrador
							</a>
							<div class="dropdown-menu" aria-labelledby="dropdownADM">
								<a class="dropdown-item" href="exibirAtualizarUsuario?id=${usuarioLogado.id}">Alterar dados</a>
								<a class="dropdown-item" href="meusProdutos">Meus Produtos</a>
								<a class="dropdown-item" href="exibirCadastrarUsuario">Cadastrar Usuario</a>
								<a class="dropdown-item" href="listarUsuarios">Listar Usuarios</a>
								<a class="dropdown-item" href="logout">Sair</a>
							</div>
						</div>
					</li>
				</c:if>
				<c:if test="${usuarioLogado != null && usuarioLogado.tipoUsuario == 'CLIENTE'}">
					<li class="nav-item">
						<div class="dropdown">
							<a class="nav-link" href="" id="dropdownCliente" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								Bem vindo, Cliente
							</a>
							<div class="dropdown-menu" aria-labelledby="dropdownCliente">
								<a class="dropdown-item" href="exibirAtualizarUsuario?id=${usuarioLogado.id}">Alterar dados</a>
								<a class="dropdown-item" href="exibirListaCompras">Minhas compras</a>
								<a class="dropdown-item" href="logout">Sair</a>
							</div>
						</div>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
</nav>
<script src="./resources/js/index.js"></script>
