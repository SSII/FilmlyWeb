<%@page import="java.util.Map"%>
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
            List<DetallesPelicula> detalles = new LinkedList();
            List<Pelicula> recomendaciones = Controlador.getInstancia().obtenerRecomendaciones();          

            for (Pelicula p : recomendaciones) {
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
                    <li><a href="misValoraciones.jsp?index=0">MIS VALORACIONES</a></li>
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
                                    <a href="perfilPelicula.jsp?id=<%= recomendaciones.get((0+offset)%recomendaciones.size()).getId()%>" ><img src="<%= detalles.get((0+offset)%recomendaciones.size()).getPoster()%>" class="image-poster"/></a>
                                </div>
                            </td>
                            <td width="250px">

                                <h1 style="color: #000"><%= recomendaciones.get((0+offset)%recomendaciones.size()).getTitulo() + " (" + recomendaciones.get((0+offset)%recomendaciones.size()).getAnno() + ")"%></h1>

                                <% if (recomendaciones.get((0+offset)%recomendaciones.size()).getMedia() == 0.0) { %>
                                <ul class="rating nostar">
                                    <% } else {
                                        if (recomendaciones.get((0+offset)%recomendaciones.size()).getMedia() < 2.0) { %>
                                    <ul class="rating onestar">
                                        <% } else {
                                            if (recomendaciones.get((0+offset)%recomendaciones.size()).getMedia() < 3.0) { %>
                                        <ul class="rating twostar">
                                            <% } else {
                                                if (recomendaciones.get((0+offset)%recomendaciones.size()).getMedia() < 4.0) { %>
                                            <ul class="rating threestar">
                                                <% } else {
                                                    if (recomendaciones.get((0+offset)%recomendaciones.size()).getMedia() < 5.0) { %>
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
                                                    <h3>Director:</h3><p><h3><%= detalles.get((0+offset)%recomendaciones.size()).getDirector()%></h3></p>
                                                    </td>
                                                    <td style="padding-right: 50px"/>
                                                    <td rowspan="2" style="padding-bottom: 50px">
                                                        <% if (recomendaciones.get((0+offset)%recomendaciones.size()).getMedia() <= 2.0) { %>
                                                        <div class="puntuacion rojo">
                                                            <% } else {
                                                                if (recomendaciones.get((0+offset)%recomendaciones.size()).getMedia() <= 3.0) { %>
                                                            <div class="puntuacion naranja">
                                                                <% } else {
                                                                    if (recomendaciones.get((0+offset)%recomendaciones.size()).getMedia() <= 4.0) { %>
                                                                <div class="puntuacion amarillo">
                                                                    <% } else {
                                                                        if (recomendaciones.get((0+offset)%recomendaciones.size()).getMedia() < 5.0) { %>
                                                                    <div class="puntuacion verde">
                                                                        <% } else { %>
                                                                        <div class="puntuacion azul">
                                                                            <% }
                                                                                        }
                                                                                    }
                                                                                }%>
                                                                            <div class="valor-puntuacion decimal">
                                                                                <%= recomendaciones.get((0+offset)%recomendaciones.size()).getMedia()%>
                                                                            </div>
                                                                        </div>
                                                                        <div>
                                                                            <img src="css/images/comentario1.png" height="auto" width="20"/>
                                                                            <%= recomendaciones.get((0+offset)%recomendaciones.size()).getValoraciones().size()%>
                                                                        </div>
                                                                        </td>

                                                                        <!-- Pelicula 2 -->
                                                                        <td style="padding-right: 20px"/>
                                                                        <td rowspan="2"> 
                                                                            <div class="movie-list-image"> 
                                                                                <a href="perfilPelicula.jsp?id=<%= recomendaciones.get((1+offset)%recomendaciones.size()).getId()%>" ><img src="<%= detalles.get((1+offset)%recomendaciones.size()).getPoster()%>" class="image-poster"/></a>
                                                                            </div>
                                                                        </td>
                                                                        <td width="250px"><h1 style="color: #000"><%= recomendaciones.get((1+offset)%recomendaciones.size()).getTitulo() + " (" + recomendaciones.get((1+offset)%recomendaciones.size()).getAnno() + ")"%></h1>
                                                                                <% if (recomendaciones.get((1+offset)%recomendaciones.size()).getMedia() == 0.0) { %>
                                                                            <ul class="rating nostar">
                                                                                <% } else {
                                                                                    if (recomendaciones.get((1+offset)%recomendaciones.size()).getMedia() < 2.0) { %>
                                                                                <ul class="rating onestar">
                                                                                    <% } else {
                                                                                        if (recomendaciones.get((1+offset)%recomendaciones.size()).getMedia() < 3.0) { %>
                                                                                    <ul class="rating twostar">
                                                                                        <% } else {
                                                                                            if (recomendaciones.get((1+offset)%recomendaciones.size()).getMedia() < 4.0) { %>
                                                                                        <ul class="rating threestar">
                                                                                            <% } else {
                                                                                                if (recomendaciones.get((1+offset)%recomendaciones.size()).getMedia() < 5.0) { %>
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
                                                                                                <h3>Director:</h3><p><h3><%= detalles.get((1+offset)%recomendaciones.size()).getDirector()%></h3></p>
                                                                                                </td>
                                                                                                <td style="padding-right: 50px"/>
                                                                                                <td rowspan="2" style="padding-bottom: 50px">
                                                                                                    <% if (recomendaciones.get((1+offset)%recomendaciones.size()).getMedia() <= 2.0) { %>
                                                                                                    <div class="puntuacion rojo">
                                                                                                        <% } else {
                                                                                                            if (recomendaciones.get((1+offset)%recomendaciones.size()).getMedia() <= 3.0) { %>
                                                                                                        <div class="puntuacion naranja">
                                                                                                            <% } else {
                                                                                                                if (recomendaciones.get((1+offset)%recomendaciones.size()).getMedia() <= 4.0) { %>
                                                                                                            <div class="puntuacion amarillo">
                                                                                                                <% } else {
                                                                                                                    if (recomendaciones.get((1+offset)%recomendaciones.size()).getMedia() < 5.0) { %>
                                                                                                                <div class="puntuacion verde">
                                                                                                                    <% } else { %>
                                                                                                                    <div class="puntuacion azul">
                                                                                                                        <% }
                                                                                                                                    }
                                                                                                                                }
                                                                                                                            }%>
                                                                                                                        <div class="valor-puntuacion decimal">
                                                                                                                            <%= recomendaciones.get((1+offset)%recomendaciones.size()).getMedia()%>
                                                                                                                        </div>
                                                                                                                    </div>
                                                                                                                    <div>
                                                                                                                        <img src="css/images/comentario1.png" height="auto" width="20"/>
                                                                                                                        <%= recomendaciones.get((1+offset)%recomendaciones.size()).getValoraciones().size()%>
                                                                                                                    </div>
                                                                                                                    </td>



                                                                                                                    </tr>


                                                                                                                    <!-- Segunda fila-->
                                                                                                                    <tr style="padding-right: 20px"/>
                                                                                                                    <tr> 
                                                                                                                        <!-- Pelicula 1 -->
                                                                                                                        <td rowspan="2"> 
                                                                                                                            <div class="movie-list-image"> 
                                                                                                                                <a href="perfilPelicula.jsp?id=<%= recomendaciones.get((2+offset)%recomendaciones.size()).getId()%>" ><img src="<%= detalles.get((2+offset)%recomendaciones.size()).getPoster()%>" class="image-poster"/></a>
                                                                                                                            </div>
                                                                                                                        </td>
                                                                                                                        <td width="250px"><h1 style="color: #000"><%= recomendaciones.get((2+offset)%recomendaciones.size()).getTitulo() + " (" + recomendaciones.get((2+offset)%recomendaciones.size()).getAnno() + ")"%></h1>
                                                                                                                                <% if (recomendaciones.get((2+offset)%recomendaciones.size()).getMedia() == 0.0) { %>
                                                                                                                            <ul class="rating nostar">
                                                                                                                                <% } else {
                                                                                                                                    if (recomendaciones.get((2+offset)%recomendaciones.size()).getMedia() < 2.0) { %>
                                                                                                                                <ul class="rating onestar">
                                                                                                                                    <% } else {
                                                                                                                                        if (recomendaciones.get((2+offset)%recomendaciones.size()).getMedia() < 3.0) { %>
                                                                                                                                    <ul class="rating twostar">
                                                                                                                                        <% } else {
                                                                                                                                            if (recomendaciones.get((2+offset)%recomendaciones.size()).getMedia() < 4.0) { %>
                                                                                                                                        <ul class="rating threestar">
                                                                                                                                            <% } else {
                                                                                                                                                if (recomendaciones.get((2+offset)%recomendaciones.size()).getMedia() < 5.0) { %>
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
                                                                                                                                                <h3>Director:</h3><p><h3><%= detalles.get((2+offset)%recomendaciones.size()).getDirector()%></h3></p>
                                                                                                                                                </td>
                                                                                                                                                <td style="padding-right: 50px"/>
                                                                                                                                                <td rowspan="2" style="padding-bottom: 50px">
                                                                                                                                                    <% if (recomendaciones.get((2+offset)%recomendaciones.size()).getMedia() <= 2.0) { %>
                                                                                                                                                    <div class="puntuacion rojo">
                                                                                                                                                        <% } else {
                                                                                                                                                            if (recomendaciones.get((2+offset)%recomendaciones.size()).getMedia() <= 3.0) { %>
                                                                                                                                                        <div class="puntuacion naranja">
                                                                                                                                                            <% } else {
                                                                                                                                                                if (recomendaciones.get((2+offset)%recomendaciones.size()).getMedia() <= 4.0) { %>
                                                                                                                                                            <div class="puntuacion amarillo">
                                                                                                                                                                <% } else {
                                                                                                                                                                    if (recomendaciones.get((2+offset)%recomendaciones.size()).getMedia() < 5.0) { %>
                                                                                                                                                                <div class="puntuacion verde">
                                                                                                                                                                    <% } else { %>
                                                                                                                                                                    <div class="puntuacion azul">
                                                                                                                                                                        <% }
                                                                                                                                                                                    }
                                                                                                                                                                                }
                                                                                                                                                                            }%>
                                                                                                                                                                        <div class="valor-puntuacion decimal">
                                                                                                                                                                            <%= recomendaciones.get((2+offset)%recomendaciones.size()).getMedia()%>
                                                                                                                                                                        </div>
                                                                                                                                                                    </div>
                                                                                                                                                                    <div>
                                                                                                                                                                        <img src="css/images/comentario1.png" height="auto" width="20"/>
                                                                                                                                                                        <%= recomendaciones.get((2+offset)%recomendaciones.size()).getValoraciones().size()%>
                                                                                                                                                                    </div>
                                                                                                                                                                    </td>

                                                                                                                                                                    <!-- Pelicula 2 -->
                                                                                                                                                                    <td style="padding-right: 20px"/>
                                                                                                                                                                    <td rowspan="2"> 
                                                                                                                                                                        <div class="movie-list-image"> 
                                                                                                                                                                            <a href="perfilPelicula.jsp?id=<%= recomendaciones.get((3+offset)%recomendaciones.size()).getId()%>" ><img src="<%= detalles.get((3+offset)%recomendaciones.size()).getPoster()%>" class="image-poster"/></a>
                                                                                                                                                                        </div>
                                                                                                                                                                    </td>
                                                                                                                                                                    <td width="250px"><h1 style="color: #000"><%= recomendaciones.get((3+offset)%recomendaciones.size()).getTitulo() + " (" + recomendaciones.get((3+offset)%recomendaciones.size()).getAnno() + ")"%></h1>
                                                                                                                                                                            <% if (recomendaciones.get((3+offset)%recomendaciones.size()).getMedia() == 0.0) { %>
                                                                                                                                                                        <ul class="rating nostar">
                                                                                                                                                                            <% } else {
                                                                                                                                                                                if (recomendaciones.get((3+offset)%recomendaciones.size()).getMedia() < 2.0) { %>
                                                                                                                                                                            <ul class="rating onestar">
                                                                                                                                                                                <% } else {
                                                                                                                                                                                    if (recomendaciones.get((3+offset)%recomendaciones.size()).getMedia() < 3.0) { %>
                                                                                                                                                                                <ul class="rating twostar">
                                                                                                                                                                                    <% } else {
                                                                                                                                                                                        if (recomendaciones.get((3+offset)%recomendaciones.size()).getMedia() < 4.0) { %>
                                                                                                                                                                                    <ul class="rating threestar">
                                                                                                                                                                                        <% } else {
                                                                                                                                                                                            if (recomendaciones.get((3+offset)%recomendaciones.size()).getMedia() < 5.0) { %>
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
                                                                                                                                                                                            <h3>Director:</h3><p><h3><%= detalles.get((3+offset)%recomendaciones.size()).getDirector()%></h3></p>
                                                                                                                                                                                            </td>
                                                                                                                                                                                            <td style="padding-right: 50px"/>
                                                                                                                                                                                            <td rowspan="2" style="padding-bottom: 50px">
                                                                                                                                                                                                <% if (recomendaciones.get((3+offset)%recomendaciones.size()).getMedia() <= 2.0) { %>
                                                                                                                                                                                                <div class="puntuacion rojo">
                                                                                                                                                                                                    <% } else {
                                                                                                                                                                                                        if (recomendaciones.get((3+offset)%recomendaciones.size()).getMedia() <= 3.0) { %>
                                                                                                                                                                                                    <div class="puntuacion naranja">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (recomendaciones.get((3+offset)%recomendaciones.size()).getMedia() <= 4.0) { %>
                                                                                                                                                                                                        <div class="puntuacion amarillo">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (recomendaciones.get((3+offset)%recomendaciones.size()).getMedia() < 5.0) { %>
                                                                                                                                                                                                        <div class="puntuacion verde">
                                                                                                                                                                                                        <% } else { %>
                                                                                                                                                                                                        <div class="puntuacion azul">
                                                                                                                                                                                                        <% }
                                                                                                                                                                                                        }
                                                                                                                                                                                                        }
                                                                                                                                                                                                        }%>
                                                                                                                                                                                                        <div class="valor-puntuacion decimal">
                                                                                                                                                                                                        <%= recomendaciones.get((3+offset)%recomendaciones.size()).getMedia()%>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        <div>
                                                                                                                                                                                                        <img src="css/images/comentario1.png" height="auto" width="20"/>
                                                                                                                                                                                                        <%= recomendaciones.get((3+offset)%recomendaciones.size()).getValoraciones().size()%>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </td>



                                                                                                                                                                                                        </tr>


                                                                                                                                                                                                        <!-- Tercera fila-->

                                                                                                                                                                                                        <tr style="padding-top: 20px"/>
                                                                                                                                                                                                        <tr> 
                                                                                                                                                                                                        <!-- Pelicula 1 -->
                                                                                                                                                                                                        <td rowspan="2"> 
                                                                                                                                                                                                        <div class="movie-list-image"> 
                                                                                                                                                                                                        <a href="perfilPelicula.jsp?id=<%= recomendaciones.get((4+offset)%recomendaciones.size()).getId()%>" ><img src="<%= detalles.get((4+offset)%recomendaciones.size()).getPoster()%>" class="image-poster"/></a>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </td>
                                                                                                                                                                                                        <td width="250px"><h1 style="color: #000"><%= recomendaciones.get((4+offset)%recomendaciones.size()).getTitulo() + " (" + recomendaciones.get((4+offset)%recomendaciones.size()).getAnno() + ")"%></h1>
                                                                                                                                                                                                        <% if (recomendaciones.get((4+offset)%recomendaciones.size()).getMedia() == 0.0) { %>
                                                                                                                                                                                                        <ul class="rating nostar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (recomendaciones.get((4+offset)%recomendaciones.size()).getMedia() < 2.0) { %>
                                                                                                                                                                                                        <ul class="rating onestar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (recomendaciones.get((4+offset)%recomendaciones.size()).getMedia() < 3.0) { %>
                                                                                                                                                                                                        <ul class="rating twostar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (recomendaciones.get((4+offset)%recomendaciones.size()).getMedia() < 4.0) { %>
                                                                                                                                                                                                        <ul class="rating threestar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (recomendaciones.get((4+offset)%recomendaciones.size()).getMedia() < 5.0) { %>
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
                                                                                                                                                                                                        <h3>Director:</h3><p><h3><%= detalles.get((4+offset)%recomendaciones.size()).getDirector()%></h3></p>
                                                                                                                                                                                                        </td>
                                                                                                                                                                                                        <td style="padding-right: 50px"/>
                                                                                                                                                                                                        <td rowspan="2" style="padding-bottom: 50px">
                                                                                                                                                                                                        <% if (recomendaciones.get((4+offset)%recomendaciones.size()).getMedia() <= 2.0) { %>
                                                                                                                                                                                                        <div class="puntuacion rojo">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (recomendaciones.get((4+offset)%recomendaciones.size()).getMedia() <= 3.0) { %>
                                                                                                                                                                                                        <div class="puntuacion naranja">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (recomendaciones.get((4+offset)%recomendaciones.size()).getMedia() <= 4.0) { %>
                                                                                                                                                                                                        <div class="puntuacion amarillo">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (recomendaciones.get((4+offset)%recomendaciones.size()).getMedia() < 5.0) { %>
                                                                                                                                                                                                        <div class="puntuacion verde">
                                                                                                                                                                                                        <% } else { %>
                                                                                                                                                                                                        <div class="puntuacion azul">
                                                                                                                                                                                                        <% }
                                                                                                                                                                                                        }
                                                                                                                                                                                                        }
                                                                                                                                                                                                        }%>
                                                                                                                                                                                                        <div class="valor-puntuacion decimal">
                                                                                                                                                                                                        <%= recomendaciones.get((4+offset)%recomendaciones.size()).getMedia()%>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        <div>
                                                                                                                                                                                                        <img src="css/images/comentario1.png" height="auto" width="20"/>
                                                                                                                                                                                                        <%= recomendaciones.get((4+offset)%recomendaciones.size()).getValoraciones().size()%>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </td>

                                                                                                                                                                                                        <!-- Pelicula 2 -->
                                                                                                                                                                                                        <td style="padding-right: 20px"/>
                                                                                                                                                                                                        <td rowspan="2"> 
                                                                                                                                                                                                        <div class="movie-list-image"> 
                                                                                                                                                                                                        <a href="perfilPelicula.jsp?id=<%= recomendaciones.get((5+offset)%recomendaciones.size()).getId()%>" ><img src="<%= detalles.get((5+offset)%recomendaciones.size()).getPoster()%>" class="image-poster"/></a>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </td>
                                                                                                                                                                                                        <td width="250px"><h1 style="color: #000"><%= recomendaciones.get((5+offset)%recomendaciones.size()).getTitulo() + " (" + recomendaciones.get((5+offset)%recomendaciones.size()).getAnno() + ")"%></h1>
                                                                                                                                                                                                        <% if (recomendaciones.get((5+offset)%recomendaciones.size()).getMedia() == 0.0) { %>
                                                                                                                                                                                                        <ul class="rating nostar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (recomendaciones.get((5+offset)%recomendaciones.size()).getMedia() < 2.0) { %>
                                                                                                                                                                                                        <ul class="rating onestar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (recomendaciones.get((5+offset)%recomendaciones.size()).getMedia() < 3.0) { %>
                                                                                                                                                                                                        <ul class="rating twostar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (recomendaciones.get((5+offset)%recomendaciones.size()).getMedia() < 4.0) { %>
                                                                                                                                                                                                        <ul class="rating threestar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (recomendaciones.get((5+offset)%recomendaciones.size()).getMedia() < 5.0) { %>
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
                                                                                                                                                                                                        <h3>Director:</h3><p><h3><%= detalles.get((5+offset)%recomendaciones.size()).getDirector()%></h3></p>
                                                                                                                                                                                                        </td>
                                                                                                                                                                                                        <td style="padding-right: 50px"/>
                                                                                                                                                                                                        <td rowspan="2" style="padding-bottom: 50px">
                                                                                                                                                                                                        <% if (recomendaciones.get((5+offset)%recomendaciones.size()).getMedia() <= 2.0) { %>
                                                                                                                                                                                                        <div class="puntuacion rojo">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (recomendaciones.get((5+offset)%recomendaciones.size()).getMedia() <= 3.0) { %>
                                                                                                                                                                                                        <div class="puntuacion naranja">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (recomendaciones.get((5+offset)%recomendaciones.size()).getMedia() <= 4.0) { %>
                                                                                                                                                                                                        <div class="puntuacion amarillo">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (recomendaciones.get((5+offset)%recomendaciones.size()).getMedia() < 5.0) { %>
                                                                                                                                                                                                        <div class="puntuacion verde">
                                                                                                                                                                                                        <% } else { %>
                                                                                                                                                                                                        <div class="puntuacion azul">
                                                                                                                                                                                                        <% }
                                                                                                                                                                                                        }
                                                                                                                                                                                                        }
                                                                                                                                                                                                        }%>
                                                                                                                                                                                                        <div class="valor-puntuacion decimal">
                                                                                                                                                                                                        <%= recomendaciones.get((5+offset)%recomendaciones.size()).getMedia()%>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        <div>
                                                                                                                                                                                                        <img src="css/images/comentario1.png" height="auto" width="20"/>
                                                                                                                                                                                                        <%= recomendaciones.get((5+offset)%recomendaciones.size()).getValoraciones().size()%>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </td>



                                                                                                                                                                                                        </tr>


                                                                                                                                                                                                        <!-- Cuarta fila-->

                                                                                                                                                                                                        <tr style="padding-top: 20px"/>
                                                                                                                                                                                                        <tr> 
                                                                                                                                                                                                        <!-- Pelicula 1 -->
                                                                                                                                                                                                        <td rowspan="2"> 
                                                                                                                                                                                                        <div class="movie-list-image"> 
                                                                                                                                                                                                        <a href="perfilPelicula.jsp?id=<%= recomendaciones.get((6+offset)%recomendaciones.size()).getId()%>" ><img src="<%= detalles.get((6+offset)%recomendaciones.size()).getPoster()%>" class="image-poster"/></a>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </td>
                                                                                                                                                                                                        <td width="250px"><h1 style="color: #000"><%= recomendaciones.get((6+offset)%recomendaciones.size()).getTitulo() + " (" + recomendaciones.get((6+offset)%recomendaciones.size()).getAnno() + ")"%></h1>
                                                                                                                                                                                                        <% if (recomendaciones.get((6+offset)%recomendaciones.size()).getMedia() == 0.0) { %>
                                                                                                                                                                                                        <ul class="rating nostar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (recomendaciones.get((6+offset)%recomendaciones.size()).getMedia() < 2.0) { %>
                                                                                                                                                                                                        <ul class="rating onestar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (recomendaciones.get((6+offset)%recomendaciones.size()).getMedia() < 3.0) { %>
                                                                                                                                                                                                        <ul class="rating twostar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (recomendaciones.get((6+offset)%recomendaciones.size()).getMedia() < 4.0) { %>
                                                                                                                                                                                                        <ul class="rating threestar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (recomendaciones.get((6+offset)%recomendaciones.size()).getMedia() < 5.0) { %>
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
                                                                                                                                                                                                        <h3>Director:</h3><p><h3><%= detalles.get((6+offset)%recomendaciones.size()).getDirector()%></h3></p>
                                                                                                                                                                                                        </td>
                                                                                                                                                                                                        <td style="padding-right: 50px"/>
                                                                                                                                                                                                        <td rowspan="2" style="padding-bottom: 50px">
                                                                                                                                                                                                        <% if (recomendaciones.get((6+offset)%recomendaciones.size()).getMedia() <= 2.0) { %>
                                                                                                                                                                                                        <div class="puntuacion rojo">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (recomendaciones.get((6+offset)%recomendaciones.size()).getMedia() <= 3.0) { %>
                                                                                                                                                                                                        <div class="puntuacion naranja">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (recomendaciones.get((6+offset)%recomendaciones.size()).getMedia() <= 4.0) { %>
                                                                                                                                                                                                        <div class="puntuacion amarillo">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (recomendaciones.get((6+offset)%recomendaciones.size()).getMedia() < 5.0) { %>
                                                                                                                                                                                                        <div class="puntuacion verde">
                                                                                                                                                                                                        <% } else { %>
                                                                                                                                                                                                        <div class="puntuacion azul">
                                                                                                                                                                                                        <% }
                                                                                                                                                                                                        }
                                                                                                                                                                                                        }
                                                                                                                                                                                                        }%>
                                                                                                                                                                                                        <div class="valor-puntuacion decimal">
                                                                                                                                                                                                        <%= recomendaciones.get((6+offset)%recomendaciones.size()).getMedia()%>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        <div>
                                                                                                                                                                                                        <img src="css/images/comentario1.png" height="auto" width="20"/>
                                                                                                                                                                                                        <%= recomendaciones.get((6+offset)%recomendaciones.size()).getValoraciones().size()%>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </td>

                                                                                                                                                                                                        <!-- Pelicula 2 -->
                                                                                                                                                                                                        <td style="padding-right: 20px"/>
                                                                                                                                                                                                        <td rowspan="2"> 
                                                                                                                                                                                                        <div class="movie-list-image"> 
                                                                                                                                                                                                        <a href="perfilPelicula.jsp?id=<%= recomendaciones.get((7+offset)%recomendaciones.size()).getId()%>" ><img src="<%= detalles.get((7+offset)%recomendaciones.size()).getPoster()%>" class="image-poster"/></a>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </td>
                                                                                                                                                                                                        <td width="250px"><h1 style="color: #000"><%= recomendaciones.get((7+offset)%recomendaciones.size()).getTitulo() + " (" + recomendaciones.get((7+offset)%recomendaciones.size()).getAnno() + ")"%></h1>
                                                                                                                                                                                                        <% if (recomendaciones.get((7+offset)%recomendaciones.size()).getMedia() == 0.0) { %>
                                                                                                                                                                                                        <ul class="rating nostar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (recomendaciones.get((7+offset)%recomendaciones.size()).getMedia() < 2.0) { %>
                                                                                                                                                                                                        <ul class="rating onestar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (recomendaciones.get((7+offset)%recomendaciones.size()).getMedia() < 3.0) { %>
                                                                                                                                                                                                        <ul class="rating twostar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (recomendaciones.get((7+offset)%recomendaciones.size()).getMedia() < 4.0) { %>
                                                                                                                                                                                                        <ul class="rating threestar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (recomendaciones.get((7+offset)%recomendaciones.size()).getMedia() < 5.0) { %>
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
                                                                                                                                                                                                        <h3>Director:</h3><p><h3><%= detalles.get((7+offset)%recomendaciones.size()).getDirector()%></h3></p>
                                                                                                                                                                                                        </td>
                                                                                                                                                                                                        <td style="padding-right: 50px"/>
                                                                                                                                                                                                        <td rowspan="2" style="padding-bottom: 50px">
                                                                                                                                                                                                        <% if (recomendaciones.get((7+offset)%recomendaciones.size()).getMedia() <= 2.0) { %>
                                                                                                                                                                                                        <div class="puntuacion rojo">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (recomendaciones.get((7+offset)%recomendaciones.size()).getMedia() <= 3.0) { %>
                                                                                                                                                                                                        <div class="puntuacion naranja">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (recomendaciones.get((7+offset)%recomendaciones.size()).getMedia() <= 4.0) { %>
                                                                                                                                                                                                        <div class="puntuacion amarillo">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (recomendaciones.get((7+offset)%recomendaciones.size()).getMedia() < 5.0) { %>
                                                                                                                                                                                                        <div class="puntuacion verde">
                                                                                                                                                                                                        <% } else { %>
                                                                                                                                                                                                        <div class="puntuacion azul">
                                                                                                                                                                                                        <% }
                                                                                                                                                                                                        }
                                                                                                                                                                                                        }
                                                                                                                                                                                                        }%>
                                                                                                                                                                                                        <div class="valor-puntuacion decimal">
                                                                                                                                                                                                        <%= recomendaciones.get((7+offset)%recomendaciones.size()).getMedia()%>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        <div>
                                                                                                                                                                                                        <img src="css/images/comentario1.png" height="auto" width="20"/>
                                                                                                                                                                                                        <%= recomendaciones.get((7+offset)%recomendaciones.size()).getValoraciones().size()%>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </td>



                                                                                                                                                                                                        </tr>


                                                                                                                                                                                                        <!-- Quinta fila-->

                                                                                                                                                                                                        <tr style="padding-top: 20px"/>
                                                                                                                                                                                                        <tr> 
                                                                                                                                                                                                        <!-- Pelicula 1 -->
                                                                                                                                                                                                        <td rowspan="2"> 
                                                                                                                                                                                                        <div class="movie-list-image"> 
                                                                                                                                                                                                        <a href="perfilPelicula.jsp?id=<%= recomendaciones.get((8+offset)%recomendaciones.size()).getId()%>" ><img src="<%= detalles.get((8+offset)%recomendaciones.size()).getPoster()%>" class="image-poster"/></a>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </td>
                                                                                                                                                                                                        <td width="250px"><h1 style="color: #000"><%= recomendaciones.get((8+offset)%recomendaciones.size()).getTitulo() + " (" + recomendaciones.get((8+offset)%recomendaciones.size()).getAnno() + ")"%></h1>
                                                                                                                                                                                                        <% if (recomendaciones.get((8+offset)%recomendaciones.size()).getMedia() == 0.0) { %>
                                                                                                                                                                                                        <ul class="rating nostar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (recomendaciones.get((8+offset)%recomendaciones.size()).getMedia() < 2.0) { %>
                                                                                                                                                                                                        <ul class="rating onestar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (recomendaciones.get((8+offset)%recomendaciones.size()).getMedia() < 3.0) { %>
                                                                                                                                                                                                        <ul class="rating twostar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (recomendaciones.get((8+offset)%recomendaciones.size()).getMedia() < 4.0) { %>
                                                                                                                                                                                                        <ul class="rating threestar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (recomendaciones.get((8+offset)%recomendaciones.size()).getMedia() < 5.0) { %>
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
                                                                                                                                                                                                        <h3>Director:</h3><p><h3><%= detalles.get((8+offset)%recomendaciones.size()).getDirector()%></h3></p>
                                                                                                                                                                                                        </td>
                                                                                                                                                                                                        <td style="padding-right: 50px"/>
                                                                                                                                                                                                        <td rowspan="2" style="padding-bottom: 50px">
                                                                                                                                                                                                        <% if (recomendaciones.get((8+offset)%recomendaciones.size()).getMedia() <= 2.0) { %>
                                                                                                                                                                                                        <div class="puntuacion rojo">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (recomendaciones.get((8+offset)%recomendaciones.size()).getMedia() <= 3.0) { %>
                                                                                                                                                                                                        <div class="puntuacion naranja">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (recomendaciones.get((8+offset)%recomendaciones.size()).getMedia() <= 4.0) { %>
                                                                                                                                                                                                        <div class="puntuacion amarillo">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (recomendaciones.get((8+offset)%recomendaciones.size()).getMedia() < 5.0) { %>
                                                                                                                                                                                                        <div class="puntuacion verde">
                                                                                                                                                                                                        <% } else { %>
                                                                                                                                                                                                        <div class="puntuacion azul">
                                                                                                                                                                                                        <% }
                                                                                                                                                                                                        }
                                                                                                                                                                                                        }
                                                                                                                                                                                                        }%>
                                                                                                                                                                                                        <div class="valor-puntuacion decimal">
                                                                                                                                                                                                        <%= recomendaciones.get((8+offset)%recomendaciones.size()).getMedia()%>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        <div>
                                                                                                                                                                                                        <img src="css/images/comentario1.png" height="auto" width="20"/>
                                                                                                                                                                                                        <%= recomendaciones.get((8+offset)%recomendaciones.size()).getValoraciones().size()%>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </td>

                                                                                                                                                                                                        <!-- Pelicula 2 -->
                                                                                                                                                                                                        <td style="padding-right: 20px"/>
                                                                                                                                                                                                        <td rowspan="2"> 
                                                                                                                                                                                                        <div class="movie-list-image"> 
                                                                                                                                                                                                        <a href="perfilPelicula.jsp?id=<%= recomendaciones.get((9+offset)%recomendaciones.size()).getId()%>" ><img src="<%= detalles.get((9+offset)%recomendaciones.size()).getPoster()%>" class="image-poster"/></a>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </td>
                                                                                                                                                                                                        <td width="250px"><h1 style="color: #000"><%= recomendaciones.get((9+offset)%recomendaciones.size()).getTitulo() + " (" + recomendaciones.get((9+offset)%recomendaciones.size()).getAnno() + ")"%></h1>
                                                                                                                                                                                                        <% if (recomendaciones.get((9+offset)%recomendaciones.size()).getMedia() == 0.0) { %>
                                                                                                                                                                                                        <ul class="rating nostar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (recomendaciones.get((9+offset)%recomendaciones.size()).getMedia() < 2.0) { %>
                                                                                                                                                                                                        <ul class="rating onestar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (recomendaciones.get((9+offset)%recomendaciones.size()).getMedia() < 3.0) { %>
                                                                                                                                                                                                        <ul class="rating twostar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (recomendaciones.get((9+offset)%recomendaciones.size()).getMedia() < 4.0) { %>
                                                                                                                                                                                                        <ul class="rating threestar">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (recomendaciones.get((9+offset)%recomendaciones.size()).getMedia() < 5.0) { %>
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
                                                                                                                                                                                                        <h3>Director:</h3><p><h3><%= detalles.get((9+offset)%recomendaciones.size()).getDirector()%></h3></p>
                                                                                                                                                                                                        </td>
                                                                                                                                                                                                        <td style="padding-right: 50px"/>
                                                                                                                                                                                                        <td rowspan="2" style="padding-bottom: 50px">
                                                                                                                                                                                                        <% if (recomendaciones.get((9+offset)%recomendaciones.size()).getMedia() <= 2.0) { %>
                                                                                                                                                                                                        <div class="puntuacion rojo">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (recomendaciones.get((9+offset)%recomendaciones.size()).getMedia() <= 3.0) { %>
                                                                                                                                                                                                        <div class="puntuacion naranja">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (recomendaciones.get((9+offset)%recomendaciones.size()).getMedia() <= 4.0) { %>
                                                                                                                                                                                                        <div class="puntuacion amarillo">
                                                                                                                                                                                                        <% } else {
                                                                                                                                                                                                            if (recomendaciones.get((9+offset)%recomendaciones.size()).getMedia() < 5.0) { %>
                                                                                                                                                                                                        <div class="puntuacion verde">
                                                                                                                                                                                                        <% } else { %>
                                                                                                                                                                                                        <div class="puntuacion azul">
                                                                                                                                                                                                        <% }
                                                                                                                                                                                                        }
                                                                                                                                                                                                        }
                                                                                                                                                                                                        }%>
                                                                                                                                                                                                        <div class="valor-puntuacion decimal">
                                                                                                                                                                                                        <%= recomendaciones.get((9+offset)%recomendaciones.size()).getMedia()%>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        <div>
                                                                                                                                                                                                        <img src="css/images/comentario1.png" height="auto" width="20"/>
                                                                                                                                                                                                        <%= recomendaciones.get((9+offset)%recomendaciones.size()).getValoraciones().size()%>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </td>



                                                                                                                                                                                                        </tr>
                                                                                                                                                                                                        </table>

                                                                                                                                                                                                        <br/>
                                                                                                                                                                                                        <p>                        
                                                                                                                                                                                                        <a style="padding-right: 15px" href="recomendaciones.jsp?index=<%
                                                                                                                                                                                                        if (request.getParameter("index").equals("0") || request.getParameter("index").equals("9")) {
                                                                                                                                                                                                        out.println(0);
                                                                                                                                                                                                        } else {
                                                                                                                                                                                                        out.println(Integer.parseInt(request.getParameter("index")) - 10);
                                                                                                                                                                                                        }%> "> Ver anteriores </a>
                                                                                                                                                                                                        <a href="recomendaciones.jsp?index=<%
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
