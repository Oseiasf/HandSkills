<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Cadastrar usu�rio</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="description" content="">
		<meta name="author" content="">
	</head>
	<body>
		<!-- Navigation -->
		<c:import url="/view/comum/menu.jsp" />
		<form action="CadastrarUsuario" method="post">
			<h1 class="cor-cadastrar">Cadastrar usu�rio</h1>
			<div class="contentform">
				<div class="leftcontact">
					<div class="form-group">
						<p>Nome completo<span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-user"></i>
						</span>
						<input type="text" name="nomeCompleto" maxlength="50" required />
					</div>
					<div class="form-group">
						<p>CPF <span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-credit-card"></i>
						</span>
						<input type="text" name="cpf" maxlength="15" required/>
					</div>
					<div class="form-group">
						<p>RG <span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-keyboard-o"></i>
						</span>
						<input type="text" name="rg" maxlength="15" required/>
					</div>
					<div class="form-group">
						<p>Email <span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-envelope-o"></i>
						</span>
						<input type="email" name="email" id="email" data-rule="email" 
						data-msg="V�rifiez votre saisie sur les champs : Le champ 'E-mail' est obligatoire. " 
						maxlength="50" required/>
						<div class="validation"></div>
					</div>
					<div class="form-group">
						<p> Senha <span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-building-o"></i>
						</span> <input type="password" name="senha" maxlength="200" required/>
					</div>
					<div class="form-group">
						<p>Endere�o <span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-map-marker"></i></span>
							<input type="text" name="endereco" maxlength="100" required/>
					</div>
					<div class="form-group">
						<p>Bairro <span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-map-marker"></i>
						</span>
						<input type="text" name="bairro" maxlength="100" required/>
					</div>
				</div>
					<div class="rightcontact">
						<div class="form-group">
							<p>Cidade <span>*</span></p>
								<span class="icon-case">
									<i class="fa fa-map-marker"></i>
								</span>
								<input type="text" name="cidade" maxlength="100" required/>
						</div>
						<div class="form-group">
							<p>Estado <span>*</span></p>
							<span class="icon-case">
								<i class="fa fa-map-marker"></i>
							</span>
							<select class="form-control" class="style-select" name="estado" required>
								<option value="PE">Pernambuco</option>
								<option value="RJ">Rio de Janeiro</option>
							</select>
					</div>
					<div class="form-group">
						<p>CEP <span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-map-marker"></i>
						</span> <input type="text" name="cep" maxlength="20" required/>
					</div>
					<div class="form-group">
						<p>Sexo <span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-circle-o"></i>
						</span>
						<select class="form-control" class="style-select" name="sexo" required>
							<option value="">Selecione seu sexo</option>
							<option value="Feminino">Feminino</option>
							<option value="Masculino">Masculino</option>
						</select>
					</div>
					<div class="form-group">
						<p>Tipo de usu�rio<span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-group"></i>
						</span>
						<select class="form-control" id="style-select" name="tipoUsuario" required>
							<option value="">Selecione um tipo</option>
							<option value="Artes�o">Artes�o</option>
							<option value="ADM">ADM</option>
							<option value="Cliente">Cliente</option>
						</select>
					</div>
					<div class="form-group">
						<p>Telefone <span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-phone"></i>
						</span>
						<input type="text" name="telefone" maxlength="30" required/>
					</div>
					<div class="form-group">
						<p>Whatsapp <span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-phone"></i>
						</span>
						<input type="text" name="whatsapp" maxlength="30" required />
					</div>
				</div>
			</div>
			<button type="submit" class="bouton-contact btn-info">Cadastrar</button>
		</form>
		<footer class="py-5 bg-info">
			<div class="container">
				<p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>

			</div>
			<!-- /.container -->
		</footer>
	</body>
</html>
