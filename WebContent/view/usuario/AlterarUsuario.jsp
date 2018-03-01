<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="iso-8859">
<title>Alterar usuário</title>
</head>

<body>
			<!-- Navigation -->
		<c:import url="/view/comum/menu.jsp" />
	<form action="alterarUsuario" method="post">
		<h1 class="cor-cadastrar">Alterar usuário</h1>
	<input type="hidden" name="id" value="${u.id}">
		<div class="contentform">



			<div class="leftcontact">
				<div class="form-group">
					<p>
						Nome completo<span>*</span>
					</p>
					<span class="icon-case"><i class="fa fa-user"></i></span> <input
						type="text" name="nomeCompleto" maxlength="50"  value="${u.nomeCompleto }"/>

				</div>



				<div class="form-group">
					<p>
						CPF <span>*</span>
					</p>
					<span class="icon-case"><i class="fa fa-credit-card"></i></span> <input
						type="text" name="cpf" maxlength="15" value="${u.cpf}" placeholder="ex: 999.999.999-99" class="cpf"/>

				</div>

				<div class="form-group">
					<p>
						RG <span>*</span>
					</p>
					<span class="icon-case"><i class="fa fa-keyboard-o"></i></span> <input
						type="text" name="rg" maxlength="15" value="${u.rg }" placeholder="ex: 9.999.999" class="rg"/>

				</div>

				<div class="form-group">
					<p>
						Email <span>*</span>
					</p>
					<span class="icon-case"><i class="fa fa-envelope-o"></i></span> <input
						type="email" name="email" id="email" data-rule="email"
						data-msg="Vérifiez votre saisie sur les champs : Le champ 'E-mail' est obligatoire. "
						maxlength="50" value="${u.email }"/>
					<div class="validation"></div>


				</div>

				<div class="form-group">
					<p>
						Senha <span>*</span>
					</p>
					<span class="icon-case"><i class="fa fa-building-o"></i></span> <input
						type="password" name="senha" maxlength="200" value="${u.senha }"/>

				</div>

				<div class="form-group">
					<p>
						Endereço <span>*</span>
					</p>
					<span class="icon-case"><i class="fa fa-map-marker"></i></span> <input
						type="text" name="endereco" maxlength="100" value="${u.endereco }"/>

				</div>

				<div class="form-group">
					<p>
						Bairro <span>*</span>
					</p>
					<span class="icon-case"><i class="fa fa-map-marker"></i></span> <input
						type="text" name="bairro" maxlength="100" value="${u.bairro}" />

				</div>

			</div>

			<div class="rightcontact">

				<div class="form-group">
					<p>
						Cidade <span>*</span>
					</p>
					<span class="icon-case"><i class="fa fa-map-marker"></i></span> <input
						type="text" name="cidade" maxlength="100" value="${u.cidade}"/>

				</div>



				<div class="form-group">
					<p>
						Estado <span>*</span>
					</p>
					<span class="icon-case"><i class="fa fa-map-marker"></i></span> <select
						class="form-control" id="style-select" name="estado">
						<option value="${u.estado}">${u.estado}</option>
						<option value="RJ">RJ</option>
						<option value="SP">SP</option>
					</select>

				</div>

				<div class="form-group">
					<p>
						CEP <span>*</span>
					</p>
					<span class="icon-case"><i class="fa fa-map-marker"></i></span> <input
						type="text" name="cep" maxlength="20" value="${u.cep}" class="cep" placeholder="ex: 99999-999"/>

				</div>

				<div class="form-group">
					<p>
						Sexo <span>*</span>
					</p>
					<span class="icon-case"><i class="fa fa-circle-o"></i></span> <select
						class="form-control" id="style-select" name="sexo">
						<option value="${u.sexo}">${u.sexo}</option>
						<option value="Feminino">Feminino</option>
						<option value="Masculino">Masculino</option>
					</select>

				</div>

				<div class="form-group">
					<p>
						Tipo de usuário<span>*</span>
					</p>
					<span class="icon-case"><i class="fa fa-group"></i></span> <select
						class="form-control" id="style-select" name="tipoUsuario">
						<option value="${u.tipoUsuario}">${u.tipoUsuario}</option>
						<option value="Artesão">Artesão</option>
						<option value="ADM">ADM</option>
						<option value="Cliente">Cliente</option>
					</select>



				</div>

				<div class="form-group">
					<p>
						Telefone <span>*</span>
					</p>
					<span class="icon-case"><i class="fa fa-phone"></i></span> <input
						type="text" name="telefone" maxlength="30" value="${u.telefone}" class="telefone"  placeholder="ex: (99)99999-9999" />

				</div>

				<div class="form-group">
					<p>
						WhatsApp <span>*</span>
					</p>
					<span class="icon-case"><i class="fa fa-phone"></i></span> <input
						type="text" name="whatsapp" maxlength="30" value="${u.whatsapp}" class="whatsapp" placeholder="ex: (99)99999-9999"/>

				</div>

			</div>
		</div>
		<button type="submit" class="bouton-contact btn-info">Salvar alterações</button>

	</form>

	<script src="./resources/js/index.js"></script>
	<c:import url="/view/comum/rodape.jsp" />
	
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>
	<script type="text/javascript" src="./resources/js/mascaras.js"></script>
	

</body>
</html>