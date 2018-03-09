<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Cadastrar Usuario</title>
	</head>
<body>
		<c:import url="/view/comum/menu.jsp" />
		<h5 class="mensagem-sucesso">${mensagem}</h5>
		<form action="CadastrarUsuario" method="post">
			<h1 class="cor-cadastrar">Cadastrar usuário</h1>
			<div class="contentform">
				<div class="leftcontact">
					<div class="form-group">
						<p>Nome completo<span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-user"></i>
						</span>
						<input type="text" name="nomeCompleto" maxlength="50" required/>
					</div>
					<div class="form-group">
						<p>CPF <span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-credit-card"></i>
						</span>
						<input type="text" name="cpf" maxlength="15" required placeholder="ex: 999.999.999-99" class="cpf"/>
						<h7 class="mensagem-erro">${cpfExiste}</h7>
					</div>
					<div class="form-group">
						<p>RG <span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-keyboard-o"></i>
						</span>
						<input type="text" name="rg" maxlength="10" required class="rg" placeholder="ex: 9.999.999"/>
					</div>
					<div class="form-group">
						<p>Email <span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-envelope-o"></i>
						</span>
						<input type="email" name="email" id="email" data-rule="email" data-msg="Preencha seu email " 
						maxlength="50" required/>
						<br>
						<br>
						<h7 class="mensagem-erro">${emailExiste}</h7>
						<div class="validation"></div>
					</div>
					<div class="form-group">
						<p> Senha <span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-building-o"></i>
						</span> <input type="password" name="senha" maxlength="200" required/>
					</div>
					<div class="form-group">
						<p>Endereço <span>*</span></p>
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
							<select class="form-control style-select ajuste-icone" name="estado" required>
								<option value="PE">Pernambuco</option>
								<option value="RJ">Rio de Janeiro</option>
							</select>
					</div>
					<div class="form-group">
						<p>CEP <span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-map-marker"></i>
						</span> <input type="text" name="cep" maxlength="20" required class="cep" placeholder="ex: 99999-999"/>
					</div>
					<div class="form-group">
						<p>Sexo <span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-circle-o"></i>
						</span>
						<select class="form-control style-select ajuste-icone" name="sexo" required>
							<option value="">Selecione</option>
							<option value="Outros">Outros</option>
							<option value="Feminino">Feminino</option>
							<option value="Masculino">Masculino</option>
						</select>
					</div>
					<div class="form-group">
						<p>Tipo de Usuário<span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-group"></i>
						</span>
						<select class="form-control ajuste-icone" id="style-select" name="tipoUsuario" required>
							<option value="">Selecione</option>
							<c:if test="${usuarioLogado.tipoUsuario == 'ADM' }"><option value="ADM">Administrador</option></c:if>
							<option value="Artesão">Artesão</option>
							<option value="Cliente">Cliente</option>
						</select>
					</div>
					<div class="form-group">
						<p>Telefone <span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-phone"></i>
						</span>
						<input type="text" name="telefone" maxlength="25" required class="telefone" placeholder="ex: (99)99999-9999"/>
					</div>
					<div class="form-group">
						<p>WhatsApp <span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-phone"></i>
						</span>
						<input type="text" name="whatsapp" maxlength="25" required class="whatsapp" placeholder="ex: (99)99999-9999"/>
					</div>
				</div>
			</div>
			<button type="submit" class="bouton-contact btn-info">Cadastrar</button>
		</form>
		<c:import url="/view/comum/rodape.jsp" />
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>
	<script type="text/javascript" src="./resources/js/mascaras.js"></script>

</body>
</html>