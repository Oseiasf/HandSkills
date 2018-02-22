
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pesquisando Usuario</title>

<!-- Bootstrap core CSS -->
<link href="./resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="./resources/css/heroic-features.css" rel="stylesheet">
<link href="./resources/css/style.css" rel="stylesheet">
<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"
	rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<link href="./resources/css/styleform.css" rel="stylesheet">
<link href="./resources/css/style.css" rel="stylesheet">
</head>
<body>
	<!-- Navigation -->
	<c:import url="/view/comum/menu.jsp" />
	<table border="1" style="width: 100%;">
		<tr>
			<td>Nome Completo</td>
			<td>Email</td>
			<td>Telefone</td>
			<td>WhatsApp</td>
			<td>Tipo de Usuario</td>
			<td colspan="2">Ações</td>
		</tr>
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
</body>
</html>