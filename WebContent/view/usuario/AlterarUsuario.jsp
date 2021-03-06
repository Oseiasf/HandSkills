<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="iso-8859-1">
		<title>Alterar Usuario</title>
	<!-- Adicionando JQuery -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>

    <!-- Adicionando Javascript -->
    <script type="text/javascript" >

        $(document).ready(function() {

            function limpa_formulario_cep() {
                // Limpa valores do formul�rio de cep.
                $("#rua").val("");
                $("#bairro").val("");
                $("#cidade").val("");
                $("#uf").val("");
              
            }
            
            //Quando o campo cep perde o foco.
            $("#cep").blur(function() {

                //Nova vari�vel "cep" somente com d��gitos.
                var cep = $(this).val().replace(/\D/g, '');

                //Verifica se campo cep possui valor informado.
                if (cep != "") {

                    //Express�o regular para validar o CEP.
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
                                //CEP pesquisado n�o foi encontrado.
                                limpa_formulario_cep();
                                alert("CEP n�o encontrado.");
                            }
                        });
                    } //end if.
                    else {
                        //cep � inv�lido.
                        limpa_formulario_cep();
                        alert("Formato de CEP inv�lido.");
                    }
                } //end if.
                else {
                    //cep sem valor, limpa formul�rio.
                    limpa_formulario_cep();
                }
            });
        });

    </script>
    	<script>
            function checkNumber(value) {
                if (value.trim() !== "") {
                    var regra = /^[0-9]+$/;
                    if (value.match(regra)) {
                    } 
                    else {
                        alert("Permitido somente n�meros");
                    }
                }
            }
        </script>
	</head>
	<body>
		<c:import url="/view/comum/menu.jsp" />
		<h5 class="mensagem-sucesso">${mensagem}</h5>
		<form action="alterarUsuario" method="post">
			<h1 class="cor-cadastrar">Alterar usu�rio</h1>
			<input type="hidden" name="id" value="${u.id}" >
			<div class="contentform">
				<div class="leftcontact">
					<div class="form-group">
						<p>Nome completo<span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-user"></i>
						</span>
						<input type="text" name="nomeCompleto" maxlength="50" required placeholder="Digite seu nome" value="${u.nomeCompleto}"/>
						<form:errors path="usuario.nomeCompleto" cssStyle="color:red" />
					</div>
					<div class="form-group">
						<p>CPF <span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-credit-card"></i>
						</span>
						<input type="text" name="cpf" maxlength="15" required placeholder="ex: 999.999.999-99" class="cpf" value="${u.cpf}"/>
						<form:errors path="usuario.cpf" cssStyle="color:red" />
						<h7 class="mensagem-erro">${cpfExiste}</h7>
					</div>
					<div class="form-group">
						<p>RG <span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-keyboard-o"></i>
						</span>
						<input type="text" name="rg" maxlength="10" required placeholder="Digite apenas n�meros" value="${u.rg}" onblur="checkNumber(this.value)"/>
						<form:errors path="usuario.rg" cssStyle="color:red" />
					</div>
					<div class="form-group">
						<p>Email <span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-envelope-o"></i>
						</span>
						<input type="email" name="email" id="email" data-rule="email" data-msg="Preencha seu email " placeholder="Preencha seu email " 
							maxlength="50" required value="${u.email}"/>
						<br>
						<br>
						<form:errors path="usuario.email" cssStyle="color:red" />
						<h7 class="mensagem-erro">${emailExiste}</h7>
						<div class="validation"></div>
					</div>
					<div class="form-group">
						<p> Senha <span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-unlock"></i>
						</span> 
						<input type="password" name="senha" maxlength="200" required placeholder="Digite sua senha" value="${u.senha}"/>
						<form:errors path="usuario.senha" cssStyle="color:red" />
					</div>
					<div class="form-group">
						<p>CEP <span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-map-marker"></i>
						</span>
						<input type="text" name="cep" id="cep" value="${u.cep}" size="10"  maxlength="9" placeholder="Digite apenas n�meros" pattern="[0-9]+$" onblur="pesquisacep(this.value);"/><!--   -->
						<form:errors path="usuario.cep" cssStyle="color:red" />
				<!-- 	<button type="button" class="btn btn-primary" style="background-color: rgba(0,0,0,.5); border-color: rgba(0,0,0,.0001);" onclick="pesquisacep(getElementById('cep').value)">Pesquisar CEP</button> -->
					</div>
					<div class="form-group">
						<p>Endere�o <span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-map-marker"></i>
						</span>
						<input type="text" name="endereco" maxlength="100" required placeholder="Digite seu endere�o" id="rua" value="${u.endereco }"/>
					</div>
				</div>
				<div class="rightcontact">
					<div class="form-group">
						<p>Bairro <span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-map-marker"></i>
						</span>
						<input id="bairro" type="text" name="bairro" maxlength="100" required placeholder="Digite seu bairro" value="${u.bairro}"/>
					</div>
					<div class="form-group">
						<p>Cidade <span>*</span></p>
							<span class="icon-case">
								<i class="fa fa-map-marker"></i>
							</span>
							<input id="cidade" type="text" name="cidade" maxlength="100" required placeholder="Digite sua cidade" value="${u.cidade}"/>
					</div>
					<div class="form-group">
						<p>Estado <span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-map-marker"></i>
						</span>
						<select class="form-control style-select ajuste-icone" name="estado" required>
							<option value="${u.estado}">${u.estado}</option>
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
							<option value="${u.sexo}">${u.sexo}</option>
							<option value="N�o Identificado">N�o identificado</option>
							<option value="Feminino">Feminino</option>
							<option value="Masculino">Masculino</option>
						</select>
					</div>
					<div class="form-group">
						<p>Tipo de Usu�rio<span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-group"></i>
						</span>
						<select class="form-control ajuste-icone" id="style-select" name="TipoUsuarioStr" required>
							<option value="${u.tipoUsuario}">${u.tipoUsuario}</option>
							<c:if test="${usuarioLogado.tipoUsuario == 'ADM' }"><option value="ADM">Administrador</option></c:if>
							<option value="ARTESAO">Artes�o</option>
							<option value="CLIENTE">Cliente</option>
						</select>
					</div>
					<div class="form-group">
						<p>Telefone <span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-phone"></i>
						</span>
						<input type="text" name="telefone" maxlength="25" required class="telefone" placeholder="ex: (99)99999-9999" value="${u.telefone }"/>
						<form:errors path="usuario.telefone" cssStyle="color:red" />
					</div>
					<div class="form-group">
						<p>WhatsApp <span>*</span></p>
						<span class="icon-case">
							<i class="fa fa-phone"></i>
						</span>
						<input type="text" name="whatsapp" maxlength="25" required class="whatsapp" placeholder="ex: (99)99999-9999" value="${u.whatsapp }]"/>
						<form:errors path="usuario.whatsapp" cssStyle="color:red" />
					</div>
				</div>
			</div>
			<button type="submit" class="bouton-contact btn-info">Alterar dados</button>
		</form>
		<c:import url="/view/comum/rodape.jsp" />
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>
		<script type="text/javascript" src="./resources/js/mascaras.js"></script>
		
	</body>
</html>