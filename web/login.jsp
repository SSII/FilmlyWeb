<%-- 
    Document   : login
    Created on : 11-dic-2013, 12:34:13
    Author     : Pedro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page import="FilmlyWeb.Controlador.Controlador" %>
        <%@page import="FilmlyWeb.Modelo.Usuario" %>
        <%@page import="FilmlyWeb.Vista.MD5" %>


        <%
            String pass = MD5.cifrar( request.getParameter("CajaPass") );
            String usuario = request.getParameter("CajaUsuario");
                       
            Controlador.getInstancia().loginUsuario(usuario, pass);
         
            Usuario u = Controlador.getInstancia().getUsuarioLogueado();
            
            if( u != null ){
                out.println("BIEEEEEEN");
            } else {
                out.println("MAAAAAL");
            }           
        %>
    </body>
</html>
