<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding= "UTF-8" %>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.6">
    <title>Login</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.4/examples/sign-in/">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/admin/css/bootstrap.min.css"/>
	<meta name="theme-color" content="#563d7c">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    
    <link href="${pageContext.request.contextPath}/assets/admin/signin.css" rel="stylesheet">
    
  </head>
  
  <body class="text-center">
    <form class="form-signin" method="post" action="EmpresaController" >
		  <h1 class="h3 mb-3 font-weight-normal">Login</h1>
		  <label for="email" class="sr-only">Email</label>
		  <input name="email" type="email" id="email" class="form-control" placeholder="login" required autofocus>
		    <br/>
		  <label for="senha" class="sr-only">Senha</label>
		  <input name="senha" type="password" id="senha" class="form-control" placeholder="Senha" required>
		  
		  <a href="${pageContext.request.contextPath}/" onclick="valida()"  class="btn btn-lg btn-primary btn-block" type="submit">Logar</a>
		  <!--  -->
		  <div>
             <a onclick="mudar()"  class="btn btn-lg btn-primary btn-block" type="submit">Cadastro</a>
          </div>
		  <p class="mt-5 mb-3 text-muted">&copy; 2017-2019</p>
	</form>
	
	
	
	<script>
		const valida = () => {
			event.preventDefault();
		    let email = document.getElementById("email").value;
		    let senha = document.getElementById("senha").value;
		    
		    if(email === '' && senha === ''){
			    alert('Campos obrigatórios não preenchidos!');
			    //window.history.back('http://localhost:8080/agenda-acme/login.jsp');
		    }
		    if(email === 'me@me.com' && senha === '1234'){
			    
			    window.location.href ='http://localhost:8080/agenda-acme/index.jsp';
		    }
		    else{
		    	alert('Campos invalidos!');
		    	window.location.href ='http://localhost:8080/agenda-acme/login.jsp';
			    //window.history.back('http://localhost:8080/agenda-acme/login.jsp');
		    }
		  }
		const mudar = () => {
		    window.location.href ='http://localhost:8080/agenda-acme/Crud.jsp';
		}
  
	</script>
	
</body>


</html>

