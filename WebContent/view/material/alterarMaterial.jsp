<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="iso-8859">
<title>Alterar Material</title>
</head>
<body id="corpoPadrao">
	<c:import url="/view/comum/menu.jsp" />
	<div align="center">
		<div align="left" style="color: #6E6E6E; width: 70%; margin-top: 4%;">

			<form action="alterarMaterial" method="post">
				<h1 class="cor-cadastrar">Alterar material</h1>
				<input type="hidden" value="${material.id}" name="id">
				<div class="form-group">

					<p class="descricao">
						Descrição do produto<span>*</span>
					</p>
					</span> <input type="text" class="form-control" id="inputDescricao"
						name="descricao" maxlength="50" required="required"
						style="width: 100%" value="${material.descricao }" /> <span>${nomeMaterialProdutoExiste}</span>
				</div>

				<br />
				<div class="botao-material">
				<button type="reset" class="btn btn-info">&nbsp; Limpar
					&nbsp;</button>
				&nbsp;
				<button type="submit" class="btn btn-info">&nbsp;
					Atualizar &nbsp;</button>
				</div>
			</form>
		</div>

	</div>

	<br />

	<hr class="linhaSeparador">

	<div class="textoRodape">
		<p>
			<c:import url="/view/comum/rodape.jsp" />
		</p>
	</div>


</body>
</html>