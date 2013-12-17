<%@page import="FilmlyWeb.Modelo.Pelicula"%>
<%@page import="FilmlyWeb.Controlador.Controlador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
 
   <%
   try{
 
       
       if (((String)request.getParameter("q")).length() > 1){
           List<Pelicula> lista = Controlador.getInstancia().buscaPelicula((String)request.getParameter("q"));
           
           for (int i=0; i<lista.size(); ++i){
               out.println(lista.get(i).getTitulo());
           }
       }
       

 
}
catch(Exception e){
e.printStackTrace();
}
 
//www.java4s.com
%>