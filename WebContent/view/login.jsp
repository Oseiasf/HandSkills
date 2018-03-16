<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="iso-8859">
		<title>Login</title>
	</head>
	<body>
		<c:import url="/view/comum/menu.jsp" />
					<div class="">
					<div style="color: red;" align="center"> <h6 class="mensagem-erro"> ${msg} </h6> </div>
						<form action="efetuarLogin" method="post">
							<div class="form-group">
								<p>
									Login<span>*</span>
								</p>
								<span class="icon-case"><i class="fa fa-user"></i></span> <input type="text" name="email" maxlength="80" placeholder="Entre com o email cadastrado no sistema." required/>
							</div>
							<div class="form-group">
								<p>
									Senha<span>*</span>
								</p>
								<span class="icon-case">
									<i class="fa fa-user"></i>
								</span>
								<input type="password" name="senha" maxlength="50" placeholder="Digite sua senha" required/>
							</div>
							<button type="submit" class="col-4 offset-4 btn btn-info">Entrar</button> <br><br>
							<span class="col-4 offset-4"><a href="exibirCadastrarUsuario" class="cor-cadastre cadastre-login">Cadastre-se</a></span>
						</form>
					</div>
		<c:import url="/view/comum/rodape.jsp" />
	
	</body>
</html>