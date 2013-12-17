<%-- 
    Document   : emitirValoracion
    Created on : 17-dic-2013, 11:04:29
    Author     : Pedro
--%>

<%@page import="FilmlyWeb.Controlador.Controlador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            int rate = Integer.parseInt(request.getParameter("rate"));
            int idPelicula = Integer.parseInt(request.getParameter("idPelicula"));
            
            Controlador.getInstancia().anadirValoracion(rate, idPelicula);
            
            
       
            response.sendRedirect("home.jsp");
         %>

    </body>
</html>
