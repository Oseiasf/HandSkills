<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="iso-8859">
		<title>Listar usuários</title>
	</head>
	<body>
		<c:import url="/view/comum/menu.jsp"/>
		<br><br>
		<table border="2" class="table table-striped">
			<thead class="thead-inverse">
				<tr  class="table-success">
					<th>Nome</th>
					<th>CPF</th>
					<th>RG</th>
					<th>Email</th>
					<th>Endereço</th>
					<th>Bairro</th>
					<th>Cidade</th>
					<th>Estado</th>
					<th>Sexo</th>
					<th>Telefone</th>
					<th>Ações</th>
				</tr>
			</thead>
		<c:forEach items="${listarUsuario}" var="usu" >
			<tr>
				<td>${usu.nomeCompleto}</td>
				<td>${usu.cpf}</td>
				<td>${usu.rg}</td>
				<td>${usu.email }</td>
				<td>${usu.endereco }</td>
				<td>${usu.cidade }</td>
				<td>${usu.bairro }</td>
				<td>${usu.estado}</td>
				<td>${usu.sexo }</td>
				<td>${usu.telefone }</td>
				<td>
					<div class="card-footer">
					<a href="exibirAtualizarUsuario?id=${usu.id}" class="btn btn-info">Alterar</a>
					</div>
				</td>
			</tr>
		</c:forEach>
		</table>
		<c:import url="/view/comum/rodape.jsp" />
	</body>
</html>