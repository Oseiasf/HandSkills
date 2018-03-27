<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Efetuar Compra</title>
		
		<script>
            function checkNumber(value) {
                if (value.trim() !== "") {
                    var regra = /^[0-9]+$/;
                    var permitir = value.match(regra);
                    if (permitir) {
                    	
                    } 
                    else {
                        alert("Permitido somente números");
                       value = getElementById("qnt").focus();
                        
                    }
                    return true;
                }
            }
        </script>
        
		<link rel="stylesheet" type="text/css" href="view/css/estilo.css" />
		<link rel="stylesheet" type="text/css"
			href="view/bootstrap/css/bootstrap.min.css" />
		
		<script type="text/javascript" src="view/js/jquery-2.1.4.js"></script>
		<script type="text/javascript" src="view/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="view/js/maskedinput.js"></script>
	</head>
	<body id="corpoPadrao">
		<c:import url="/view/comum/menu.jsp" />
		<div align="center">
			<div align="left" style="color: #6E6E6E; width: 70%; margin-top: 4%;">
				<c:if test="${msg ne null}">
					<div class="alert alert-error" style="width: 70%;">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						${msg}
					</div>
				</c:if>
				<form action="concluirVendaUnica" method="post" onsubmit="checkNumber()">
					<input type="hidden" name="id" value="${p.id}">
					<h1 class="cor-cadastrar">Finalizar Compra</h1>
					<div class="form-group">
						<p class="centralizando-input margin-nome-login">Nome do
							produto
						</p>
						<span class="icon-case centralizando-input"><i
							class="fa fa-align-left"></i></span> <input type="text" name="nomeProduto"
							value="${p.nomeProduto}" readonly maxlength="80" required />
					</div>
					<div class="form-group">
						<p class="centralizando-input margin-nome-login">Material
							principal
						</p>
						<span class="icon-case centralizando-input"><i
							class="fa fa-align-left"></i></span> <input type="text" name="materialDoProduto"
							value="${p.materialDoProduto.descricao} " readonly maxlength="80"
							required />
					</div>
					<div class="form-group">
						<p class="centralizando-input margin-nome-login">valor 
							do produto
						</p>
						<span class="icon-case centralizando-input"><i
							class="fa fa-dollar"></i></span> <input type="text" name="precoVenda"
							value="${p.precoVenda}" readonly maxlength="80"
							required />
					</div>
					<div class="form-group">
						
						<p class="centralizando-input margin-nome-login">Quantidade
							do produto
						</p>
						<span class="icon-case centralizando-input"><i
							class="fa fa-edit"></i></span> <input id="qnt" type="text" name="quantidade"
							 maxlength="10"
							required class="quantidade" onblur="return checkNumber(this.value)"/>
							<br><br><h6 class="mensagem-erro" >${erro}</h6>
							<form:errors path="itemCarrinho.quantidade" cssStyle="color:red" />
					</div>
					<br />
					<div class="alinhar-botoes">
						<a href="listarProduto" class="btn btn-danger" role="button">Cancelar</a>
						&nbsp;
						<button type="reset" class="btn btn-default">&nbsp; Limpar
							&nbsp;
						</button>
						&nbsp;
						<button type="submit" class="btn btn-info">&nbsp;
							Comprar &nbsp;
						</button>
					</div>
				</form>
			</div>
		</div>
		<br />
		<hr class="linhaSeparador">
		<div class="textoRodape">
			<p>
				<c:import url="/view/comum/rodape.jsp" />
			</p>
		</div>
	</body>
</html>