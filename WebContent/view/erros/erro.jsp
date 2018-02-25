<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="iso-8859">
<title>ERROR</title>
</head>
<body>
	<!-- Navigation -->
	<c:import url="/view/comum/menu.jsp" />
	
	<div class="alert alert-success" style="width: 100%;">
		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<h3>Ocorreu um erro insperado, contate o administrador do sistema no e-mail ....</h3>
	</div>
		
	<div class="textoRodape">
		<p><c:import url="/view/comum/rodape.jsp" /></p>
	</div>
</body>
</html>