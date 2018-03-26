<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="iso-8859">
    <title>Login</title>
  </head>
  <body>
    <c:import url="/view/comum/menu.jsp"/>
    <div class="">
      <div style="color: red;" align="center">
        <h6 class="mensagem-erro">${msg}</h6>
     </div>
     <form action="efetuarLogin" method="post">
      <h1 class="cor-cadastrar">Login</h1>
        <div class="form-group">
          <p class="centralizando-input margin-nome-login">
            Login<span>*</span>
          </p>
          <span class="icon-case centralizando-input"><i
            class="fa fa-user"></i></span> <input type="text" name="email"
            maxlength="80"
            placeholder="Entre com o email cadastrado no sistema." required />
        </div>
        <div class="form-group">
          <p class="centralizando-input">
            Senha<span>*</span>
          </p>
          <span class="icon-case centralizando-input"> <i
            class="fa fa-unlock"></i>
          </span> <input type="password" name="senha" maxlength="50"
            placeholder="Digite sua senha" required />
        </div>
        <button type="submit" class="col-4 offset-4 btn btn-info">Entrar</button>
        <br>
        <br> <span class="col-4 offset-4"><a
          href="exibirCadastrarUsuario" class="cor-cadastre cadastre-login">Cadastre-se</a></span>
      </form>
    </div>
    
    <footer class="py-5 bg-info"
      style="position: absolute; width: 100%; bottom: 0;">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; HandSkills
          2018</p>
      </div>
    </footer>
  </body>
</html>