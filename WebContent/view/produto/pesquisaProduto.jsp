
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
<meta charset="iso-8859">
<title>Pesquisando Produto </title>
</head>
<body>
	
		<!-- Navigation -->
		<c:import url="/view/comum/menu.jsp" />
		<div> ${mensagem} </div>
		<div> O número de produtos encontrados foram :  ${pesquisa.size()}</div>
		<table border="1" style="width: 100%;">
			<tr>
				<td>Nome do Produto</td>
				<td>Local de Origem</td>
				<td>Disponíveis nas cores</td>
				<td>Material do Produto</td>
				<td>Preço</td>
				<td>Estoque</td>
				<td>Imagem</td>
			<c:if test="${usuarioLogado.tipoUsuario == 'ADM' }">
				<td colspan="2"><center> Ações </center> </td>
			</c:if>
			</tr>
		
		<c:forEach var="p" items="${pesquisa}">

			<tr>
				<td> ${p.nomeProduto} </td>
				<td> 
					<c:if test="${p.localOrigemProduto != ''}">
						${p.localOrigemProduto}
					</c:if>
				</td>
				<td> ${p.coresDisponiveis} </td>
				<td> ${p.materialDoProduto.descricao} </td>
				<td> 
					${p.precoVenda}
				</td>
				<td> ${p.quantidadeDisponivel} </td>
				<td>
					<c:choose>
						<c:when test="${not empty p.imagem}">
							<img src="view/img/${p.imagem}">
						</c:when>
						<c:otherwise>
							A imagem não foi carregada.
						</c:otherwise>
					</c:choose>
				 </td>
				 <c:if test="${usuarioLogado.tipoUsuario == 'ADM' || usuarioLogado.tipoUsuario == 'Artesão' }">
				 <td colspan="2">
					<a href="removerProduto?id=${p.id}" class="btn btn-info"">Remover</a>
					<a href="exibirAtualizarProduto?id=${p.id}" class="btn btn-info">Atualizar</a>
				</td>
				</c:if>
			</tr>
			
		</c:forEach>
		
		</table>
	<c:import url="/view/comum/rodape.jsp" />
	</body>
</html>