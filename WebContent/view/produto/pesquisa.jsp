
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pesquisando Produto </title>

<link rel="stylesheet" type="text/css" href="view/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="view/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>
	
		<c:import url="/view/comum/menu.jsp" />
		
		<div> ${mensagem} </div>
		
		<table border="1" style="width: 100%;">
			<tr>
				<td>Nome do Produto</td>
				<td>Local de Origem</td>
				<td>Disponíveis nas cores</td>
				<td>Material do Produto</td>
				<td>Preço</td>
				<td>Estoque</td>
				<td>Imagem</td>
				<td colspan="2"><center> Ações </center> </td>
			</tr>
		
		
		<div> <p> O numrero de produtos encontrados foi ${pesquisa.size()} </p></div>
		
		<c:forEach var="p" items="${pesquisa}">

			<tr>
				<td> ${p.nomeProduto} </td>
				<td> 
					<c:if test="${p.localOrigemProduto != ''}">
						${p.localOrigemProduto}
					</c:if>
				</td>
				<td> ${p.coresDisponiveis} </td>
				<td> ${p.materialDoProduto} </td>
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
				 <td colspan="2">
				 
				 	<button class="btn" style="color: red;">
						<a href="removerProduto?id=${p.id}">Remover</a>
					</button>
					<button class="btn">
						<a href="exibirAtualizarProduto?id=${p.id}">Atualizar</a>
					</button>
				</td>
			</tr>
			
		</c:forEach>
		
		</table>

	</body>
</html>