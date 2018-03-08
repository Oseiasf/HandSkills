<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="iso-8859">
<title>Cadastrar Material</title>
</head>
<body id="corpoPadrao">
	<c:import url="/view/comum/menu.jsp" />
	<div align="center">
		<div align="left" style="color: #6E6E6E; width: 70%; margin-top: 4%;">
			<c:if test="${msg ne null}">
				<div class="alert alert-error" style="width: 70%;">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					${msg}
				</div>
			</c:if>

			<hr />

			<p>
			<table style="width: 100%">
				<tr>
					<td style="float: left; font-size: 24px;">Incluir <strong>Material</strong>
					</td>
					<td style="float: right; text-align: right;"></td>
				</tr>
			</table>

			<hr />

			<form action="cadastrarMaterial" method="post">

				<div class="form-group">
					
					<p>
						Descrição do produto<span>*</span>
					</p>
					<span class="icon-case "> <i class="fa fa-align-left"></i>
					</span> <input type="text" name="nomeProduto" maxlength="200" required
						pattern="[Aa-Zz\s]+$" /> <span>${nomeMaterialProdutoExiste}</span>
				</div>

				<br />
				<div class="botao-material">
					<button type="reset" class="btn btn-info">&nbsp; Limpar
						&nbsp;</button>
					&nbsp;
					<button type="submit" class="btn btn-info">&nbsp; Inserir
						&nbsp;</button>
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