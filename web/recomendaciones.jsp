<%@page import="java.util.Scanner"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Filmly</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<!--[if IE 6]><link rel="stylesheet" href="css/ie6.css" type="text/css" media="all" /><![endif]-->
</head>
<body>
<!-- START PAGE SOURCE -->
<%@page import="FilmlyWeb.Controlador.Controlador" %>
<%@page import="java.io.*" %>
<%@page import="java.net.*" %>

<% String nombre = Controlador.getInstancia().getUsuarioLogueado().getNombre(); 
   String poster = null;
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
              <p><%= "Bienvenido " + nombre %> </p>
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
  <!--<div id="main">
    <div id="content">
              <div class="box">
                 <%
                    try{
                        URL url = new URL("http://www.imdbapi.com/?i=&t=the+batman+vs.+dracula");
                        BufferedReader in = new BufferedReader(
                        new InputStreamReader(url.openStream()));

                        Scanner scanner = new Scanner(in.readLine());
                        scanner.useDelimiter(",");
                        
                        while( scanner.hasNext() ){
                            poster = scanner.next();
                        
                            if( poster.contains("\"Poster\"") ){
                                Scanner scanner2 = new Scanner(poster);
                                scanner2.useDelimiter("\"");
                                poster = scanner2.next();
                                poster = scanner2.next();
                                poster = scanner2.next();
                                break;
                            }
                        }
                        
                        
                        }catch(Exception ex){}
                    %>
                    <img src="<%=poster %>" alt=""></img>
              </div>
    </div>-->

    <div align="center" id="sub-navigation">
        <br>
        <table border="0" align="center">
            <tr>
                <td>
                    <tr>
                        <th COLSPAN="2">
                        Celda de dos columnas
                        </th>
                    </tr>
                    <tr>
                        <td ROWSPAN="2">
                        Celda de dos filas
                        </td>
                        <td>
                        Fila2,Columna2
                        </td>
                    </tr>
                    <tr>
                        <td>
                        Fila3,Columna2
                        </td>
                    </tr>
                </td>
                <td>
                    dato 2
                </td>
            </tr>
            <tr>
                <td>
                    dato 3
                </td>
                <td>
                    dato 4
                </td>
            </tr>
            <tr>
                <td>
                    dato 5
                </td>
                <td>
                    dato 6
                </td>
            </tr>
            <tr>
                <td>
                    dato 7
                </td>
                <td>
                    dato 8
                </td>
            </tr>
            <tr>
                <td>
                    dato 9
                </td>
                <td>
                    dato 10
                </td>
            </tr>

        </table>
    </div>
   
  <div id="footer">
    <p class="lf">Copyright &copy; 2010 <a href="#">SiteName</a> - All Rights Reserved</p>
    <p class="rf"><a href="http://www.free-css.com/">Free CSS Templates</a> by <a href="http://chocotemplates.com/">ChocoTemplates.com</a></p>
    <div style="clear:both;"></div>
  </div>
</div>
<!-- END PAGE SOURCE -->
</body>
</html>
