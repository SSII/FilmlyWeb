<%@page import="FilmlyWeb.Modelo.DetallesPelicula"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.List"%>
<%@page import="FilmlyWeb.Modelo.Pelicula"%>
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

        <%  String nombre = Controlador.getInstancia().getUsuarioLogueado().getNombre();
            int offset = Integer.parseInt( request.getParameter("index") );
            List<Pelicula> masValoradas = Controlador.getInstancia().getPeliculasMasValoradas(offset);
            List<DetallesPelicula> detalles = new LinkedList();

            for (Pelicula p : masValoradas) {
                detalles.add(Controlador.getInstancia().getDetallesPelicula(p));
            }
        %>


        <div id="shell">
            <div id="header">
                <h1 id="logo"><a href="home.jsp">MovieHunter</a></h1>
                <div class="social"> <span>S�guenos en:</span>
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
                            <p><%= "Bienvenido " + nombre%> </p>
                        </li>
                        <li>
                            <a href="logout.jsp">Cerrar sesi�n</a>
                        </li>

                    </ul>
                </div>

                <div id="cssBusqueda">
                    <div id="search">
                        <form action="#" method="get" accept-charset="utf-8">
                            <input type="text" name="search field" value="Busca pel�cula..." id="search-field" class="blink search-field"  />
                        </form>
                    </div>


                </div>

                <div id="sub-navigation">
                    <ul>
                        <li><a href="#">Mis recomendaciones</a></li>
                        <li><a href="#">Mis valoraciones</a></li>
                        <li><a href="#">Mejor valoradas</a></li>
                        <li><a href="#">M�s comentadas</a></li>
                        <li><a href="#">Novedades</a></li>
                    </ul>
                </div>
            </div>

            <!--Lista de peliculas -->    

            <div align="center" id="sub-navigation">
                <br>
                    <table border="0" align="center" cellpadding="5" cellspacing="5">
                        <!-- Primera fila-->

                        <tr> 
                            <!-- Pelicula 1 -->
                            <td rowspan="2"> 
                                <div class="movie-list-image"> 
                                    <a href="perfilPelicula.jsp?id=<%= masValoradas.get(0).getId() %>" ><img src="<%= detalles.get(0).getPoster()%>"/></a>
                                </div>
                            </td>
                                 <td width="250px">
                                     
                                     <h1><%= masValoradas.get(0).getTitulo() + " (" + masValoradas.get(0).getAnno() + ")" %></h1>
                                                
                                <% if( masValoradas.get(0).getMedia() ==  0.0 ) { %>
                                    <ul class="rating nostar">
                                <% } else {
                                   if( masValoradas.get(0).getMedia() <  2.0 ) { %>
                                    <ul class="rating onestar">
                                <% } else {
                                    if( masValoradas.get(0).getMedia() <  3.0 ) { %>
                                        <ul class="rating twostar">
                                    <% } else {
                                        if( masValoradas.get(0).getMedia() <  4.0 ) { %>
                                            <ul class="rating threestar">
                                        <% } else { 
                                            if( masValoradas.get(0).getMedia() <  5.0 ) { %>
                                                <ul class="rating fourstar">
                                            <% } else { %>
                                                <ul class="rating fivestar">
                                            <% }
                                        }
                                    }
                                }
                                }%>
                                    <li class="one"></li>
                                    <li class="two"></li>
                                    <li class="three"></li>
                                    <li class="four"></li>
                                    <li class="five"></li>
                                </ul>
                                <br/>
                                <br/>
                                <br/>
                                <h3>Director:</h3><p><h3><%= detalles.get(0).getDirector() %></h3></p>
                            </td>
                            <td style="padding-right: 50px"/>
                            <td rowspan="2" style="padding-bottom: 50px">
                                <% if( masValoradas.get(0).getMedia() <=  2.0 ) { %>
                                    <div class="puntuacion rojo">
                                <% } else {
                                    if( masValoradas.get(0).getMedia() <=  3.0 ) { %>
                                        <div class="puntuacion naranja">
                                    <% } else {
                                        if( masValoradas.get(0).getMedia() <=  4.0 ) { %>
                                            <div class="puntuacion amarillo">
                                        <% } else { 
                                            if( masValoradas.get(0).getMedia() <=  5.0 ) { %>
                                                <div class="puntuacion verde">
                                            <% } else { %>
                                                <div class="puntuacion azul">
                                            <% }
                                        }
                                    }
                                }%>
                                    <div class="valor-puntuacion decimal">
                                        <%= masValoradas.get(0).getMedia() %>
                                    </div>
                                </div>
                                <div>
                                    <img src="css/images/comentario1.png" height="auto" width="20"/>
                                    <%= masValoradas.get(0).getValoraciones().size() %>
                                </div>
                            </td>

                            <!-- Pelicula 2 -->
                            <td style="padding-right: 20px"/>
                            <td rowspan="2"> 
                                <div class="movie-list-image"> 
                                    <a href="perfilPelicula.jsp?id=<%= masValoradas.get(1).getId() %>" ><img src="<%= detalles.get(1).getPoster()%>"/></a>
                                </div>
                            </td>
                            <td width="250px"><h1><%= masValoradas.get(1).getTitulo() + " (" + masValoradas.get(1).getAnno() + ")" %></h1>
                                <% if( masValoradas.get(1).getMedia() ==  0.0 ) { %>
                                    <ul class="rating nostar">
                                <% } else {
                                   if( masValoradas.get(1).getMedia() <  2.0 ) { %>
                                    <ul class="rating onestar">
                                <% } else {
                                    if( masValoradas.get(1).getMedia() <  3.0 ) { %>
                                        <ul class="rating twostar">
                                    <% } else {
                                        if( masValoradas.get(1).getMedia() <  4.0 ) { %>
                                            <ul class="rating threestar">
                                        <% } else { 
                                            if( masValoradas.get(1).getMedia() <  5.0 ) { %>
                                                <ul class="rating fourstar">
                                            <% } else { %>
                                                <ul class="rating fivestar">
                                            <% }
                                        }
                                    }
                                }
                                }%>
                                    <li class="one"></li>
                                    <li class="two"></li>
                                    <li class="three"></li>
                                    <li class="four"></li>
                                    <li class="five"></li>
                                </ul>
                                <br/>
                                <br/>
                                <br/>
                                <h3>Director:</h3><p><h3><%= detalles.get(1).getDirector() %></h3></p>
                            </td>
                            <td style="padding-right: 50px"/>
                            <td rowspan="2" style="padding-bottom: 50px">
                                <% if( masValoradas.get(1).getMedia() <=  2.0 ) { %>
                                    <div class="puntuacion rojo">
                                <% } else {
                                    if( masValoradas.get(1).getMedia() <=  3.0 ) { %>
                                        <div class="puntuacion naranja">
                                    <% } else {
                                        if( masValoradas.get(1).getMedia() <=  4.0 ) { %>
                                            <div class="puntuacion amarillo">
                                        <% } else { 
                                            if( masValoradas.get(1).getMedia() <=  5.0 ) { %>
                                                <div class="puntuacion verde">
                                            <% } else { %>
                                                <div class="puntuacion azul">
                                            <% }
                                        }
                                    }
                                }%>
                                    <div class="valor-puntuacion decimal">
                                        <%= masValoradas.get(1).getMedia() %>
                                    </div>
                                </div>
                                <div>
                                    <img src="css/images/comentario1.png" height="auto" width="20"/>
                                    <%= masValoradas.get(1).getValoraciones().size() %>
                                </div>
                            </td>



                        </tr>


                        <!-- Segunda fila-->
                        <tr style="padding-right: 20px"/>
                        <tr> 
                            <!-- Pelicula 1 -->
                            <td rowspan="2"> 
                                <div class="movie-list-image"> 
                                    <a href="perfilPelicula.jsp?id=<%= masValoradas.get(2).getId() %>" ><img src="<%= detalles.get(2).getPoster()%>"/></a>
                                </div>
                            </td>
                            <td width="250px"><h1><%= masValoradas.get(2).getTitulo() + " (" + masValoradas.get(2).getAnno() + ")" %></h1>
                                <% if( masValoradas.get(2).getMedia() ==  0.0 ) { %>
                                    <ul class="rating nostar">
                                <% } else {
                                   if( masValoradas.get(2).getMedia() <  2.0 ) { %>
                                    <ul class="rating onestar">
                                <% } else {
                                    if( masValoradas.get(2).getMedia() <  3.0 ) { %>
                                        <ul class="rating twostar">
                                    <% } else {
                                        if( masValoradas.get(2).getMedia() <  4.0 ) { %>
                                            <ul class="rating threestar">
                                        <% } else { 
                                            if( masValoradas.get(2).getMedia() <  5.0 ) { %>
                                                <ul class="rating fourstar">
                                            <% } else { %>
                                                <ul class="rating fivestar">
                                            <% }
                                        }
                                    }
                                }
                                }%>
                                    <li class="one"></li>
                                    <li class="two"></li>
                                    <li class="three"></li>
                                    <li class="four"></li>
                                    <li class="five"></li>
                                </ul>
                                <br/>
                                <br/>
                                <br/>
                                <h3>Director:</h3><p><h3><%= detalles.get(2).getDirector() %></h3></p>
                            </td>
                            <td style="padding-right: 50px"/>
                            <td rowspan="2" style="padding-bottom: 50px">
                               <% if( masValoradas.get(2).getMedia() <=  2.0 ) { %>
                                    <div class="puntuacion rojo">
                                <% } else {
                                    if( masValoradas.get(2).getMedia() <=  3.0 ) { %>
                                        <div class="puntuacion naranja">
                                    <% } else {
                                        if( masValoradas.get(2).getMedia() <=  4.0 ) { %>
                                            <div class="puntuacion amarillo">
                                        <% } else { 
                                            if( masValoradas.get(2).getMedia() <=  5.0 ) { %>
                                                <div class="puntuacion verde">
                                            <% } else { %>
                                                <div class="puntuacion azul">
                                            <% }
                                        }
                                    }
                                }%>
                                    <div class="valor-puntuacion decimal">
                                        <%= masValoradas.get(2).getMedia() %>
                                    </div>
                                </div>
                                <div>
                                    <img src="css/images/comentario1.png" height="auto" width="20"/>
                                    <%= masValoradas.get(2).getValoraciones().size() %>
                                </div>
                            </td>

                            <!-- Pelicula 2 -->
                            <td style="padding-right: 20px"/>
                            <td rowspan="2"> 
                                <div class="movie-list-image"> 
                                    <a href="perfilPelicula.jsp?id=<%= masValoradas.get(3).getId() %>" ><img src="<%= detalles.get(3).getPoster()%>"/></a>
                                </div>
                            </td>
                            <td width="250px"><h1><%= masValoradas.get(3).getTitulo() + " (" + masValoradas.get(3).getAnno() + ")" %></h1>
                                <% if( masValoradas.get(3).getMedia() ==  0.0 ) { %>
                                    <ul class="rating nostar">
                                <% } else {
                                   if( masValoradas.get(3).getMedia() <  2.0 ) { %>
                                    <ul class="rating onestar">
                                <% } else {
                                    if( masValoradas.get(3).getMedia() <  3.0 ) { %>
                                        <ul class="rating twostar">
                                    <% } else {
                                        if( masValoradas.get(3).getMedia() <  4.0 ) { %>
                                            <ul class="rating threestar">
                                        <% } else { 
                                            if( masValoradas.get(3).getMedia() <  5.0 ) { %>
                                                <ul class="rating fourstar">
                                            <% } else { %>
                                                <ul class="rating fivestar">
                                            <% }
                                        }
                                    }
                                }
                                }%>
                                    <li class="one"></li>
                                    <li class="two"></li>
                                    <li class="three"></li>
                                    <li class="four"></li>
                                    <li class="five"></li>
                                </ul>
                                <br/>
                                <br/>
                                <br/>
                                <h3>Director:</h3><p><h3><%= detalles.get(3).getDirector() %></h3></p>
                            </td>
                            <td style="padding-right: 50px"/>
                            <td rowspan="2" style="padding-bottom: 50px">
                                <% if( masValoradas.get(3).getMedia() <=  2.0 ) { %>
                                    <div class="puntuacion rojo">
                                <% } else {
                                    if( masValoradas.get(3).getMedia() <=  3.0 ) { %>
                                        <div class="puntuacion naranja">
                                    <% } else {
                                        if( masValoradas.get(3).getMedia() <=  4.0 ) { %>
                                            <div class="puntuacion amarillo">
                                        <% } else { 
                                            if( masValoradas.get(3).getMedia() <=  5.0 ) { %>
                                                <div class="puntuacion verde">
                                            <% } else { %>
                                                <div class="puntuacion azul">
                                            <% }
                                        }
                                    }
                                }%>
                                    <div class="valor-puntuacion decimal">
                                        <%= masValoradas.get(3).getMedia() %>
                                    </div>
                                </div>
                                <div>
                                    <img src="css/images/comentario1.png" height="auto" width="20"/>
                                    <%= masValoradas.get(3).getValoraciones().size() %>
                                </div>
                            </td>



                        </tr>


                        <!-- Tercera fila-->

                        <tr style="padding-top: 20px"/>
                        <tr> 
                            <!-- Pelicula 1 -->
                            <td rowspan="2"> 
                                <div class="movie-list-image"> 
                                    <a href="perfilPelicula.jsp?id=<%= masValoradas.get(4).getId() %>" ><img src="<%= detalles.get(4).getPoster()%>"/></a>
                                </div>
                            </td>
                            <td width="250px"><h1><%= masValoradas.get(4).getTitulo() + " (" + masValoradas.get(4).getAnno() + ")" %></h1>
                                <% if( masValoradas.get(4).getMedia() ==  0.0 ) { %>
                                    <ul class="rating nostar">
                                <% } else {
                                   if( masValoradas.get(4).getMedia() <  2.0 ) { %>
                                    <ul class="rating onestar">
                                <% } else {
                                    if( masValoradas.get(4).getMedia() <  3.0 ) { %>
                                        <ul class="rating twostar">
                                    <% } else {
                                        if( masValoradas.get(4).getMedia() <  4.0 ) { %>
                                            <ul class="rating threestar">
                                        <% } else { 
                                            if( masValoradas.get(4).getMedia() <  5.0 ) { %>
                                                <ul class="rating fourstar">
                                            <% } else { %>
                                                <ul class="rating fivestar">
                                            <% }
                                        }
                                    }
                                }
                                }%>
                                    <li class="one"></li>
                                    <li class="two"></li>
                                    <li class="three"></li>
                                    <li class="four"></li>
                                    <li class="five"></li>
                                </ul>
                                <br/>
                                <br/>
                                <br/>
                                <h3>Director:</h3><p><h3><%= detalles.get(4).getDirector() %></h3></p>
                            </td>
                            <td style="padding-right: 50px"/>
                            <td rowspan="2" style="padding-bottom: 50px">
                                   <% if( masValoradas.get(4).getMedia() <=  2.0 ) { %>
                                    <div class="puntuacion rojo">
                                <% } else {
                                    if( masValoradas.get(4).getMedia() <=  3.0 ) { %>
                                        <div class="puntuacion naranja">
                                    <% } else {
                                        if( masValoradas.get(4).getMedia() <=  4.0 ) { %>
                                            <div class="puntuacion amarillo">
                                        <% } else { 
                                            if( masValoradas.get(4).getMedia() <=  5.0 ) { %>
                                                <div class="puntuacion verde">
                                            <% } else { %>
                                                <div class="puntuacion azul">
                                            <% }
                                        }
                                    }
                                }%>
                                    <div class="valor-puntuacion decimal">
                                        <%= masValoradas.get(4).getMedia() %>
                                    </div>
                                </div>
                                </div>
                                <div>
                                    <img src="css/images/comentario1.png" height="auto" width="20"/>
                                    <%= masValoradas.get(4).getValoraciones().size() %>
                                </div>
                            </td>

                            <!-- Pelicula 2 -->
                            <td style="padding-right: 20px"/>
                            <td rowspan="2"> 
                                <div class="movie-list-image"> 
                                    <a href="perfilPelicula.jsp?id=<%= masValoradas.get(5).getId() %>" ><img src="<%= detalles.get(5).getPoster()%>"/></a>
                                </div>
                            </td>
                            <td width="250px"><h1><%= masValoradas.get(5).getTitulo() + " (" + masValoradas.get(5).getAnno() + ")" %></h1>
                                <% if( masValoradas.get(5).getMedia() ==  0.0 ) { %>
                                    <ul class="rating nostar">
                                <% } else {
                                   if( masValoradas.get(5).getMedia() <  2.0 ) { %>
                                    <ul class="rating onestar">
                                <% } else {
                                    if( masValoradas.get(5).getMedia() <  3.0 ) { %>
                                        <ul class="rating twostar">
                                    <% } else {
                                        if( masValoradas.get(5).getMedia() <  4.0 ) { %>
                                            <ul class="rating threestar">
                                        <% } else { 
                                            if( masValoradas.get(5).getMedia() <  5.0 ) { %>
                                                <ul class="rating fourstar">
                                            <% } else { %>
                                                <ul class="rating fivestar">
                                            <% }
                                        }
                                    }
                                }
                                }%>
                                    <li class="one"></li>
                                    <li class="two"></li>
                                    <li class="three"></li>
                                    <li class="four"></li>
                                    <li class="five"></li>
                                </ul>
                                <br/>
                                <br/>
                                <br/>
                                <h3>Director:</h3><p><h3><%= detalles.get(5).getDirector() %></h3></p>
                            </td>
                            <td style="padding-right: 50px"/>
                            <td rowspan="2" style="padding-bottom: 50px">
                               <% if( masValoradas.get(5).getMedia() <=  2.0 ) { %>
                                    <div class="puntuacion rojo">
                                <% } else {
                                    if( masValoradas.get(5).getMedia() <=  3.0 ) { %>
                                        <div class="puntuacion naranja">
                                    <% } else {
                                        if( masValoradas.get(5).getMedia() <=  4.0 ) { %>
                                            <div class="puntuacion amarillo">
                                        <% } else { 
                                            if( masValoradas.get(5).getMedia() <=  5.0 ) { %>
                                                <div class="puntuacion verde">
                                            <% } else { %>
                                                <div class="puntuacion azul">
                                            <% }
                                        }
                                    }
                                }%>
                                    <div class="valor-puntuacion decimal">
                                        <%= masValoradas.get(5).getMedia() %>
                                    </div>
                                </div>
                                <div>
                                    <img src="css/images/comentario1.png" height="auto" width="20"/>
                                    <%= masValoradas.get(5).getValoraciones().size() %>
                                </div>
                            </td>



                        </tr>


                        <!-- Cuarta fila-->

                        <tr style="padding-top: 20px"/>
                        <tr> 
                            <!-- Pelicula 1 -->
                            <td rowspan="2"> 
                                <div class="movie-list-image"> 
                                    <a href="perfilPelicula.jsp?id=<%= masValoradas.get(6).getId() %>" ><img src="<%= detalles.get(6).getPoster()%>"/></a>
                                </div>
                            </td>
                            <td width="250px"><h1><%= masValoradas.get(6).getTitulo() + " (" + masValoradas.get(6).getAnno() + ")" %></h1>
                                <% if( masValoradas.get(6).getMedia() ==  0.0 ) { %>
                                    <ul class="rating nostar">
                                <% } else {
                                   if( masValoradas.get(6).getMedia() <  2.0 ) { %>
                                    <ul class="rating onestar">
                                <% } else {
                                    if( masValoradas.get(6).getMedia() <  3.0 ) { %>
                                        <ul class="rating twostar">
                                    <% } else {
                                        if( masValoradas.get(6).getMedia() <  4.0 ) { %>
                                            <ul class="rating threestar">
                                        <% } else { 
                                            if( masValoradas.get(6).getMedia() <  5.0 ) { %>
                                                <ul class="rating fourstar">
                                            <% } else { %>
                                                <ul class="rating fivestar">
                                            <% }
                                        }
                                    }
                                }
                                }%>
                                    <li class="one"></li>
                                    <li class="two"></li>
                                    <li class="three"></li>
                                    <li class="four"></li>
                                    <li class="five"></li>
                                </ul>
                                <br/>
                                <br/>
                                <br/>
                                <h3>Director:</h3><p><h3><%= detalles.get(6).getDirector() %></h3></p>
                            </td>
                            <td style="padding-right: 50px"/>
                            <td rowspan="2" style="padding-bottom: 50px">
                               <% if( masValoradas.get(6).getMedia() <=  2.0 ) { %>
                                    <div class="puntuacion rojo">
                                <% } else {
                                    if( masValoradas.get(6).getMedia() <=  3.0 ) { %>
                                        <div class="puntuacion naranja">
                                    <% } else {
                                        if( masValoradas.get(6).getMedia() <=  4.0 ) { %>
                                            <div class="puntuacion amarillo">
                                        <% } else { 
                                            if( masValoradas.get(6).getMedia() <=  5.0 ) { %>
                                                <div class="puntuacion verde">
                                            <% } else { %>
                                                <div class="puntuacion azul">
                                            <% }
                                        }
                                    }
                                }%>
                                    <div class="valor-puntuacion decimal">
                                        <%= masValoradas.get(6).getMedia() %>
                                    </div>
                                </div>
                                <div>
                                    <img src="css/images/comentario1.png" height="auto" width="20"/>
                                    <%= masValoradas.get(6).getValoraciones().size() %>
                                </div>
                            </td>

                            <!-- Pelicula 2 -->
                            <td style="padding-right: 20px"/>
                            <td rowspan="2"> 
                                <div class="movie-list-image"> 
                                    <a href="perfilPelicula.jsp?id=<%= masValoradas.get(7).getId() %>" ><img src="<%= detalles.get(7).getPoster()%>"/></a>
                                </div>
                            </td>
                            <td width="250px"><h1><%= masValoradas.get(7).getTitulo() + " (" + masValoradas.get(7).getAnno() + ")" %></h1>
                                <% if( masValoradas.get(7).getMedia() ==  0.0 ) { %>
                                    <ul class="rating nostar">
                                <% } else {
                                   if( masValoradas.get(7).getMedia() <  2.0 ) { %>
                                    <ul class="rating onestar">
                                <% } else {
                                    if( masValoradas.get(7).getMedia() <  3.0 ) { %>
                                        <ul class="rating twostar">
                                    <% } else {
                                        if( masValoradas.get(7).getMedia() <  4.0 ) { %>
                                            <ul class="rating threestar">
                                        <% } else { 
                                            if( masValoradas.get(7).getMedia() <  5.0 ) { %>
                                                <ul class="rating fourstar">
                                            <% } else { %>
                                                <ul class="rating fivestar">
                                            <% }
                                        }
                                    }
                                }
                                }%>
                                    <li class="one"></li>
                                    <li class="two"></li>
                                    <li class="three"></li>
                                    <li class="four"></li>
                                    <li class="five"></li>
                                </ul>
                                <br/>
                                <br/>
                                <br/>
                                <h3>Director:</h3><p><h3><%= detalles.get(7).getDirector() %></h3></p>
                            </td>
                            <td style="padding-right: 50px"/>
                            <td rowspan="2" style="padding-bottom: 50px">
                               <% if( masValoradas.get(7).getMedia() <=  2.0 ) { %>
                                    <div class="puntuacion rojo">
                                <% } else {
                                    if( masValoradas.get(7).getMedia() <=  3.0 ) { %>
                                        <div class="puntuacion naranja">
                                    <% } else {
                                        if( masValoradas.get(7).getMedia() <=  4.0 ) { %>
                                            <div class="puntuacion amarillo">
                                        <% } else { 
                                            if( masValoradas.get(7).getMedia() <=  5.0 ) { %>
                                                <div class="puntuacion verde">
                                            <% } else { %>
                                                <div class="puntuacion azul">
                                            <% }
                                        }
                                    }
                                }%>
                                    <div class="valor-puntuacion decimal">
                                        <%= masValoradas.get(7).getMedia() %>
                                    </div>
                                </div>
                                <div>
                                    <img src="css/images/comentario1.png" height="auto" width="20"/>
                                    <%= masValoradas.get(7).getValoraciones().size() %>
                                </div>
                            </td>



                        </tr>


                        <!-- Quinta fila-->

                        <tr style="padding-top: 20px"/>
                        <tr> 
                            <!-- Pelicula 1 -->
                            <td rowspan="2"> 
                                <div class="movie-list-image"> 
                                    <a href="perfilPelicula.jsp?id=<%= masValoradas.get(8).getId() %>" ><img src="<%= detalles.get(8).getPoster()%>"/></a>
                                </div>
                            </td>
                            <td width="250px"><h1><%= masValoradas.get(8).getTitulo() + " (" + masValoradas.get(8).getAnno() + ")" %></h1>
                                <% if( masValoradas.get(8).getMedia() ==  0.0 ) { %>
                                    <ul class="rating nostar">
                                <% } else {
                                   if( masValoradas.get(8).getMedia() <  2.0 ) { %>
                                    <ul class="rating onestar">
                                <% } else {
                                    if( masValoradas.get(8).getMedia() <  3.0 ) { %>
                                        <ul class="rating twostar">
                                    <% } else {
                                        if( masValoradas.get(8).getMedia() <  4.0 ) { %>
                                            <ul class="rating threestar">
                                        <% } else { 
                                            if( masValoradas.get(8).getMedia() <  5.0 ) { %>
                                                <ul class="rating fourstar">
                                            <% } else { %>
                                                <ul class="rating fivestar">
                                            <% }
                                        }
                                    }
                                }
                                }%>
                                    <li class="one"></li>
                                    <li class="two"></li>
                                    <li class="three"></li>
                                    <li class="four"></li>
                                    <li class="five"></li>
                                </ul>
                                <br/>
                                <br/>
                                <br/>
                                <h3>Director:</h3><p><h3><%= detalles.get(8).getDirector() %></h3></p>
                            </td>
                            <td style="padding-right: 50px"/>
                            <td rowspan="2" style="padding-bottom: 50px">
                               <% if( masValoradas.get(8).getMedia() <=2.0 ) { %>
                                    <div class="puntuacion rojo">
                                <% } else {
                                    if( masValoradas.get(8).getMedia() <=3.0 ) { %>
                                        <div class="puntuacion naranja">
                                    <% } else {
                                        if( masValoradas.get(8).getMedia() <= 4.0 ) { %>
                                            <div class="puntuacion amarillo">
                                        <% } else { 
                                            if( masValoradas.get(8).getMedia() <= 5.0 ) { %>
                                                <div class="puntuacion verde">
                                            <% } else { %>
                                                <div class="puntuacion azul">
                                            <% }
                                        }
                                    }
                                }%>
                                    <div class="valor-puntuacion decimal">
                                        <%= masValoradas.get(8).getMedia() %>
                                    </div>
                                </div>
                                <div>
                                    <img src="css/images/comentario1.png" height="auto" width="20"/>
                                    <%= masValoradas.get(8).getValoraciones().size() %>
                                </div>
                            </td>

                            <!-- Pelicula 2 -->
                            <td style="padding-right: 20px"/>
                            <td rowspan="2"> 
                                <div class="movie-list-image"> 
                                    <a href="perfilPelicula.jsp?id=<%= masValoradas.get(9).getId() %>" ><img src="<%= detalles.get(9).getPoster()%>"/></a>
                                </div>
                            </td>
                            <td width="250px"><h1><%= masValoradas.get(9).getTitulo() + " (" + masValoradas.get(9).getAnno() + ")" %></h1>
                                <% if( masValoradas.get(9).getMedia() ==  0.0 ) { %>
                                    <ul class="rating nostar">
                                <% } else {
                                 if( masValoradas.get(9).getMedia() <  2.0 ) { %>
                                    <ul class="rating onestar">
                                <% } else {
                                    if( masValoradas.get(9).getMedia() <  3.0 ) { %>
                                        <ul class="rating twostar">
                                    <% } else {
                                        if( masValoradas.get(9).getMedia() <  4.0 ) { %>
                                            <ul class="rating threestar">
                                        <% } else { 
                                            if( masValoradas.get(9).getMedia() <  5.0 ) { %>
                                                <ul class="rating fourstar">
                                            <% } else { %>
                                                <ul class="rating fivestar">
                                            <% }
                                        }
                                    }
                                }
                                }%>
                                    <li class="one"></li>
                                    <li class="two"></li>
                                    <li class="three"></li>
                                    <li class="four"></li>
                                    <li class="five"></li>
                                </ul>
                                <br/>
                                <br/>
                                <br/>
                                <h3>Director:</h3><p><h3><%= detalles.get(9).getDirector() %></h3></p>
                            </td>
                            <td style="padding-right: 50px"/>
                            <td rowspan="2" style="padding-bottom: 50px">
                                <% if( masValoradas.get(9).getMedia() <=  2.0 ) { %>
                                    <div class="puntuacion rojo">
                                <% } else {
                                    if( masValoradas.get(9).getMedia() <=  3.0 ) { %>
                                        <div class="puntuacion naranja">
                                    <% } else {
                                        if( masValoradas.get(9).getMedia() <=  4.0 ) { %>
                                            <div class="puntuacion amarillo">
                                        <% } else { 
                                            if( masValoradas.get(9).getMedia() <=  5.0 ) { %>
                                                <div class="puntuacion verde">
                                            <% } else { %>
                                                <div class="puntuacion azul">
                                            <% }
                                        }
                                    }
                                }%>
                                    <div class="valor-puntuacion decimal">
                                        <%= masValoradas.get(9).getMedia() %>
                                    </div>
                                </div>
                                <div>
                                    <img src="css/images/comentario1.png" height="auto" width="20"/>
                                    <%= masValoradas.get(9).getValoraciones().size() %>
                                </div>
                            </td>



                        </tr>
                    </table>
                        
                    <br/>
                    <p>                        
                        <a style="padding-right: 15px" href="mejorValoradas.jsp?index=<% 
                            if( request.getParameter("index").equals("0") || request.getParameter("index").equals("9") ){
                                out.println(0);
                            }else{
                                out.println( Integer.parseInt(request.getParameter("index"))-10 );
                                        }%> "> Ver anteriores </a>
                        <a href="mejorValoradas.jsp?index=<% 
                            if( request.getParameter("index").equals("0") ){
                                out.println(9);
                            }else{
                                out.println( Integer.parseInt(request.getParameter("index"))+10 );
                                        }%>"> Ver siguientes </a>
                    </p>
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
