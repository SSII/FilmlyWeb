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
        <!-- START PAGE SOURCE -->
        <%@page import="FilmlyWeb.Controlador.Controlador" %>

        <%  int offset = Integer.parseInt(request.getParameter("index"));
            List<Pelicula> novedades = Controlador.getInstancia().getPeliculasNovedosas(offset);
            List<DetallesPelicula> detalles = new LinkedList();

            for (Pelicula p : novedades) {
                detalles.add(Controlador.getInstancia().getDetallesPelicula(p));
            }
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

            <!--Lista de peliculas -->    

            <div id="main">
                <div id="content">
            <div align="center" id="sub-navigation">
                <br>
                    <table border="0" align="center" cellpadding="5" cellspacing="5">
                        <!-- Primera fila-->

                        <tr> 
                            <!-- Pelicula 1 -->
                            <td rowspan="2"> 
                                <div class="movie-list-image"> 
                                    <a href="perfilPelicula.jsp?id=<%= novedades.get(0).getId()%>" ><img src="<%= detalles.get(0).getPoster()%>" class="image-poster"/></a>
                                </div>
                            </td>
                            <td width="250px">

                                <h1 style="color: #000"><%= novedades.get(0).getTitulo() + " (" + novedades.get(0).getAnno() + ")"%></h1>

                                <% if (novedades.get(0).getMedia() == 0.0) { %>
                                <ul class="rating nostar">
                                    <% } else {
                                        if (novedades.get(0).getMedia() < 2.0) { %>
                                    <ul class="rating onestar">
                                        <% } else {
                                            if (novedades.get(0).getMedia() < 3.0) { %>
                                        <ul class="rating twostar">
                                            <% } else {
                                                if (novedades.get(0).getMedia() < 4.0) { %>
                                            <ul class="rating threestar">
                                                <% } else {
                                                    if (novedades.get(0).getMedia() < 5.0) { %>
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
                                                    <h3>Director:</h3><p><h3><%= detalles.get(0).getDirector()%></h3></p>
                                                    </td>
                                                    <td style="padding-right: 50px"/>
                                                    <td rowspan="2" style="padding-bottom: 50px">
                                                        <% if (novedades.get(0).getMedia() <= 2.0) { %>
                                                        <div class="puntuacion rojo">
                                                            <% } else {
                                                                if (novedades.get(0).getMedia() <= 3.0) { %>
                                                            <div class="puntuacion naranja">
                                                                <% } else {
                                                                    if (novedades.get(0).getMedia() <= 4.0) { %>
                                                                <div class="puntuacion amarillo">
                                                                    <% } else {
                                                                        if (novedades.get(0).getMedia() < 5.0) { %>
                                                                    <div class="puntuacion verde">
                                                                        <% } else { %>
                                                                        <div class="puntuacion azul">
                                                                            <% }
                                                                                        }
                                                                                    }
                                                                                }%>
                                                                            <div class="valor-puntuacion decimal">
                                                                                <%= novedades.get(0).getMedia()%>
                                                                            </div>
                                                                        </div>
                                                                        <div>
                                                                            <img src="css/images/comentario1.png" height="auto" width="20"/>
                                                                            <%= novedades.get(0).getValoraciones().size()%>
                                                                        </div>
                                                                        </td>

                                                                        <!-- Pelicula 2 -->
                                                                        <td style="padding-right: 20px"/>
                                                                        <td rowspan="2"> 
                                                                            <div class="movie-list-image"> 
                                                                                <a href="perfilPelicula.jsp?id=<%= novedades.get(1).getId()%>" ><img src="<%= detalles.get(1).getPoster()%>" class="image-poster"/></a>
                                                                            </div>
                                                                        </td>
                                                                        <td width="250px"><h1 style="color: #000"><%= novedades.get(1).getTitulo() + " (" + novedades.get(1).getAnno() + ")"%></h1>
                                                                                <% if (novedades.get(1).getMedia() == 0.0) { %>
                                                                            <ul class="rating nostar">
                                                                                <% } else {
                                                                                    if (novedades.get(1).getMedia() < 2.0) { %>
                                                                                <ul class="rating onestar">
                                                                                    <% } else {
                                                                                        if (novedades.get(1).getMedia() < 3.0) { %>
                                                                                    <ul class="rating twostar">
                                                                                        <% } else {
                                                                                            if (novedades.get(1).getMedia() < 4.0) { %>
                                                                                        <ul class="rating threestar">
                                                                                            <% } else {
                                                                                                if (novedades.get(1).getMedia() < 5.0) { %>
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
                                                                                                <h3>Director:</h3><p><h3><%= detalles.get(1).getDirector()%></h3></p>
                                                                                                </td>
                                                                                                <td style="padding-right: 50px"/>
                                                                                                <td rowspan="2" style="padding-bottom: 50px">
                                                                                                    <% if (novedades.get(1).getMedia() <= 2.0) { %>
                                                                                                    <div class="puntuacion rojo">
                                                                                                        <% } else {
                                                                                                            if (novedades.get(1).getMedia() <= 3.0) { %>
                                                                                                        <div class="puntuacion naranja">
                                                                                                            <% } else {
                                                                                                                if (novedades.get(1).getMedia() <= 4.0) { %>
                                                                                                            <div class="puntuacion amarillo">
                                                                                                                <% } else {
                                                                                                                    if (novedades.get(1).getMedia() < 5.0) { %>
                                                                                                                <div class="puntuacion verde">
                                                                                                                    <% } else { %>
                                                                                                                    <div class="puntuacion azul">
                                                                                                                        <% }
                                                                                                                                    }
                                                                                                                                }
                                                                                                                            }%>
                                                                                                                        <div class="valor-puntuacion decimal">
                                                                                                                            <%= novedades.get(1).getMedia()%>
                                                                                                                        </div>
                                                                                                                    </div>
                                                                                                                    <div>
                                                                                                                        <img src="css/images/comentario1.png" height="auto" width="20"/>
                                                                                                                        <%= novedades.get(1).getValoraciones().size()%>
                                                                                                                    </div>
                                                                                                                    </td>



                                                                                                                    </tr>


                                                                                                                    <!-- Segunda fila-->
                                                                                                                    <tr style="padding-right: 20px"/>
                                                                                                                    <tr> 
                                                                                                                        <!-- Pelicula 1 -->
                                                                                                                        <td rowspan="2"> 
                                                                                                                            <div class="movie-list-image"> 
                                                                                                                                <a href="perfilPelicula.jsp?id=<%= novedades.get(2).getId()%>" ><img src="<%= detalles.get(2).getPoster()%>" class="image-poster"/></a>
                                                                                                                            </div>
                                                                                                                        </td>
                                                                                                                        <td width="250px"><h1 style="color: #000"><%= novedades.get(2).getTitulo() + " (" + novedades.get(2).getAnno() + ")"%></h1>
                                                                                                                                <% if (novedades.get(2).getMedia() == 0.0) { %>
                                                                                                                            <ul class="rating nostar">
                                                                                                                                <% } else {
                                                                                                                                    if (novedades.get(2).getMedia() < 2.0) { %>
                                                                                                                                <ul class="rating onestar">
                                                                                                                                    <% } else {
                                                                                                                                        if (novedades.get(2).getMedia() < 3.0) { %>
                                                                                                                                    <ul class="rating twostar">
                                                                                                                                        <% } else {
                                                                                                                                            if (novedades.get(2).getMedia() < 4.0) { %>
                                                                                                                                        <ul class="rating threestar">
                                                                                                                                            <% } else {
                                                                                                                                                if (novedades.get(2).getMedia() < 5.0) { %>
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
                                                                                                                                                <h3>Director:</h3><p><h3><%= detalles.get(2).getDirector()%></h3></p>
                                                                                                                                                </td>
                                                                                                                                                <td style="padding-right: 50px"/>
                                                                                                                                                <td rowspan="2" style="padding-bottom: 50px">
                                                                                                                                                    <% if (novedades.get(2).getMedia() <= 2.0) { %>
                                                                                                                                                    <div class="puntuacion rojo">
                                                                                                                                                        <% } else {
                                                                                                                                                            if (novedades.get(2).getMedia() <= 3.0) { %>
                                                                                                                                                        <div class="puntuacion naranja">
                                                                                                                                                            <% } else {
                                                                                                                                                                if (novedades.get(2).getMedia() <= 4.0) { %>
                                                                                                                                                            <div class="puntuacion amarillo">
                                                                                                                                                                <% } else {
                                                                                                                                                                    if (novedades.get(2).getMedia() < 5.0) { %>
                                                                                                                                                                <div class="puntuacion verde">
                                                                                                                                                                    <% } else { %>
                                                                                                                                                                    <div class="puntuacion azul">
                                                                                                                                                                        <% }
                                                                                                                                                                                    }
                                                                                                                                                                                }
                                                                                                                                                                            }%>
                                                                                                                                                                        <div class="valor-puntuacion decimal">
                                                                                                                                                                            <%= novedades.get(2).getMedia()%>
                                                                                                                                                                        </div>
                                                                                                                                                                    </div>
                                                                                                                                                                    <div>
                                                                                                                                                                        <img src="css/images/comentario1.png" height="auto" width="20"/>
                                                                                                                                                                        <%= novedades.get(2).getValoraciones().size()%>
                                                                                                                                                                    </div>
                                                                                                                                                                    </td>

                                                                                                                                                                    <!-- Pelicula 2 -->
                                                                                                                                                                    <td style="padding-right: 20px"/>
                                                                                                                                                                    <td rowspan="2"> 
                                                                                                                                                                        <div class="movie-list-image"> 
                                                                                                                                                                            <a href="perfilPelicula.jsp?id=<%= novedades.get(3).getId()%>" ><img src="<%= detalles.get(3).getPoster()%>" class="image-poster"/></a>
                                                                                                                                                                        </div>
                                                                                                                                                                    </td>
                                                                                                                                                                    <td width="250px"><h1 style="color: #000"><%= novedades.get(3).getTitulo() + " (" + novedades.get(3).getAnno() + ")"%></h1>
                                                                                                                                                                            <% if (novedades.get(3).getMedia() == 0.0) { %>
                                                                                                                                                                        <ul class="rating nostar">
                                                                                                                                                                            <% } else {
                                                                                                                                                                                if (novedades.get(3).getMedia() < 2.0) { %>
                                                                                                                                                                            <ul class="rating onestar">
                                                                                                                                                                                <% } else {
                                                                                                                                                                                    if (novedades.get(3).getMedia() < 3.0) { %>
                                                                                                                                                                                <ul class="rating twostar">
                                                                                                                                                                                    <% } else {
                                                                                                                                                                                        if (novedades.get(3).getMedia() < 4.0) { %>
                                                                                                                                                                                    <ul class="rating threestar">
                                                                                                                                                                                        <% } else {
                                                                                                                                                                                            if (novedades.get(3).getMedia() < 5.0) { %>
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
                                                                                                                                                                                            <h3>Director:</h3><p><h3><%= detalles.get(3).getDirector()%></h3></p>
                                                                                                                                                                                            </td>
                                                                                                                                                                                            <td style="padding-right: 50px"/>
                                                                                                                                                                                            <td rowspan="2" style="padding-bottom: 50px">
                                                                                                                                                                                                <% if (novedades.get(3).getMedia() <= 2.0) { %>
                                                                                                                                                                                                <div class="puntuacion rojo">
                                                                                                                                                                                                    <% } else {
                                                                                                                                                                                                        if (novedades.get(3).getMedia() <= 3.0) { %>
                                                                                                                                                                                                    <div class="puntuacion naranja">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (novedades.get(3).getMedia() <= 4.0) { %>
                                                                                                                                                                                                        <div class="puntuacion amarillo">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (novedades.get(3).getMedia() < 5.0) { %>
                                                                                                                                                                                                        <div class="puntuacion verde">
                                                                                                                                                                                                        <% } else { %>
                                                                                                                                                                                                        <div class="puntuacion azul">
                                                                                                                                                                                                        <% }
                                                                                                                                                                                                        }
                                                                                                                                                                                                        }
                                                                                                                                                                                                        }%>
                                                                                                                                                                                                        <div class="valor-puntuacion decimal">
                                                                                                                                                                                                        <%= novedades.get(3).getMedia()%>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        <div>
                                                                                                                                                                                                        <img src="css/images/comentario1.png" height="auto" width="20"/>
                                                                                                                                                                                                        <%= novedades.get(3).getValoraciones().size()%>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </td>



                                                                                                                                                                                                        </tr>


                                                                                                                                                                                                        <!-- Tercera fila-->

                                                                                                                                                                                                        <tr style="padding-top: 20px"/>
                                                                                                                                                                                                        <tr> 
                                                                                                                                                                                                        <!-- Pelicula 1 -->
                                                                                                                                                                                                        <td rowspan="2"> 
                                                                                                                                                                                                        <div class="movie-list-image"> 
                                                                                                                                                                                                        <a href="perfilPelicula.jsp?id=<%= novedades.get(4).getId()%>" ><img src="<%= detalles.get(4).getPoster()%>" class="image-poster"/></a>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </td>
                                                                                                                                                                                                        <td width="250px"><h1 style="color: #000"><%= novedades.get(4).getTitulo() + " (" + novedades.get(4).getAnno() + ")"%></h1>
                                                                                                                                                                                                        <% if (novedades.get(4).getMedia() == 0.0) { %>
                                                                                                                                                                                                        <ul class="rating nostar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (novedades.get(4).getMedia() < 2.0) { %>
                                                                                                                                                                                                        <ul class="rating onestar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (novedades.get(4).getMedia() < 3.0) { %>
                                                                                                                                                                                                        <ul class="rating twostar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (novedades.get(4).getMedia() < 4.0) { %>
                                                                                                                                                                                                        <ul class="rating threestar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (novedades.get(4).getMedia() < 5.0) { %>
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
                                                                                                                                                                                                        <h3>Director:</h3><p><h3><%= detalles.get(4).getDirector()%></h3></p>
                                                                                                                                                                                                        </td>
                                                                                                                                                                                                        <td style="padding-right: 50px"/>
                                                                                                                                                                                                        <td rowspan="2" style="padding-bottom: 50px">
                                                                                                                                                                                                        <% if (novedades.get(4).getMedia() <= 2.0) { %>
                                                                                                                                                                                                        <div class="puntuacion rojo">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (novedades.get(4).getMedia() <= 3.0) { %>
                                                                                                                                                                                                        <div class="puntuacion naranja">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (novedades.get(4).getMedia() <= 4.0) { %>
                                                                                                                                                                                                        <div class="puntuacion amarillo">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (novedades.get(4).getMedia() < 5.0) { %>
                                                                                                                                                                                                        <div class="puntuacion verde">
                                                                                                                                                                                                        <% } else { %>
                                                                                                                                                                                                        <div class="puntuacion azul">
                                                                                                                                                                                                        <% }
                                                                                                                                                                                                        }
                                                                                                                                                                                                        }
                                                                                                                                                                                                        }%>
                                                                                                                                                                                                        <div class="valor-puntuacion decimal">
                                                                                                                                                                                                        <%= novedades.get(4).getMedia()%>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        <div>
                                                                                                                                                                                                        <img src="css/images/comentario1.png" height="auto" width="20"/>
                                                                                                                                                                                                        <%= novedades.get(4).getValoraciones().size()%>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </td>

                                                                                                                                                                                                        <!-- Pelicula 2 -->
                                                                                                                                                                                                        <td style="padding-right: 20px"/>
                                                                                                                                                                                                        <td rowspan="2"> 
                                                                                                                                                                                                        <div class="movie-list-image"> 
                                                                                                                                                                                                        <a href="perfilPelicula.jsp?id=<%= novedades.get(5).getId()%>" ><img src="<%= detalles.get(5).getPoster()%>" class="image-poster"/></a>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </td>
                                                                                                                                                                                                        <td width="250px"><h1 style="color: #000"><%= novedades.get(5).getTitulo() + " (" + novedades.get(5).getAnno() + ")"%></h1>
                                                                                                                                                                                                        <% if (novedades.get(5).getMedia() == 0.0) { %>
                                                                                                                                                                                                        <ul class="rating nostar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (novedades.get(5).getMedia() < 2.0) { %>
                                                                                                                                                                                                        <ul class="rating onestar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (novedades.get(5).getMedia() < 3.0) { %>
                                                                                                                                                                                                        <ul class="rating twostar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (novedades.get(5).getMedia() < 4.0) { %>
                                                                                                                                                                                                        <ul class="rating threestar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (novedades.get(5).getMedia() < 5.0) { %>
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
                                                                                                                                                                                                        <h3>Director:</h3><p><h3><%= detalles.get(5).getDirector()%></h3></p>
                                                                                                                                                                                                        </td>
                                                                                                                                                                                                        <td style="padding-right: 50px"/>
                                                                                                                                                                                                        <td rowspan="2" style="padding-bottom: 50px">
                                                                                                                                                                                                        <% if (novedades.get(5).getMedia() <= 2.0) { %>
                                                                                                                                                                                                        <div class="puntuacion rojo">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (novedades.get(5).getMedia() <= 3.0) { %>
                                                                                                                                                                                                        <div class="puntuacion naranja">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (novedades.get(5).getMedia() <= 4.0) { %>
                                                                                                                                                                                                        <div class="puntuacion amarillo">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (novedades.get(5).getMedia() < 5.0) { %>
                                                                                                                                                                                                        <div class="puntuacion verde">
                                                                                                                                                                                                        <% } else { %>
                                                                                                                                                                                                        <div class="puntuacion azul">
                                                                                                                                                                                                        <% }
                                                                                                                                                                                                        }
                                                                                                                                                                                                        }
                                                                                                                                                                                                        }%>
                                                                                                                                                                                                        <div class="valor-puntuacion decimal">
                                                                                                                                                                                                        <%= novedades.get(5).getMedia()%>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        <div>
                                                                                                                                                                                                        <img src="css/images/comentario1.png" height="auto" width="20"/>
                                                                                                                                                                                                        <%= novedades.get(5).getValoraciones().size()%>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </td>



                                                                                                                                                                                                        </tr>


                                                                                                                                                                                                        <!-- Cuarta fila-->

                                                                                                                                                                                                        <tr style="padding-top: 20px"/>
                                                                                                                                                                                                        <tr> 
                                                                                                                                                                                                        <!-- Pelicula 1 -->
                                                                                                                                                                                                        <td rowspan="2"> 
                                                                                                                                                                                                        <div class="movie-list-image"> 
                                                                                                                                                                                                        <a href="perfilPelicula.jsp?id=<%= novedades.get(6).getId()%>" ><img src="<%= detalles.get(6).getPoster()%>" class="image-poster"/></a>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </td>
                                                                                                                                                                                                        <td width="250px"><h1 style="color: #000"><%= novedades.get(6).getTitulo() + " (" + novedades.get(6).getAnno() + ")"%></h1>
                                                                                                                                                                                                        <% if (novedades.get(6).getMedia() == 0.0) { %>
                                                                                                                                                                                                        <ul class="rating nostar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (novedades.get(6).getMedia() < 2.0) { %>
                                                                                                                                                                                                        <ul class="rating onestar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (novedades.get(6).getMedia() < 3.0) { %>
                                                                                                                                                                                                        <ul class="rating twostar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (novedades.get(6).getMedia() < 4.0) { %>
                                                                                                                                                                                                        <ul class="rating threestar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (novedades.get(6).getMedia() < 5.0) { %>
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
                                                                                                                                                                                                        <h3>Director:</h3><p><h3><%= detalles.get(6).getDirector()%></h3></p>
                                                                                                                                                                                                        </td>
                                                                                                                                                                                                        <td style="padding-right: 50px"/>
                                                                                                                                                                                                        <td rowspan="2" style="padding-bottom: 50px">
                                                                                                                                                                                                        <% if (novedades.get(6).getMedia() <= 2.0) { %>
                                                                                                                                                                                                        <div class="puntuacion rojo">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (novedades.get(6).getMedia() <= 3.0) { %>
                                                                                                                                                                                                        <div class="puntuacion naranja">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (novedades.get(6).getMedia() <= 4.0) { %>
                                                                                                                                                                                                        <div class="puntuacion amarillo">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (novedades.get(6).getMedia() < 5.0) { %>
                                                                                                                                                                                                        <div class="puntuacion verde">
                                                                                                                                                                                                        <% } else { %>
                                                                                                                                                                                                        <div class="puntuacion azul">
                                                                                                                                                                                                        <% }
                                                                                                                                                                                                        }
                                                                                                                                                                                                        }
                                                                                                                                                                                                        }%>
                                                                                                                                                                                                        <div class="valor-puntuacion decimal">
                                                                                                                                                                                                        <%= novedades.get(6).getMedia()%>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        <div>
                                                                                                                                                                                                        <img src="css/images/comentario1.png" height="auto" width="20"/>
                                                                                                                                                                                                        <%= novedades.get(6).getValoraciones().size()%>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </td>

                                                                                                                                                                                                        <!-- Pelicula 2 -->
                                                                                                                                                                                                        <td style="padding-right: 20px"/>
                                                                                                                                                                                                        <td rowspan="2"> 
                                                                                                                                                                                                        <div class="movie-list-image"> 
                                                                                                                                                                                                        <a href="perfilPelicula.jsp?id=<%= novedades.get(7).getId()%>" ><img src="<%= detalles.get(7).getPoster()%>" class="image-poster"/></a>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </td>
                                                                                                                                                                                                        <td width="250px"><h1 style="color: #000"><%= novedades.get(7).getTitulo() + " (" + novedades.get(7).getAnno() + ")"%></h1>
                                                                                                                                                                                                        <% if (novedades.get(7).getMedia() == 0.0) { %>
                                                                                                                                                                                                        <ul class="rating nostar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (novedades.get(7).getMedia() < 2.0) { %>
                                                                                                                                                                                                        <ul class="rating onestar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (novedades.get(7).getMedia() < 3.0) { %>
                                                                                                                                                                                                        <ul class="rating twostar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (novedades.get(7).getMedia() < 4.0) { %>
                                                                                                                                                                                                        <ul class="rating threestar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (novedades.get(7).getMedia() < 5.0) { %>
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
                                                                                                                                                                                                        <h3>Director:</h3><p><h3><%= detalles.get(7).getDirector()%></h3></p>
                                                                                                                                                                                                        </td>
                                                                                                                                                                                                        <td style="padding-right: 50px"/>
                                                                                                                                                                                                        <td rowspan="2" style="padding-bottom: 50px">
                                                                                                                                                                                                        <% if (novedades.get(7).getMedia() <= 2.0) { %>
                                                                                                                                                                                                        <div class="puntuacion rojo">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (novedades.get(7).getMedia() <= 3.0) { %>
                                                                                                                                                                                                        <div class="puntuacion naranja">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (novedades.get(7).getMedia() <= 4.0) { %>
                                                                                                                                                                                                        <div class="puntuacion amarillo">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (novedades.get(7).getMedia() < 5.0) { %>
                                                                                                                                                                                                        <div class="puntuacion verde">
                                                                                                                                                                                                        <% } else { %>
                                                                                                                                                                                                        <div class="puntuacion azul">
                                                                                                                                                                                                        <% }
                                                                                                                                                                                                        }
                                                                                                                                                                                                        }
                                                                                                                                                                                                        }%>
                                                                                                                                                                                                        <div class="valor-puntuacion decimal">
                                                                                                                                                                                                        <%= novedades.get(7).getMedia()%>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        <div>
                                                                                                                                                                                                        <img src="css/images/comentario1.png" height="auto" width="20"/>
                                                                                                                                                                                                        <%= novedades.get(7).getValoraciones().size()%>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </td>



                                                                                                                                                                                                        </tr>


                                                                                                                                                                                                        <!-- Quinta fila-->

                                                                                                                                                                                                        <tr style="padding-top: 20px"/>
                                                                                                                                                                                                        <tr> 
                                                                                                                                                                                                        <!-- Pelicula 1 -->
                                                                                                                                                                                                        <td rowspan="2"> 
                                                                                                                                                                                                        <div class="movie-list-image"> 
                                                                                                                                                                                                        <a href="perfilPelicula.jsp?id=<%= novedades.get(8).getId()%>" ><img src="<%= detalles.get(8).getPoster()%>" class="image-poster"/></a>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </td>
                                                                                                                                                                                                        <td width="250px"><h1 style="color: #000"><%= novedades.get(8).getTitulo() + " (" + novedades.get(8).getAnno() + ")"%></h1>
                                                                                                                                                                                                        <% if (novedades.get(8).getMedia() == 0.0) { %>
                                                                                                                                                                                                        <ul class="rating nostar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (novedades.get(8).getMedia() < 2.0) { %>
                                                                                                                                                                                                        <ul class="rating onestar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (novedades.get(8).getMedia() < 3.0) { %>
                                                                                                                                                                                                        <ul class="rating twostar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (novedades.get(8).getMedia() < 4.0) { %>
                                                                                                                                                                                                        <ul class="rating threestar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (novedades.get(8).getMedia() < 5.0) { %>
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
                                                                                                                                                                                                        <h3>Director:</h3><p><h3><%= detalles.get(8).getDirector()%></h3></p>
                                                                                                                                                                                                        </td>
                                                                                                                                                                                                        <td style="padding-right: 50px"/>
                                                                                                                                                                                                        <td rowspan="2" style="padding-bottom: 50px">
                                                                                                                                                                                                        <% if (novedades.get(8).getMedia() <= 2.0) { %>
                                                                                                                                                                                                        <div class="puntuacion rojo">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (novedades.get(8).getMedia() <= 3.0) { %>
                                                                                                                                                                                                        <div class="puntuacion naranja">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (novedades.get(8).getMedia() <= 4.0) { %>
                                                                                                                                                                                                        <div class="puntuacion amarillo">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (novedades.get(8).getMedia() < 5.0) { %>
                                                                                                                                                                                                        <div class="puntuacion verde">
                                                                                                                                                                                                        <% } else { %>
                                                                                                                                                                                                        <div class="puntuacion azul">
                                                                                                                                                                                                        <% }
                                                                                                                                                                                                        }
                                                                                                                                                                                                        }
                                                                                                                                                                                                        }%>
                                                                                                                                                                                                        <div class="valor-puntuacion decimal">
                                                                                                                                                                                                        <%= novedades.get(8).getMedia()%>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        <div>
                                                                                                                                                                                                        <img src="css/images/comentario1.png" height="auto" width="20"/>
                                                                                                                                                                                                        <%= novedades.get(8).getValoraciones().size()%>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </td>

                                                                                                                                                                                                        <!-- Pelicula 2 -->
                                                                                                                                                                                                        <td style="padding-right: 20px"/>
                                                                                                                                                                                                        <td rowspan="2"> 
                                                                                                                                                                                                        <div class="movie-list-image"> 
                                                                                                                                                                                                        <a href="perfilPelicula.jsp?id=<%= novedades.get(9).getId()%>" ><img src="<%= detalles.get(9).getPoster()%>" class="image-poster"/></a>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </td>
                                                                                                                                                                                                        <td width="250px"><h1 style="color: #000"><%= novedades.get(9).getTitulo() + " (" + novedades.get(9).getAnno() + ")"%></h1>
                                                                                                                                                                                                        <% if (novedades.get(9).getMedia() == 0.0) { %>
                                                                                                                                                                                                        <ul class="rating nostar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (novedades.get(9).getMedia() < 2.0) { %>
                                                                                                                                                                                                        <ul class="rating onestar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (novedades.get(9).getMedia() < 3.0) { %>
                                                                                                                                                                                                        <ul class="rating twostar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (novedades.get(9).getMedia() < 4.0) { %>
                                                                                                                                                                                                        <ul class="rating threestar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (novedades.get(9).getMedia() < 5.0) { %>
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
                                                                                                                                                                                                        <h3>Director:</h3><p><h3><%= detalles.get(9).getDirector()%></h3></p>
                                                                                                                                                                                                        </td>
                                                                                                                                                                                                        <td style="padding-right: 50px"/>
                                                                                                                                                                                                        <td rowspan="2" style="padding-bottom: 50px">
                                                                                                                                                                                                        <% if (novedades.get(9).getMedia() <= 2.0) { %>
                                                                                                                                                                                                        <div class="puntuacion rojo">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (novedades.get(9).getMedia() <= 3.0) { %>
                                                                                                                                                                                                        <div class="puntuacion naranja">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (novedades.get(9).getMedia() <= 4.0) { %>
                                                                                                                                                                                                        <div class="puntuacion amarillo">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (novedades.get(9).getMedia() < 5.0) { %>
                                                                                                                                                                                                        <div class="puntuacion verde">
                                                                                                                                                                                                        <% } else { %>
                                                                                                                                                                                                        <div class="puntuacion azul">
                                                                                                                                                                                                        <% }
                                                                                                                                                                                                        }
                                                                                                                                                                                                        }
                                                                                                                                                                                                        }%>
                                                                                                                                                                                                        <div class="valor-puntuacion decimal">
                                                                                                                                                                                                        <%= novedades.get(9).getMedia()%>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        <div>
                                                                                                                                                                                                        <img src="css/images/comentario1.png" height="auto" width="20"/>
                                                                                                                                                                                                        <%= novedades.get(9).getValoraciones().size()%>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </td>



                                                                                                                                                                                                        </tr>
                                                                                                                                                                                                        </table>

                                                                                                                                                                                                        <br/>
                                                                                                                                                                                                        <p>                        
                                                                                                                                                                                                        <a style="padding-right: 15px" href="novedades.jsp?index=<%
                                                                                                                                                                                                        if (request.getParameter("index").equals("0") || request.getParameter("index").equals("9")) {
                                                                                                                                                                                                        out.println(0);
                                                                                                                                                                                                        } else {
                                                                                                                                                                                                        out.println(Integer.parseInt(request.getParameter("index")) - 10);
                                                                                                                                                                                                        }%> "> Ver anteriores </a>
                                                                                                                                                                                                        <a href="novedades.jsp?index=<%
                                                                                                                                                                                                        if (request.getParameter("index").equals("0")) {
                                                                                                                                                                                                        out.println(9);
                                                                                                                                                                                                        } else {
                                                                                                                                                                                                        out.println(Integer.parseInt(request.getParameter("index")) + 10);
                                                                                                                                                                                                        }%>"> Ver siguientes </a>
                                                                                                                                                                                                        </p>
                                                                                                                                                                                                        </div>


                                                                                                                                                                                                        <div id="footer">
                                                                                                                                                                                                        <p class="lf">Copyright &copy; 2010 <a href="#">SiteName</a> - All Rights Reserved</p>
                                                                                                                                                                                                        <p class="rf"><a href="http://www.free-css.com/">Free CSS Templates</a> by <a href="http://chocotemplates.com/">ChocoTemplates.com</a></p>
                                                                                                                                                                                                        <div style="clear:both;"></div>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        
                                                                                                                                                                                                        <!-- END PAGE SOURCE -->
                                                                                                                                                                                                        </body>
                                                                                                                                                                                                        </html>
