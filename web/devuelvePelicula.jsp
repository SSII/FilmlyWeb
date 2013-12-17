<%-- 
    Document   : devuelvePelicula
    Created on : 17-dic-2013, 12:09:22
    Author     : Graciano
--%>

<%@page import="FilmlyWeb.Controlador.Controlador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
   <%
       String titulo = (String)request.getParameter("busqueda").subSequence(0, request.getParameter("busqueda").length() - 7);
       String id = String.valueOf(Controlador.getInstancia().getPelicula(titulo).getId());
       
       response.sendRedirect("perfilPelicula.jsp?id=" +id);
 
    %>
