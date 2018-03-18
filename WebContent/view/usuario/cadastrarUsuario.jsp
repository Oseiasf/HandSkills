<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Cadastrar Usuario</title>
		    <!-- Adicionando Javascript -->
	    <script type="text/javascript" >
	    
	    function limpa_formulário_cep() {
	            //Limpa valores do formulário de cep.
	            document.getElementById('rua').value=("");
	            document.getElementById('bairro').value=("");
	            document.getElementById('cidade').value=("");
	            document.getElementById('uf').value=("");
	            document.getElementById('ibge').value=("");
	    }
	
	    function meu_callback(conteudo) {
	        if (!("erro" in conteudo)) {
	            //Atualiza os campos com os valores.
	            document.getElementById('rua').value=(conteudo.logradouro);
	            document.getElementById('bairro').value=(conteudo.bairro);
	            document.getElementById('cidade').value=(conteudo.localidade);
	            document.getElementById('uf').value=(conteudo.uf);
	            document.getElementById('ibge').value=(conteudo.ibge);
	        } //end if.
	        else {
	            //CEP não Encontrado.
	            limpa_formulário_cep();
	            alert("CEP não encontrado.");
	        }
	    }
	        
	    function pesquisacep(valor) {
	
	        //Nova variável "cep" somente com dígitos.
	        var cep = valor.replace(/\D/g, '');
	
	        //Verifica se campo cep possui valor informado.
	        if (cep != "") {
	
	            //Expressão regular para validar o CEP.
	            var validacep = /^[0-9]{8}$/;
	
	            //Valida o formato do CEP.
	            if(validacep.test(cep)) {
	
	                //Preenche os campos com "..." enquanto consulta webservice.
	                document.getElementById('rua').value="...";
	                document.getElementById('bairro').value="...";
	                document.getElementById('cidade').value="...";
	                document.getElementById('uf').value="...";
	                document.getElementById('ibge').value="...";
	
	                //Cria um elemento javascript.
	                var script = document.createElement('script');
	
	                //Sincroniza com o callback.
	                script.src = 'https://viacep.com.br/ws/'+ cep + '/json/?callback=meu_callback';
	
	                //Insere script no documento e carrega o conteúdo.
	                document.body.appendChild(script);
	
	            } //end if.
	            else {
	                //cep é inválido.
	                limpa_formulário_cep();
	                alert("Formato de CEP inválido.");
	            }
	        } //end if.
	        else {
	            //cep sem valor, limpa formulário.
	            limpa_formulário_cep();
	        }
	    };
	
	    </script>
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
						<input type="text" name="nomeCompleto" maxlength="50" required placeholder="Digite seu nome"/>
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
							<i class="fa fa-unlock"></i>
						</span> <input type="password" name="senha" minlength="8" maxlength="200" required placeholder="Digite sua senha"/>
					</div>
					<div class="form-group">
						<p>Endereço <span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-map-marker"></i>
						</span>
						<input type="text" name="endereco" maxlength="100" required placeholder="Digite seu endereço" id="rua"/>
					</div>
					<div class="form-group">
						<p>Bairro <span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-map-marker"></i>
						</span>
						<input id="bairro" type="text" name="bairro" maxlength="100" required placeholder="Digite seu bairro"/>
					</div>
				</div>
				<div class="rightcontact">
					<div class="form-group">
						<p>Cidade <span>*</span></p>
							<span class="icon-case">
								<i class="fa fa-map-marker"></i>
							</span>
							<input id="cidade" type="text" name="cidade" maxlength="100" required placeholder="Digite sua cidade"/>
					</div>
					<div class="form-group">
						<p>Estado <span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-map-marker"></i>
						</span>
						<select class="form-control style-select ajuste-icone" name="estado" required>
							<option value="">Selecione um estado</option>
							<option value="PE">Pernambuco</option>
							<option value="RJ">Rio de Janeiro</option>
						</select>
					</div>
					<div class="form-group">
						<p>CEP <span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-map-marker"></i>
						</span> <input type="text" name="cep" id="cep" value="" size="10" maxlength="9" onblur="pesquisacep(this.value);" />
					</div>
					<div class="form-group">
						<p>Sexo <span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-circle-o"></i>
						</span>
						<select class="form-control style-select ajuste-icone" name="sexo" required >
							<option value="">Selecione</option>
							<option value="Não Identificado">Não identificado</option>
							<option value="Feminino">Feminino</option>
							<option value="Masculino">Masculino</option>
						</select>
					</div>
					<div class="form-group">
						<p>Tipo de Usuário<span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-group"></i>
						</span>
						<select class="form-control ajuste-icone" id="style-select" name="TipoUsuarioStr" required>
							<option value="">Selecione</option>
							<c:if test="${usuarioLogado.tipoUsuario == 'ADM' }"><option value="ADM">Administrador</option></c:if>
							<option value="ARTESAO">Artesão</option>
							<option value="CLIENTE">Cliente</option>
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
		<script type="text/javascript" src="./resources/js/validacao.js"></script>
	</body>
</html>