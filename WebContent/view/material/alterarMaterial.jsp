<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

			
			<p>
				<table style="width: 100%">
					<tr>
						<td style="float: left; font-size: 24px;">Alterar <strong>Material</strong> </td>
						<td style="float: right; text-align: right;"> <img src="view/img/salvar.jpg" style="width: 14%;">  </td>
					</tr>
				</table>
			
			<hr />
			
			<form action="alterarMaterial" method="post">
				<input type="hidden" value="${material.id}" name="id">
				<div class="form-group">
    				<label for="inputDescricao">Descrição</label>
    				<input type="text" class="form-control" id="inputDescricao" name="descricao" style="width: 110px;" maxlength="50" required="required" value="${material.descricao }"> &nbsp;
  				</div>

				<br />
  				
  				<button type="reset" class="btn btn-default"> &nbsp; Limpar &nbsp; </button> &nbsp;
  				<button type="submit" class="btn btn-primary"> &nbsp; Atualizar &nbsp; </button>
  				
			</form>
		</div>
			
		</div>
		
		<br />
		
		<hr class="linhaSeparador">
		
		<div class="textoRodape">
			<p><c:import url="/view/comum/rodape.jsp" /></p>
		</div>


	</body>
</html>