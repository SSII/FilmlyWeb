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
        <link href='http://fonts.googleapis.com/css?family=Baumans' rel='stylesheet' type='text/css'>
        <!--[if IE 6]><link rel="stylesheet" href="css/ie6.css" type="text/css" media="all" /><![endif]-->
        <link rel="stylesheet" type="text/css" href="css/style.autocomplete.css" />
        <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
        <script src="js/jquery.autocomplete.js"></script>
        <script>
            jQuery(function() {
                $("#cajaBusqueda").autocomplete("busqueda.jsp");
            });
        </script> 

    </head>
    <body>

        <%  int idPelicula = Integer.parseInt(request.getParameter("id"));
            Pelicula p = Controlador.getInstancia().getPelicula(idPelicula);
            DetallesPelicula detalles = Controlador.getInstancia().getDetallesPelicula(p);
        %>

        <div id="shell">
            <div id="header">

                <% if (Controlador.getInstancia().getUsuarioLogueado() != null) {
                        String nombre = Controlador.getInstancia().getUsuarioLogueado().getNombre();
                %>

                <h1 id="logo"><a href="home.jsp">Filmly</a></h1>

                <div id="navigation-home">
                    <ul>
                        <li style="display: table-cell; padding-right: 10px; font-weight: 700 ">
                            <p><%= "Bienvenido " + nombre%> </p>
                        </li>
                        <li style="display: table-cell">
                            <a href="logout.jsp" style="color: #db2929">Cerrar sesión</a>
                        </li>

                    </ul>
                </div>



                <% } else { %>

                <h1 id="logo"><a href="index.jsp">Filmly</a></h1>

                <div id="navigation">
                    <ul>
                        <form action="login.jsp" method="post" accept-charset="utf-8">
                            <li>
                                <div id="cssUsuarios">
                                    <input type="text" name="CajaUsuario"  value="Usuario" id="search-field" class="blink search-field" 
                                           style="border:0px; height:21px; width:130px; font-size:15px; color:#9c9c9c" 
                                           onfocus="if (this.value == 'Usuario') {
                                                       this.value = '';
                                                       this.style.color = '#000000';
                                                   }" 
                                           onblur="if (this.value == '') {
                                                       this.value = 'Usuario';
                                                       this.style.color = '#9c9c9c'
                                                   }"  />
                                </div>
                            </li>
                            <div id="cssPassword">
                                <input type="text" name="CajaPass" id="search-field" value="Contraseña" class="blink search-field" 
                                       style="border:0px; height:21px; width:130px; font-size:15px; color:#9c9c9c" 
                                       onfocus="if (this.value == 'Contraseña') {
                                                   this.type = 'password';
                                                   this.value = '';
                                                   this.style.color = '#000000';
                                               }" 
                                       onblur="if (this.value == '') {
                                                   this.type = 'text';
                                                   this.value = 'Contraseña';
                                                   this.style.color = '#9c9c9c'
                                               }"/>
                            </div>
                            <li>
                                <div id="cssLogin">
                                    <input type="submit" name="BotonLogin" value="Login" class="botonLogin"  />

                                </div>
                            </li>
                        </form>



                        <li>
                            <div id="cssRegistro">
                                <a href="registro.jsp">Regístrate</a>
                            </div>
                        </li>

                    </ul>
                </div>

                <% }%>
                <div id="cssBusqueda">
                    <div id="search">
                        <form action="devuelvePelicula.jsp" method="get" accept-charset="utf-8">
                            <input type="text" id="cajaBusqueda" name="busqueda"  value="Busca una película..." class="blink search-field" 
                                   onfocus="if (this.value == 'Busca una película...') {
                                               this.value = '';
                                               this.style.color = '#000000';
                                           }" 
                                   onblur="if (this.value == '') {
                                               this.value = 'Busca una película...';
                                               this.style.color = '#9c9c9c'
                                           }" />
                        </form>
                    </div>
                </div>

                <% if (Controlador.getInstancia().getUsuarioLogueado() != null) { %>

                <ul class="dashboard">
                    <li><a href="recomendaciones.jsp?index=0">MIS RECOMENDACIONES</a></li>
                    <li><a href="#">MIS VALORACIONES</a></li>
                    <li><a href="mejorValoradas.jsp?index=0">MEJOR VALORADAS</a></li>
                    <li><a href="masComentadas.jsp?index=0">MÁS COMENTADAS</a></li>
                    <li><a href="novedades.jsp?index=0">NOVEDADES</a></li>
                </ul>

                <% } else { %>

                <ul class="dashboard">
                    <li><a href="mejorValoradas.jsp?index=0">MEJOR VALORADAS</a></li>
                    <li><a href="masComentadas.jsp?index=0">MÁS COMENTADAS</a></li>
                    <li><a href="novedades.jsp?index=0">NOVEDADES</a></li>
                </ul>

                <% }%>

            </div>

            <div id="main">
                <div id="content">

                    <!--Lista de peliculas -->    

                    <div align="center" id="sub-navigation">
                        <table  border="0" style="padding-top: 35px; padding-left: 35px;">
                            <tr>
                                <td rowspan="7" align="center"> <img height="300" width="auto" src="<%= detalles.getPoster()%>"/> </td>

                                <td width="400" class="titulo-ficha" > <%= detalles.getTitulo()%> (<%= detalles.getAnho()%>) </td>

                                <td width="200" rowspan="6" align="center"> 

                                    <% if (p.getMedia() < 2.0) { %>
                                    <div class="puntuacion rojo">
                                        <% } else { %>
                                        <% if (p.getMedia() < 3.0) { %>
                                        <div class="puntuacion naranja">
                                            <% } else { %>
                                            <% if (p.getMedia() < 4.0) { %>
                                            <div class="puntuacion amarillo">
                                                <% } else { %>
                                                <% if (p.getMedia() < 5.0) { %>
                                                <div class="puntuacion verde">
                                                    <% } else { %>
                                                    <div class="puntuacion azul">
                                                        <% }
                                                                    }
                                                                }
                                                            }%>

                                                        <div style="padding-right: 10px" class="valor-puntuacion decimal">
                                                            <%= p.getMedia()%>
                                                        </div>
                                                    </div>

                                                    <p> <%= p.getValoraciones().size()%> votos </p>

                                                    <% if (Controlador.getInstancia().getUsuarioLogueado() == null) { %>

                                                    <p> Identifícate o <a href="registro.jsp">regístrate</a></p>
                                                    <p> para valorar la película </p>

                                                    <% } else { %>

                                                    <br/>
                                                    
                                                    <% if( !Controlador.getInstancia().getUsuarioLogueado().getPeliculasValoradas().contains( Controlador.getInstancia().getPelicula(idPelicula ))){ %>
                                                    <p> Valora la película </p>
                                                    <div style="position: relative; top: 0px; left: 60px;">
                                                        <ul class="rating">
                                                            <li class="one"><a href="emitirValoracion.jsp?rate=1&idPelicula=<%=idPelicula%>"></a></li>
                                                            <li class="two"><a href="emitirValoracion.jsp?rate=2&idPelicula=<%=idPelicula%>"></a></li>
                                                            <li class="three"><a href="emitirValoracion.jsp?rate=3&idPelicula=<%=idPelicula%>"></a></li>
                                                            <li class="four"><a href="emitirValoracion.jsp?rate=4&idPelicula=<%=idPelicula%>"></a></li>
                                                            <li class="five"><a href="emitirValoracion.jsp?rate=5&idPelicula=<%=idPelicula%>"></a></li>
                                                        </ul>
                                                    </div>
                                                    <% } else{  %>
                                                    
                                                    <p> Ya has valorado esta película </p>
                                                    <% } %>
                                                    

                                                    <% }%>

                                                    </td>

                                                    </tr>

                                                    <tr>
                                                        <td style="font-size: 20px; color: #787878; padding-left: 10px;"> <b>Duración: </b> <%= detalles.getDuracion()%> </td>
                                                    </tr>

                                                    <tr>
                                                        <td style="font-size: 18px; color: #787878; padding-left: 10px;"> <b>Géneros: </b> <%= detalles.getGenero()%> </td>
                                                    </tr>

                                                    <tr>
                                                        <td style="font-size: 18px; color: #787878; padding-left: 10px;"> <b>Director: </b> <%= detalles.getDirector()%> </td>
                                                    </tr>

                                                    <tr>
                                                        <td style="font-size: 18px; color: #787878; padding-left: 10px; max-width: 5px"> <b>Actores: </b> <%= detalles.getActores()%> </td>
                                                    </tr>

                                                    <tr>
                                                        <td style="font-size: 18px; color: #787878; padding-left: 10px;"> <b>Guionistas: </b> <%= detalles.getGuionistas()%> </td>
                                                    </tr>

                                                    <tr>
                                                        <td colspan="2" style="font-size: 18px; color: #787878; padding-left: 10px;">  <b>Descripción: </b> <%= detalles.getDescipcion()%> </td>
                                                    </tr>

                                                    </table>





                                                </div>


                                                
                                            </div>
                                        </div>
                                    </div>
                                    <div id="footer">
                                                    <p class="lf">Copyright &copy; 2013 <a href="#">Filmly</a> - All Rights Reserved</p>
                                                    <div style="clear:both;"></div>
                                                </div>                

                                    </body>
                                    </html>
