<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="iso-8859">
<title>Cadastrar Produto</title>
</head>
<body>
	<c:import url="/view/comum/menu.jsp" />
					<div class="form-group">
						<form action="CadastrarProduto" method="post"
							enctype="multipart/form-data">
							<div class="contentform">
								<div class="leftcontact">
									<div class="form-group">
										<p>
											Nome do produto<span>*</span>
										</p>
										<span class="icon-case"> <i class="fa fa-align-left"></i>
										</span> <input type="text" name="nomeProduto" maxlength="50" required />
									</div>
									<div class="form-group">
										<p>
											Local de origem do produto <span>*</span>
										</p>
										<span class="icon-case"> <i class="fa fa-fighter-jet"></i>
										</span> <select class="form-control" class="Menu-style-select"
											name="localOrigemProduto" required>
											<option value="PE">Pernambuco</option>
											<option value="RJ">Rio de Janeiro</option>
										</select>
									</div>
									<div class="form-group">
										<p>
											Cores dispon�veis <span>*</span>
										</p>
										<span class="icon-case"> <i class="fa fa-circle-o"></i></span> <input
											type="text" name="coresDisponiveis" maxlength="20" required />
									</div>
								</div>
								<div class="rightcontact">
									<div class="form-group">
										Material do Produto <span>*</span>
										<span class="icon-case"> <i class="fa fa-fighter-jet"></i>
										</span> <select class="form-control" class="Menu-style-select"
											name="materialProduto" required>
											<option value="">Selecione</option>
											<c:forEach items="${listaMaterialDoProduto}" var="material">
												<option value="${material.id}"> ${material.descricao} </option>
											</c:forEach>
										</select>
									</div>
									<div class="form-group">
										<p>
											Pre�o de venda <span>*</span>
										</p>
										<span class="icon-case"> <i class="fa fa-dollar"></i>
										</span> <input type="text" name="precoVenda" maxlength="20" required />
									</div>
									<div class="form-group">
										<p>
											Quantidade dispon�vel <span>*</span>
										</p>
										<span class="icon-case"> <i class="fa fa-bar-chart-o"></i>
										</span> <input type="text" name="quantidadeDisponivel" maxlength="10"
											required />
									</div>
									<div>
										<p>
											Imagem do Produto <span>*</span>
										</p>
										<input type="file" name="file" required />
									</div>
								</div>
								<button type="submit" class="bouton-contact btn-info">Cadastrar</button>
							</div>
						</form>
					</div>
				<c:import url="/view/comum/rodape.jsp" />

</body>
</html>