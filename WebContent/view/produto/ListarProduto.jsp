
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Listar produtos</title>

<link rel="stylesheet" type="text/css" href="view/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="view/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>
	
		<%-- <c:import url="/view/comum/menu.jsp" /> --%>
		<center><div>${mensagem}</div></center>
		<table border="1" style="width: 100%;">
			<tr>
				<td>C�digo</td>
				<td>Nome do Produto</td>
				<td>Local onde foi feito</td>
				<td>Cores dispon�veis</td>
				<td>Material Feito</td>
				<td>Pre�o de Venda</td>
				<td>Quantidade dispon�vel</td>
				<td>Imagem</td>
				<td>Op��es</td>
			
			</tr>
		
		<c:forEach var="p" items="${listaProduto}">

			<tr>
				<td>${p.codigo}</td>
				<td>${p.nomeProduto}</td>
				<td>${p.localOrigemProduto}</td>
				<td>${p.coresDisponiveis}</td>
				<td>${p.materialFeito}</td>
				<td>${p.precoVenda}</td>
				<td>${p.quantidadeDisponivel}</td>
				<td>
					<c:choose>
						<c:when test="${not empty p.imagem}">
							<img src="view/img/${p.imagem}">
						</c:when>
						<c:otherwise>
							A imagem n�o foi carregada.
						</c:otherwise>
					</c:choose>
				 </td>
				 <td colspan="2">
				 	<button class="btn">
				 		<a href="removerProduto?id=${p.id}">Remover</a>
				 	</button>
					<button class="btn">
						<a href="exibirAlterarProduto?id=${p.id}">Atualizar</a>
					</button>
				</td>
			</tr>
		</c:forEach>
		
		</table>

	</body>
</html>