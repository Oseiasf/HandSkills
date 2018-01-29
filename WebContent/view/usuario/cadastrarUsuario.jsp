<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<!-- Bootstrap core CSS -->
		<link href="./resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

		<!-- Custom styles for this template -->
		<link href="./resources/css/heroic-features.css" rel="stylesheet">
		<link href="./resources/css/style.css" rel="stylesheet">
		
	</head>
	<body>
		<form action="CadastrarUsuario" method="post">

				<center><div>${mensagem}</div></center>
		 		<h1>Dados Cadastrais</h1>
		 		<label>Nome Completo</label><input type="text" name="nomeCompleto">
		 		<label>CPF</label><input type="text" name="cpf">
		 		<label>RG</label><input type="text" name="rg">
		 		<label>Sexo</label>
		 		<select name="sexo">
		 			<option value="Masculino">Masculino</option>
		 			<option value="Feminino">Feminino</option>
		 		</select><br><br>
		 		<label>Endereço</label><input type="text" name="endereco">
		 		<label>Estado</label>
		 		<select name="estado">
		 			<option value="Pernambuco">Pernambuco</option>
		 		</select>
		 		<label>Cidade</label>
		 		<select name="cidade">
		 			<option value="Recife">Recife</option>
		 		</select>
		 		<label>Bairro</label><input type="text" name="bairro">
		 		<label>CEP</label><input type="text" name="cep"><br><br>
		 		<label>Telefone</label><input type="text" name="telefone">
		 		<label>Whatapp</label><input type="text" name="whatapp">
		 		<label>Email</label><input type="email" name="email">
		 		<label>Senha</label><input type="password" name="senha"><br>
		 		<label>Nesse site, você vai querer</label>
		 		<select name="tipoUsuario">
		 			<option value="Artesão">Comprar</option>
		 			<option value="Cliente">Vender</option>
		 		</select>
				<br><br><br>
				<input type="submit" value="Cadastrar">
		 	
		</form>
	</body>
</html>