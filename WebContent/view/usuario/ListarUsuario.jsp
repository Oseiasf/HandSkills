<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html >
<html>
	<head>
		<meta charset="iso-8859">
		<title>Listar usuários</title>
	</head>
	<body>
			<!-- Navigation -->
		<c:import url="/view/comum/menu.jsp" />
		<div align="center">
			<div align="left" style="color: #6E6E6E; width: 90%;">
				<hr/>
				<p>
					<table style="width: 100%">
						<tr>
							<td style="float: left; font-size: 24px;"> Listagem de <strong>Usuários</strong> </td>
							<td style="float: right;"> <a href="exibirCadastrarUsuario" class="btn btn-info" role="button">Novo</a> </td>
						</tr>
					</table>
				</p>
				<hr />
				<table class="table table-striped table-bordered">
					<thead>
						<tr>
							<th style="width: 20%; vertical-align: middle;">Nome</th>
							<th style="width: 20%; vertical-align: middle;">E-mail</th>
							<th style="width: 10%; vertical-align: middle;">Cidade</th>
							<th style="width: 15%; vertical-align: middle;">Telefone</th>
							<th style="width: 15%; vertical-align: middle;">WhatsApp</th>
							<th style="width: 10%; vertical-align: middle;">Tipo de Usuário</th>
							<th style="width: 10%; vertical-align: middle; text-align: center;">Ações</th>
						</tr>
					</thead>
					<c:forEach items="${listarUsuario}" var="usuario">
						<tr>
							<td style="vertical-align: middle;">${usuario.nomeCompleto}</td>
							<td style="vertical-align: middle;">${usuario.email}</td>
							<td style="vertical-align: middle;">${usuario.cidade}</td>
							<td style="vertical-align: middle;">${usuario.telefone}</td>
							<td style="vertical-align: middle;">${usuario.whatsapp}</td>
							<td style="vertical-align: middle;">${usuario.tipoUsuario}</td>
							<td style="vertical-align: middle;">
								<a href="exibirAtualizarUsuario?id=${usuario.id}" class="btn btn-info" role="button "><span class="fa fa-check"></span></a> &nbsp;
								<a href="removerUsuario?id=${usuario.id}" class="btn btn-danger button-remover-alterar" role="button"><span class="fa fa-trash-o"></span></a>
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