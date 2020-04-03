<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Crud</title>

	<style type="text/css">
		body > table{
	    width: 80%;
		}
		
		table{
		    border-collapse: collapse;
		}
		table.list{
		    width:100%;
		}
		
		td, th {
		    border: 1px solid #dddddd;
		    text-align: left;
		    padding: 8px;
		}
		tr:nth-child(even),table.list thead>tr {
		    background-color: #99ccf5;
		}
		
		input[type=text], input[type=number] {
		    width: 100%;
		    padding: 12px 20px;
		    margin: 8px 0;
		    display: inline-block;
		    border: 1px solid rgb(154, 213, 248);
		    border-radius: 4px;
		    box-sizing: border-box;
		}
		
		input[type=submit]{
		    width: 30%;
		    background-color: rgb(136, 250, 146);
		    color: rgb(255, 255, 255);
		    padding: 14px 20px;
		    margin: 8px 0;
		    border: none;
		    border-radius: 4px;
		    cursor: pointer;
		}
		
		form div.form-action-buttons{
		    text-align: right;
		}
		
		a{
		    cursor: pointer;
		    text-decoration: underline;
		    color: #3d51ff;
		    margin-right: 4px;
		}
		
		label.validation-error{
		    color:   red;
		    margin-left: 5px;
		}
		
		.hide{
		    display:none;
		}
	</style>
</head>
<body>
	<table>
        <tr>
            <td>
                <form onsubmit="event.preventDefault();submeterForm();" autocomplete="off">
                    <div>
                        <label>Nome completo*:</label><label class="validation-error hide" id="erroValidacaoNome">Campo obrigatorio!</label>
                        <input type="text" name="nomecompleto" id="nomecompleto">
                    </div>
                    <div>
                        <label>E-mail:</label><label class="validation-error hide" id="erroValidacaoEmail">Campo obrigatorio!</label>
                        <input type="text" name="email" id="email">
                    </div>
                    <div>
                        <label>CPF:</label><label class="validation-error hide" id="erroValidacaoCpf">Campo obrigatorio!</label>
                        <input type="text" name="cpf" id="cpf">
                    </div>
                    <div>
                        <label>Codigo:</label><label class="validation-error hide" id="erroValidacaoCodigo">Campo obrigatorio!</label>
                        <input type="text" name="cogigo" id="codigo">
                    </div>
                    <div  class="form-action-buttons">
                        <input type="submit" value="submit">
                    </div>

                    <div>
                        <a onclick="mudar()"  class="btn btn-lg btn-primary btn-block" type="submit">Voltar</a>
                    </div>
                    

                </form>
            </td>
            <td>
                <table class="list" id="userLista">
                    <thead>
                        <tr>
                            <th>Nome Completo</th>
                            <th>E-mail</th>
                            <th>CPF</th>
                            <th>Codigo</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </td>
        </tr>
    </table>
    <script type="text/javascript">
	    var linhaSelecionada = null
	
	    function submeterForm() {
	        if (validar()) {
	            var dadosForm = pegarDados();
	            if (linhaSelecionada == null)
	                inserir(dadosForm);
	            else
	                update(dadosForm);
	            resetarForm();
	        }
	    }
	
	    function pegarDados() {
	        var dadosForm = {};
	        dadosForm["nomecompleto"] = document.getElementById("nomecompleto").value;
	        dadosForm["email"] = document.getElementById("email").value;
	        dadosForm["cpf"] = document.getElementById("cpf").value;
	        dadosForm["codigo"] = document.getElementById("codigo").value;
	        return dadosForm;
	    }
	
	    function inserir(dado) {
	        var tabela = document.getElementById("userLista").getElementsByTagName('tbody')[0];
	        var novaLinha = tabela.insertRow(tabela.length);
	        cell1 = novaLinha.insertCell(0);
	        cell1.innerHTML = dado.nomecompleto;
	        cell2 = novaLinha.insertCell(1);
	        cell2.innerHTML = dado.email;
	        cell3 = novaLinha.insertCell(2);
	        cell3.innerHTML = dado.cpf;
	        cell4 = novaLinha.insertCell(3);
	        cell4.innerHTML = dado.codigo;
	        cell4 = novaLinha.insertCell(4);
	        cell4.innerHTML = `<a onClick="editarRegistro(this)">Editar</a>
	                           <a onClick="apagarRegistro(this)">Apagar</a>`;
	    }
	
	    function resetarForm() {
	        document.getElementById("nomecompleto").value = "";
	        document.getElementById("email").value = "";
	        document.getElementById("cpf").value = "";
	        document.getElementById("codigo").value = "";
	        linhaSelecionada = null;
	    }
	
	    function editarRegistro(td) {
	        linhaSelecionada = td.parentElement.parentElement;
	        document.getElementById("nomecompleto").value = linhaSelecionada.cells[0].innerHTML;
	        document.getElementById("email").value = linhaSelecionada.cells[1].innerHTML;
	        document.getElementById("cpf").value = linhaSelecionada.cells[2].innerHTML;
	        document.getElementById("codigo").value = linhaSelecionada.cells[3].innerHTML;
	    }
	    function update(dadosForm) {
	        linhaSelecionada.cells[0].innerHTML = dadosForm.fullName;
	        linhaSelecionada.cells[1].innerHTML = dadosForm.empCode;
	        linhaSelecionada.cells[2].innerHTML = dadosForm.salary;
	        linhaSelecionada.cells[3].innerHTML = dadosForm.city;
	    }
	
	    function apagarRegistro(td) {
	        if (confirm('Confirma apagar registro?')) {
	            linha = td.parentElement.parentElement;
	            document.getElementById("userLista").deleteRow(linha.rowIndex);
	            resetarForm();
	        }
	    }
	    function validar() {
	        valido = true;
	        if ((document.getElementById("nomecompleto").value == "") || (document.getElementById("email").value == "") || (document.getElementById("cpf").value == "") || (document.getElementById("codigo").value == "") ) {
	            valido = false;
	            document.getElementById("erroValidacaoNome").classList.remove("hide");
                document.getElementById("erroValidacaoEmail").classList.remove("hide");
                document.getElementById("erroValidacaoCpf").classList.remove("hide");
                document.getElementById("erroValidacaoCodigo").classList.remove("hide");
	        } else {
	            valido = true;
	            if (!document.getElementById("erroValidacaoNome").classList.contains("hide"))
	                document.getElementById("erroValidacaoNome").classList.add("hide");
	        }
	        return valido;
	    }
	    const mudar = () => {
			
			    window.location.href ='http://localhost:8080/agenda-acme/login.jsp';
		    
		}
    </script>
</body>
</html>