<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="iso-8859-1">
		<title>Cadastrar Usuario</title>
	<!-- Adicionando JQuery -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>

    <!-- Adicionando Javascript -->
    <script type="text/javascript" >

        $(document).ready(function() {

            function limpa_formulario_cep() {
                // Limpa valores do formulário de cep.
                $("#rua").val("");
                $("#bairro").val("");
                $("#cidade").val("");
                $("#uf").val("");
              
            }
            
            //Quando o campo cep perde o foco.
            $("#cep").blur(function() {

                //Nova variável "cep" somente com dí­gitos.
                var cep = $(this).val().replace(/\D/g, '');

                //Verifica se campo cep possui valor informado.
                if (cep != "") {

                    //Expressão regular para validar o CEP.
                    var validacep = /^[0-9]{8}$/;

                    //Valida o formato do CEP.
                    if(validacep.test(cep)) {

                        //Preenche os campos com "..." enquanto consulta webservice.
                        $("#rua").val("...");
                        $("#bairro").val("...");
                        $("#cidade").val("...");
                        $("#uf").val("...");
                        

                        //Consulta o webservice viacep.com.br/
                        $.getJSON("https://viacep.com.br/ws/"+ cep +"/json/?callback=?", function(dados) {

                            if (!("erro" in dados)) {
                                //Atualiza os campos com os valores da consulta.
                                $("#rua").val(dados.logradouro);
                                $("#bairro").val(dados.bairro);
                                $("#cidade").val(dados.localidade);
                                $("#uf").val(dados.uf);
                                $("#uf").html(dados.uf);
                                
                              
                            } //end if.
                            else {
                                //CEP pesquisado não foi encontrado.
                                limpa_formulario_cep();
                                alert("CEP não encontrado.");
                            }
                        });
                    } //end if.
                    else {
                        //cep é inválido.
                        limpa_formulario_cep();
                        alert("Formato de CEP inválido.");
                    }
                } //end if.
                else {
                    //cep sem valor, limpa formulário.
                    limpa_formulario_cep();
                }
            });
        });

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
						<input type="text" name="rg" maxlength="10" required class="rg" placeholder="Digite apenas números">
					</div>
					<div class="form-group">
						<p>Email <span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-envelope-o"></i>
						</span>
						<input type="email" name="email" id="email" data-rule="email" data-msg="Preencha seu email " placeholder="Digite sua senha" 
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
						</span> <input type="password" name="senha" maxlength="200" placeholder="Digite sua senha" required/>
					</div>
					<div class="form-group">
						<p>CEP <span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-map-marker"></i>
						</span>
						<input type="text" name="cep" id="cep" value="" size="10"  maxlength="9" placeholder="Digite apenas números"  pattern="[0-9]+$" onblur="pesquisacep(this.value);"/><!--   -->
				<!-- 	<button type="button" class="btn btn-primary" style="background-color: rgba(0,0,0,.5); border-color: rgba(0,0,0,.0001);" onclick="pesquisacep(getElementById('cep').value)">Pesquisar CEP</button> -->
					</div>
					<div class="form-group">
						<p>Endereço <span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-map-marker"></i>
						</span>
						<input type="text" name="endereco" maxlength="100" required placeholder="Digite seu endereço" id="rua" value=""/>
					</div>
				</div>
				<div class="rightcontact">
					<div class="form-group">
						<p>Bairro <span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-map-marker"></i>
						</span>
						<input id="bairro" type="text" name="bairro" maxlength="100" required placeholder="Digite seu bairro" value=""/>
					</div>
					<div class="form-group">
						<p>Cidade <span>*</span></p>
							<span class="icon-case">
								<i class="fa fa-map-marker"></i>
							</span>
							<input id="cidade" type="text" name="cidade" maxlength="100" required placeholder="Digite sua cidade" value=""/>
					</div>
					<div class="form-group">
						<p>Estado <span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-map-marker"></i>
						</span>
						<select class="form-control style-select ajuste-icone" name="estado" required>
							<option value="">Selecione um estado</option>
							<c:forEach var="estado" items="${listarEstado}">
								<option value="${estado.nome}">${estado.nome}</option>
							</c:forEach>
							
						</select>
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
		
	</body>
</html>