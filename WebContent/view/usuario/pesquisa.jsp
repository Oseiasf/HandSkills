
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<meta charset="iso-8859">
<title>Pesquisando Usuario</title>
</head>
<body>
	<!-- Navigation -->
	<c:import url="/view/comum/menu.jsp" />
	<table border="1" style="width: 100%;" class="table">
	
	<thead class="thead-dark">
    <tr class="cor-th">
      
      <th scope="col" id="cor-th">Nome Completo</th>
      <th scope="col" >Email</th>
      <th scope="col" >Telefone</th>
      <th scope="col" >WhatsApp</th>
      <th scope="col" >Tipo de Usuario</th>
      <th scope="col" colspan="2">Ações</th>
    </tr>
  </thead>
		
		<c:forEach var="u" items="${listarUsuario}">
			<tr>
				<td>${u.nomeCompleto}</td>
				<td>${u.email}</td>
				<td>${u.telefone}</td>
				<td>${u.whatsapp}</td>
				<td>${u.tipoUsuario}</td>
				<td colspan="2">
					<button class="btn" style="color: red;">
						<a href="removerUsuario?id=${u.id}">Remover</a>
					</button>
					<button class="btn">
						<a href="exibirAtualizarUsuario?id=${u.id}">Atualizar</a>
					</button>
				</td>
			</tr>
		</c:forEach>
	</table>
<c:import url="/view/comum/rodape.jsp" />
</body>
</html>