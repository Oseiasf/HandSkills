<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Cadastrar usuårio</title>
<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<link href="./resources/css/styleform.css" rel="stylesheet">
<link href="./resources/css/style.css" rel="stylesheet">


</head>

<body>
<body>
	<c:import url="/view/comum/menu.jsp" />
	<form action="CadastrarUsuario" method="post">
		<h1 class="cor-cadastrar">Cadastrar usuårio</h1>

		<div class="contentform">



			<div class="leftcontact">
				<div class="form-group">
					<p>
						Nome completo<span>*</span>
					</p>
					<span class="icon-case"><i class="fa fa-user"></i></span> <input
						type="text" name="nomeCompleto" maxlength="50" />

				</div>



				<div class="form-group">
					<p>
						CPF <span>*</span>
					</p>
					<span class="icon-case"><i class="fa fa-credit-card"></i></span> <input
						type="text" name="cpf" maxlength="15" />

				</div>

				<div class="form-group">
					<p>
						RG <span>*</span>
					</p>
					<span class="icon-case"><i class="fa fa-keyboard-o"></i></span> <input
						type="text" name="rg 
						" maxlength="15" />

				</div>

				<div class="form-group">
					<p>
						Email <span>*</span>
					</p>
					<span class="icon-case"><i class="fa fa-envelope-o"></i></span> <input
						type="email" name="email" id="email" data-rule="email"
						data-msg="Vérifiez votre saisie sur les champs : Le champ 'E-mail' est obligatoire. "
						maxlength="50" />
					<div class="validation"></div>


				</div>

				<div class="form-group">
					<p>
						Senha <span>*</span>
					</p>
					<span class="icon-case"><i class="fa fa-building-o"></i></span> <input
						type="text" name="senha 
						" maxlength="200" />

				</div>

				<div class="form-group">
					<p>
						Endereço <span>*</span>
					</p>
					<span class="icon-case"><i class="fa fa-map-marker"></i></span> <input
						type="text" name="endereco 
						" maxlength="100" />

				</div>

				<div class="form-group">
					<p>
						Bairro <span>*</span>
					</p>
					<span class="icon-case"><i class="fa fa-map-marker"></i></span> <input
						type="text" name="bairro 
						" maxlength="100" />

				</div>

			</div>

			<div class="rightcontact">

				<div class="form-group">
					<p>
						Cidade <span>*</span>
					</p>
					<span class="icon-case"><i class="fa fa-map-marker"></i></span> <input
						type="text" name="cidade" maxlength="100" />

				</div>



				<div class="form-group">
					<p>
						Estado <span>*</span>
					</p>
					<span class="icon-case"><i class="fa fa-map-marker"></i></span> <select
						class="form-control" id="style-select">
						<option value="estado">Pernambuco</option>
						<option value="estado">Rio de Janeiro</option>
					</select>

				</div>

				<div class="form-group">
					<p>
						CEP <span>*</span>
					</p>
					<span class="icon-case"><i class="fa fa-map-marker"></i></span> <input
						type="text" name="cep" maxlength="20" />

				</div>

				<div class="form-group">
					<p>
						Sexo <span>*</span>
					</p>
					<span class="icon-case"><i class="fa fa-circle-o"></i></span> <select
						class="form-control" id="style-select">
						<option value="sexo">Feminino</option>
						<option value="sexo">Masculino</option>
					</select>

				</div>

				<div class="form-group">
					<p>
						Tipo de usuårio<span>*</span>
					</p>
					<span class="icon-case"><i class="fa fa-group"></i></span> <select
						class="form-control" id="style-select">
						<option value="tipoUsuario">Artesão</option>
						<option value="tipoUsuario">ADM</option>
						<option value="tipoUsuario">Cliente</option>
					</select>



				</div>

				<div class="form-group">
					<p>
						Telefone <span>*</span>
					</p>
					<span class="icon-case"><i class="fa fa-phone"></i></span> <input
						type="text" name="telefone" maxlength="30" />

				</div>

				<div class="form-group">
					<p>
						Whatsapp <span>*</span>
					</p>
					<span class="icon-case"><i class="fa fa-phone"></i></span> <input
						type="text" name="whatsapp" maxlength="30" />

				</div>

			</div>
		</div>
		<button type="submit" class="bouton-contact btn-info">Cadastrar</button>

	</form>

	<script src="./resources/js/index.js"></script>

	<footer class="py-5 bg-info">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
				Website 2018</p>
		</div>
		<!-- /.container -->
	</footer>

</body>
</html>







</body>

</html>
