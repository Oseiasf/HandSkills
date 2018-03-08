<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html >
<html>
	<head>
		<meta charset="iso-8859">
		<title>Listar Materiais</title>
	</head>
	<body>
		<!-- Navigation -->
	<c:import url="/view/comum/menu.jsp" />
	<div align="center">
	
		<div align="left" style="color: #6E6E6E; width: 70%;">
		<hr />
			<c:if test="${mensagem ne null}">
				<div class="alert alert-error" style="width: 70%;">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					${mensagem}
				</div>
			</c:if>
			<hr />
			<p>
				<table style="width: 100%">
					<tr>
						<td style="float: left; font-size: 24px;"> Listagem de <strong>Materias</strong> </td>
						<td style="float: right;"> <a href="exibirCadastrarMaterial" class="btn btn-info" role="button">Novo</a> </td>
					</tr>
				</table>
			</p>
			
			<hr />
			
			<table class="table table-striped ">
				<thead>
					<tr>
						
						<th style="width: 85%; vertical-align: middle;">Nome do Material</th>
						<th style="width: 15%; vertical-align: middle; text-align: center;">Ações</th>
						
						
					</tr>
				</thead>
				<c:forEach items="${listarMaterial}" var="material">
					<tr>
						<td style="vertical-align: middle;">${material.descricao}</td>
						<td style="vertical-align: middle; text-align: center;">
							<a href="exibirAlterarMaterial?id=${material.id}" class="btn btn-info" role="button "><span class="fa fa-check"></span></a> &nbsp;
							<a href="removerMaterial?id=${material.id}" class="btn btn-danger button-remover-alterar" role="button"><span class="fa fa-trash-o"></span></a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
			
	</div>
	
	<br />
	
	<hr class="linhaSeparador">
	
	
		<c:import url="/view/comum/rodape.jsp" />
	
		
	</body>
</html>