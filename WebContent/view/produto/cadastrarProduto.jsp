<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="iso-8859">
<title>Cadastrar Produto</title>
<style>
input[type='file'] {
	display: none
}

.input-wrapper label {
	background-color: #17a2b8;
	border-radius: 5px;
	color: #fff;
	margin: 10px;
	padding: 6px 20px
	
}

.input-wrapper label:hover {
	background-color: #2980b9
}
</style>
</head>
<body>
	<c:import url="/view/comum/menu.jsp" />
	<h5 class="mensagem-sucesso">${mensagem}</h5>
	<div class="form-group">
		<form action="CadastrarProduto" method="post"
			enctype="multipart/form-data">
			<h1 class="cor-cadastrar">Cadastrar produto</h1>
			<div class="contentform">
				<div class="leftcontact">
					<div class="form-group">
						<p>
							Nome do produto<span>*</span>
						</p>
						<span class="icon-case "> <i class="fa fa-align-left"></i>
						</span> <input type="text" name="nomeProduto" maxlength="50" required
							pattern="[Aa-Zz\s]+$" />
					</div>
					<div class="form-group">
						<p>
							Local de origem do produto <span>*</span>
						</p>
						<span class="icon-case"> <i class="fa fa-fighter-jet"></i>
						</span> <select class="form-control Menu-style-select ajuste-icone"
							name="localOrigemProduto" required>
							<option value="PE">Pernambuco</option>
							<option value="RJ">Rio de Janeiro</option>
						</select>
					</div>
					<div class="form-group">
						<p>
							Cores disponíveis <span>*</span>
						</p>
						<span class="icon-case"> <i class="fa fa-circle-o"></i></span> <input
							type="text" name="coresDisponiveis" maxlength="20" required
							pattern="[Aa-Zz\s]+$" />
					</div>

				</div>
				<div class="rightcontact">
					<div class="form-group">
						<p>
							Material do Produto <span>*</span>
						<p />
						<span class="icon-case"> <i class="fa fa-fighter-jet"></i>
						</span> <select class="form-control Menu-style-select ajuste-icone"
							name="materialDoProduto" required>
							<option value="">Selecione</option>
							<c:forEach items="${listaMaterialDoProduto}" var="material">
								<option value="${material.id}">${material.descricao}</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<p>
							Preço de venda <span>*</span>
						</p>
						<span class="icon-case"> <i class="fa fa-dollar"></i>
						</span> <input type="text" name="precoVenda" maxlength="20" required
							pattern="[0-9]+$" placeholder="ex:99,99" />
					</div>
					<div class="form-group">
						<p>
							Quantidade disponível <span>*</span>
						</p>
						<span class="icon-case"> <i class="fa fa-bar-chart-o"></i>
						</span> <input type="text" name="quantidadeDisponivel" maxlength="10"
							required pattern="[0-9]+$" />
					</div>

				</div>
				<div class="col-md-6 offset-md-3" style="margin-top: 48%;">
					<div class='input-wrapper'>
						
						<label for='input-file'> Selecione uma imagem </label> <input
							id='input-file' type='file' value='' name="file"/> <span id='file-name'  ></span>
					</div>
				</div>
				<button type="submit" class="bouton-contact btn-info">Cadastrar</button>
			</div>

		</form>
	</div>
	<c:import url="/view/comum/rodape.jsp" />

	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>
	<script type="text/javascript" src="./resources/js/mascaras.js"></script>

</body>
</html>