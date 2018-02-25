
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<meta charset="iso-8859">
<title>Pesquisando Usuario</title>
</head>
</body>
	<!-- Navigation -->
	<c:import url="/view/comum/menu.jsp" />
	<div align="center">
	
		<div align="left" style="color: #6E6E6E; width: 70%;">
		
			<c:if test="${msg ne null}">
				<div class="alert alert-success" style="width: 100%;">
					<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
					${msg}
				</div>
			</c:if>
			
			<hr />
			
			<p>
				<table style="width: 100%">
					<tr>
						<td style="float: left; font-size: 24px;"> Listagem de <strong>Usu�rios</strong> </td>
						<td style="float: right;"> <a href="exibirCadastrarUsuario" class="btn btn-primary" role="button">Novo</a> </td>
					</tr>
				</table>
			</p>
			
			<hr />
			
			<table class="table table-striped table-bordered">
				<thead>
					<tr>
						
						<th style="width: 20%; vertical-align: middle;">Nome</th>
						<th style="width: 20%; vertical-align: middle;">E-mail</th>
						<th style="width: 30%; vertical-align: middle;">Cidade</th>
						<th style="width: 30%; vertical-align: middle;">Telefone</th>
						<th style="width: 30%; vertical-align: middle;">WhatSapp</th>
						<th style="width: 30%; vertical-align: middle;">Tipo de Usu�rio</th>
						<th style="width: 20%; vertical-align: middle; text-align: center;">A��es</th>
					</tr>
				</thead>
				<c:forEach items="${pesquisaUsuario}" var="usuario">
					<tr>
						<td style="vertical-align: middle;">${usuario.nomeCompleto}</td>
						<td style="vertical-align: middle;">${usuario.email}</td>
						<td style="vertical-align: middle;">${usuario.cidade}</td>
						<td style="vertical-align: middle;">${usuario.telefone}</td>
						<td style="vertical-align: middle;">${usuario.whatsapp}</td>
						<td style="vertical-align: middle;">${usuario.tipoUsuario}</td>
						<td style="vertical-align: middle; text-align: center;">
							<a href="exibirAtualizarUsuario?id=${usuario.id}" class="btn btn-warning" role="button">E</a> &nbsp;
							<a href="removerUsuario?id=${usuario.id}" class="btn btn-danger" role="button">R</a>
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