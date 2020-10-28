
<%@page import="java.sql.*"%>
<%@page import="config.Conexao"%>
<%@page import="com.mysql.jdbc.Driver"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/codigo.css" rel="stylesheet">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>
            <%     
                Statement st = null;
                ResultSet rs = null;
             %>
    <body>
            <div class = "container">
	<div class="wrapper">
		<form class="form-signin">       
		    <h3 class="form-signin-heading">Login</h3>
			  <hr class="colorgraph"><br>
			  
			  <input type="text" class="form-control" name="usuario" placeholder="Digite seu email" required="" autofocus="" />
			  <input type="text" class="form-control" name="senha" placeholder="Digite sua senha" required=""/>     		  
			 
			  <button class="btn btn-lg btn-primary btn-block"  name="Submit" value="Login" type="Submit">Login</button>  
                          
                          <%
                          String user = request.getParameter("usuario"); 
                          String pass = request.getParameter("senha"); 
                          String nomeUsuario = "";
                          String usuario = "";
                          String senha = "";
                          
                          int i = 0;


                          try{
                          st = new Conexao().conectar().createStatement();
                          rs = st.executeQuery("SELECT * FROM usuarios WHERE email = '"+user+"' and senha= '"+pass+"'");
                          while (rs.next()){
                             usuario = rs.getString(3);
                             senha = rs.getString(4);
                             nomeUsuario = rs.getString(2);
                             rs.last();
                             i = rs.getRow();
                          }
                          } catch (Exception e){
                              out.println(e);
                          }
                          
                          if((user == null) || (pass == null)){
                              out.println("Preencha os dados");
                          } else{
                              if(i>0){
                                  session.setAttribute("nomeUsuario", nomeUsuario);
                                  response.sendRedirect("usuarios.jsp");
                              }
                          }
                        %>
                </form>
	</div>               
</div>
   
    </body>
</html>
