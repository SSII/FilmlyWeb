<%-- 
    Document   : AnadirUsuario
    Created on : 15-dic-2013, 13:31:34
    Author     : Pedro
--%>

<%@page import="FilmlyWeb.Vista.MD5"%>
<%@page import="FilmlyWeb.Controlador.Controlador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% if( !request.getParameter("name").equals("Nombre y apellidos") &&
            !request.getParameter("username").equals("Nombre de usuario")  &&
            !request.getParameter("password").equals("Contraseña") &&
            !request.getParameter("email").equals("Correo electrónico") ) {
            
            Controlador.getInstancia().anadirUsuario(request.getParameter("name"),request.getParameter("username"), MD5.cifrar( request.getParameter("password") ), request.getParameter("email"));
        
            response.sendRedirect("home.jsp");
        } else {
           response.sendRedirect("registro.jsp");
        }       %>
    </body>
</html>
