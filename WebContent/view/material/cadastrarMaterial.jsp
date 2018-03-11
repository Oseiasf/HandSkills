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
					<h5 class="mensagem-sucesso" style="margin-left: 35%">${msg}</h5>
				</div>
			</c:if>
			<form action="cadastrarMaterial" method="post">
				<h1 class="cor-cadastrar">Cadastrar material</h1>
				<div class="form-group">

					<p class="descricao">
						Material do produto<span>*</span>
					</p>
					</span> <input type="text" name="Descricao" maxlength="50" required pattern="[Aa-Zz\s]+$" style="width: 100%" placeholder="Digite o material do produto" />
					<h6 class="mensagem-erro">${nomeMaterialProdutoExiste}</h6>

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