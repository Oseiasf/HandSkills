<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="iso-8859">
<title>Alterar produto</title>
</head>

<body>
<body>
	<c:import url="/view/comum/menu.jsp" />
	<form action="alterarProduto" method="post">
		<h1 class="cor-cadastrar">Alterar produto</h1>

		<div class="contentform">



			<div class="leftcontact">
				<div class="form-group">

					<input type="hidden" name="id" value="${p.id}">
					<form:errors path="produto.nomeProduto" cssStyle="color:red" />
					<p>
						Nome do produto<span>*</span>
					</p>
					<span class="icon-case"><i class="fa fa-align-left"></i></span> <input
						type="text" name="nomeProduto" value="${p.nomeProduto}"
						maxlength="50" pattern="[Aa-Zz\s]+$"/>

				</div>



				<div class="form-group">
				<form:errors path="produto.localOrigemProduto" cssStyle="color:red" />
					<p>
						Local de origem do produto <span>*</span>
					</p>
					<span class="icon-case"><i class="fa fa-fighter-jet"></i>
					</span> 
					<select class="form-control" class="Menu-style-select"
							name="localOrigemProduto" required>
						<option value="${p.localOrigemProduto}">${p.localOrigemProduto}</option>
						<c:forEach items="${listarEstado}" var="estado">
							<option value="${estado.nome}">${estado.nome}</option>
						</c:forEach>
						</select>

				</div>

				<div class="form-group">
				<form:errors path="produto.coresDisponiveis" cssStyle="color:red" />
					<p>
						Cores disponíveis <span>*</span>
					</p>
					<span class="icon-case"><i class="fa fa-circle-o"></i></span> <input
						type="text" name="coresDisponiveis" value="${p.coresDisponiveis}" maxlength="20" />

				</div>

			</div>

			<div class="rightcontact">

				<div class="form-group">
					Material do Produto <span>*</span>
						<span class="icon-case">
							<i class="fa fa-fighter-jet"></i>
						</span>
						<select class="form-control" class="Menu-style-select"
							name="materialDoProduto" required>
						<option value="">Selecione</option>
						<c:forEach items="${listaMaterialDoProduto}" var="material">
							<option value="${material.id}" <c:if test="${material.id eq p.materialDoProduto.id}">selected="selected"</c:if> >
								${material.descricao} </option>
						</c:forEach>
						</select>
				</div>

				<div class="form-group">
					<p>
						Preço de venda <span>*</span>
					</p>
					<span class="icon-case"><i class="fa fa-dollar"></i></span> <input
						type="text" name="precoVenda" value="${p.precoVenda}" maxlength="20"  placeholder="ex: 99,99" />

				</div>

				<div class="form-group">
					<p>
						Quantidade disponível <span>*</span>
					</p>
					<span class="icon-case"><i class="fa fa-bar-chart-o"></i></span> <input
						type="text" name="quantidadeDisponivel" value="${p.quantidadeDisponivel}" maxlength="10" />

				</div>


			</div>
		</div>
		<button type="submit" class="bouton-contact btn-info">Atualizar</button>

	</form>


	<c:import url="/view/comum/rodape.jsp" />
	
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.js"></script>
	<script type="text/javascript" src="./resources/js/mascaras.js"></script>

</body>
</html>