<%-- 
    Document   : perfilPelicula
    Created on : 15-dic-2013, 13:36:19
    Author     : Pedro
--%>

<%@page import="FilmlyWeb.Modelo.Pelicula"%>
<%@page import="FilmlyWeb.Modelo.DetallesPelicula"%>
<%@page import="FilmlyWeb.Controlador.Controlador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Filmly</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
        <!--[if IE 6]><link rel="stylesheet" href="css/ie6.css" type="text/css" media="all" /><![endif]-->
    </head>
    <body>
  
        <%  int idPelicula = Integer.parseInt( request.getParameter("id") );
            Pelicula p = Controlador.getInstancia().getPelicula(idPelicula);
            DetallesPelicula detalles = Controlador.getInstancia().getDetallesPelicula(p);    
            %>
            
        <div id="shell">
            <div id="header">
                <h1 id="logo"><a href="home.jsp">MovieHunter</a></h1>
                <div class="social"> <span>Síguenos en:</span>
                    <ul>
                        <li><a class="twitter" href="#">twitter</a></li>
                        <li><a class="facebook" href="#">facebook</a></li>
                        <li><a class="vimeo" href="#">vimeo</a></li>
                        <li><a class="rss" href="#">rss</a></li>
                    </ul>
                </div>
                <div id="navigation">
                    <ul>
                        <li>
                            <p><%= "Bienvenido "%> </p>
                        </li>
                        <li>
                            <a href="logout.jsp">Cerrar sesión</a>
                        </li>

                    </ul>
                </div>

                <div id="cssBusqueda">
                    <div id="search">
                        <form action="#" method="get" accept-charset="utf-8">
                            <input type="text" name="search field" value="Busca película..." id="search-field" class="blink search-field"  />
                        </form>
                    </div>


                </div>

                <div id="sub-navigation">
                    <ul>
                        <li><a href="#">Mis recomendaciones</a></li>
                        <li><a href="#">Mis valoraciones</a></li>
                        <li><a href="#">Mejor valoradas</a></li>
                        <li><a href="#">Más comentadas</a></li>
                        <li><a href="#">Novedades</a></li>
                    </ul>
                </div>
            </div>

            <!--Lista de peliculas -->    

            <div align="center" id="sub-navigation">
                <br/>
               <table>
            <tr>
                <td rowspan="6"> <img height="300" src="<%= detalles.getPoster() %>"/> </td>
                
                <td> <%= detalles.getTitulo() %> ( <%= detalles.getAnho() %> ) </td>
                
                <td rowspan="3"> VALORACION </td>
                
            </tr>
            
            <tr>
                <td> <b>Duración: </b> <%= detalles.getDuracion() %> </td>
            </tr>
            
            <tr>
                <td> <b>Géneros: </b> <%= detalles.getGenero() %> </td>
            </tr>
            
            <tr>
                <td> <b>Director: </b> <%= detalles.getDirector() %> </td>
            </tr>
            
            <tr>
                <td> <b>Actores: </b> <%= detalles.getActores() %> </td>
            </tr>
            
            <tr>
                <td> <b>Guionistas: </b> <%= detalles.getGuionistas() %> </td>
            </tr>
                        
            <tr>
                <td colspan="2">  <b>Descripción: </b> <%= detalles.getDescipcion() %> </td>
            </tr>
              
        </table>
                   
                        
                  
            </div>


            <div id="footer">
                <p class="lf">Copyright &copy; 2010 <a href="#">SiteName</a> - All Rights Reserved</p>
                <p class="rf"><a href="http://www.free-css.com/">Free CSS Templates</a> by <a href="http://chocotemplates.com/">ChocoTemplates.com</a></p>
                <div style="clear:both;"></div>
            </div>
        </div>      
    </body>
</html>
