<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cadastrar usuário</title>
<!-- Bootstrap core CSS -->
<link href="./resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="./resources/css/heroic-features.css" rel="stylesheet">
<link href="./resources/css/style.css" rel="stylesheet">

</head>
<body>
	<c:import url="/view/comum/menu.jsp" />
	
	

		<center>
			<div>${mensagem}</div>
		</center>
		
		<h3 class="col-5 offset-5 cor-fonte">Dados Cadastrais</h3>
		<br>
		<form action="CadastrarUsuario" method="post">
		<div class="col-4 offset-4">
		<label class="cor-fonte">Nome Completo</label><input type="text" name="nomeCompleto" class="style-form" maxlength="50">
		<br><br>
		<label class="cor-fonte">CPF</label><input type="text" name="cpf" class="style-form" maxlength="15"> 
		<br> 
		<label class="cor-fonte">RG</label><input type="text" name="rg" class="style-form" maxlength="15">
		<br> <br>
		<label class="cor-fonte">Sexo</label>
		<select name="sexo" class="form-control style-form ">
			<option value="Masculino">Masculino</option>
			<option value="Feminino">Feminino</option>
		</select>
		
		<br> <br>
		<label class="cor-fonte">Endereço</label>
		<input type="text" name="endereco" class="style-form" maxlength="100">
		<br><br>
		<label class="cor-fonte">Estado</label> 
		<select name="estado" class="form-control style-form">
			<option value="Pernambuco">Pernambuco</option>
		</select>
		<br><br>
		
		<label class="cor-fonte">Cidade</label> 
		<select name="cidade" class="form-control style-form">
			<option value="Recife">Recife</option>
		</select>
		<br> <br>
		
		<label class="cor-fonte">Bairro</label><input type="text" name="bairro" class="style-form" maxlength="100"> 
		<br>
		<label class="cor-fonte">CEP</label><input type="text" name="cep" class="style-form" maxlength="20">
		<br> 
		<br>
		<label class="cor-fonte">Telefone</label><input type="text" name="telefone" class="style-form" maxlength="30">
		<br>
		<label class="cor-fonte">Whatsapp</label><input type="text" name="whatsapp" class="style-form" maxlength="30">
		<br> 
		<label class="cor-fonte">Email</label>
		<input type="email" name="email" class="style-form" maxlength="50">
		<br>
		 <label class="cor-fonte">Senha</label><input type="password" name="senha" class="style-form" maxlength="200">
		 <br> 
			<label class="cor-fonte"><br>Nesse site, você vai querer</label> 
			<select name="tipoUsuario" class="form-control style-form"><br>
			<option value="Artesão">Comprar</option>
			<option value="Cliente">Vender</option>
			<br>
		</select> <br> <br> <br> <input type="submit" value="Cadastrar" class="btn btn-info  col-4 offset-4">
		<br>
		</div>
	</form>
	<br>
	<br>
	
	<footer class="py-5 bg-info">
	<div class="container">
		<p class="m-0 text-center text-white">Copyright &copy; Your
			Website 2018</p>
	</div>
	<!-- /.container --> </footer>

	<!-- Bootstrap core JavaScript -->
	<script src="./resources/vendor/jquery/jquery.min.js"></script>
	<script src="./resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>