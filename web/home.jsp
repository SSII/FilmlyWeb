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

        <% String nombre = Controlador.getInstancia().getUsuarioLogueado().getNombre();
           
            List<Pelicula> recomendaciones = Controlador.getInstancia().obtenerRecomendaciones();
            List<DetallesPelicula> detalles = new LinkedList();

            for (Pelicula p : recomendaciones) {
                detalles.add(Controlador.getInstancia().getDetallesPelicula(p));
            }
        %>


        <div id="shell">
            <div id="header">
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

                <ul class="dashboard">
                    <li><a href="recomendaciones.jsp?index=0">MIS RECOMENDACIONES</a></li>
                    <li><a href="misValoraciones.jsp?index=0">MIS VALORACIONES</a></li>
                    <li><a href="mejorValoradas.jsp?index=0">MEJOR VALORADAS</a></li>
                    <li><a href="masComentadas.jsp?index=0">MÁS COMENTADAS</a></li>
                    <li><a href="novedades.jsp?index=0">NOVEDADES</a></li>


                </ul>
            </div>
                                                          
            <div id="main">
                <div id="content">
                                       
                    <%if(Controlador.getInstancia().getUsuarioLogueado().getPeliculasValoradas().size() == 0){%>
                    <div class="box">
                        <div class="head"> 
                            <h2 style="padding-left: 200px">¡Valora películas!. ¡Para ofrecerte recomendaciones necesitamos saber tus gustos</h2>
                        </div> 
                    <%}else{%>
                    <div class="box">
                        <div class="head">
                            <h2>Recomendaciones</h2>
                            <p class="text-right" style="color: #ffffff">Ver todos</p>
                        </div>
                        <div class="movie">
                            <div class="movie-image"> <a href="perfilPelicula.jsp?id=<%= recomendaciones.get(0).getId()%>"><img src="<%= detalles.get(0).getPoster() %>" alt="" /></a> </div>
                            <div>
                                <% if (recomendaciones.get(0).getMedia() == 0.0) { %>
                                <ul class="rating nostar">
                                    <% } else {
                                    if (recomendaciones.get(0).getMedia() < 2.0) { %>
                                    <ul class="rating onestar">
                                        <% } else {
                                    if (recomendaciones.get(0).getMedia() < 3.0) { %>
                                        <ul class="rating twostar">
                                            <% } else {
                                        if (recomendaciones.get(0).getMedia() < 4.0) { %>
                                            <ul class="rating threestar">
                                                <% } else {
                                            if (recomendaciones.get(0).getMedia() < 5.0) { %>
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
                                <img src="css/images/minicomentario.png" class="img-comments" alt="Nº valoraciones"></img>
                                <span class="comments"><%=recomendaciones.get(0).getValoraciones().size()%></span> </div>
                        </div>
                        <div class="movie">
                            <div class="movie-image"><a href="perfilPelicula.jsp?id=<%= recomendaciones.get(1).getId()%>"><img src="<%= detalles.get(1).getPoster() %>" alt="" /></a> </div>
                            <div>
                                <% if (recomendaciones.get(1).getMedia() == 0.0) { %>
                                <ul class="rating nostar">
                                    <% } else {
                                    if (recomendaciones.get(1).getMedia() < 2.0) { %>
                                    <ul class="rating onestar">
                                        <% } else {
                                    if (recomendaciones.get(1).getMedia() < 3.0) { %>
                                        <ul class="rating twostar">
                                            <% } else {
                                        if (recomendaciones.get(1).getMedia() < 4.0) { %>
                                            <ul class="rating threestar">
                                                <% } else {
                                            if (recomendaciones.get(1).getMedia() < 5.0) { %>
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
                                <img src="css/images/minicomentario.png" class="img-comments" alt="Nº valoraciones"></img>
                                <span class="comments"><%=recomendaciones.get(1).getValoraciones().size()%></span> </div>
                        </div>
                        <div class="movie">
                            <div class="movie-image"><a href="perfilPelicula.jsp?id=<%= recomendaciones.get(2).getId()%>"><img src="<%= detalles.get(2).getPoster() %>" alt="" /></a> </div>
                            <div>
                                <% if (recomendaciones.get(2).getMedia() == 0.0) { %>
                                <ul class="rating nostar">
                                    <% } else {
                                    if (recomendaciones.get(2).getMedia() < 2.0) { %>
                                    <ul class="rating onestar">
                                        <% } else {
                                    if (recomendaciones.get(2).getMedia() < 3.0) { %>
                                        <ul class="rating twostar">
                                            <% } else {
                                        if (recomendaciones.get(2).getMedia() < 4.0) { %>
                                            <ul class="rating threestar">
                                                <% } else {
                                            if (recomendaciones.get(2).getMedia() < 5.0) { %>
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
                                <img src="css/images/minicomentario.png" class="img-comments" alt="Nº valoraciones"></img>
                                <span class="comments"><%=recomendaciones.get(2).getValoraciones().size()%></span> </div>
                        </div>
                        <div class="movie">
                            <div class="movie-image"><a href="perfilPelicula.jsp?id=<%= recomendaciones.get(3).getId()%>"><img src="<%= detalles.get(3).getPoster() %>" alt="" /></a> </div>
                            <div>
                                <% if (recomendaciones.get(3).getMedia() == 0.0) { %>
                                <ul class="rating nostar">
                                    <% } else {
                                    if (recomendaciones.get(3).getMedia() < 2.0) { %>
                                    <ul class="rating onestar">
                                        <% } else {
                                    if (recomendaciones.get(3).getMedia() < 3.0) { %>
                                        <ul class="rating twostar">
                                            <% } else {
                                        if (recomendaciones.get(3).getMedia() < 4.0) { %>
                                            <ul class="rating threestar">
                                                <% } else {
                                            if (recomendaciones.get(3).getMedia() < 5.0) { %>
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
                                <img src="css/images/minicomentario.png" class="img-comments" alt="Nº valoraciones"></img>
                                <span class="comments"><%=recomendaciones.get(3).getValoraciones().size()%></span> </div>
                        </div>
                        <div class="movie">
                            <div class="movie-image"> <a href="perfilPelicula.jsp?id=<%= recomendaciones.get(4).getId()%>"><img src="<%= detalles.get(7).getPoster() %>" alt="" /></a> </div>
                            <div>
                                <% if (recomendaciones.get(4).getMedia() == 0.0) { %>
                                <ul class="rating nostar">
                                    <% } else {
                                    if (recomendaciones.get(4).getMedia() < 2.0) { %>
                                    <ul class="rating onestar">
                                        <% } else {
                                    if (recomendaciones.get(4).getMedia() < 3.0) { %>
                                        <ul class="rating twostar">
                                            <% } else {
                                        if (recomendaciones.get(4).getMedia() < 4.0) { %>
                                            <ul class="rating threestar">
                                                <% } else {
                                            if (recomendaciones.get(4).getMedia() < 5.0) { %>
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
                                <img src="css/images/minicomentario.png" class="img-comments" alt="Nº valoraciones"></img>
                                <span class="comments"><%=recomendaciones.get(4).getValoraciones().size()%></span> </div>
                        </div>
                        <div class="movie last">
                            <div class="movie-image"> <a href="perfilPelicula.jsp?id=<%= recomendaciones.get(5).getId()%>"><img src="<%= detalles.get(5).getPoster() %>" alt="" /></a> </div>
                            <div>
                                <% if (recomendaciones.get(5).getMedia() == 0.0) { %>
                                <ul class="rating nostar">
                                    <% } else {
                                    if (recomendaciones.get(5).getMedia() < 2.0) { %>
                                    <ul class="rating onestar">
                                        <% } else {
                                    if (recomendaciones.get(5).getMedia() < 3.0) { %>
                                        <ul class="rating twostar">
                                            <% } else {
                                        if (recomendaciones.get(5).getMedia() < 4.0) { %>
                                            <ul class="rating threestar">
                                                <% } else {
                                            if (recomendaciones.get(5).getMedia() < 5.0) { %>
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
                                <img src="css/images/minicomentario.png" class="img-comments" alt="Nº valoraciones"></img>
                                <span class="comments"><%=recomendaciones.get(5).getValoraciones().size()%></span> </div>
                        </div>
                        <div class="cl">&nbsp;</div>
                    </div>
                    
                  <%}%>  
                    
                  
                      <%  
                        List<Pelicula> masValoradas = Controlador.getInstancia().getPeliculasMasValoradas(0);
                        detalles.clear();
                        for (Pelicula p : masValoradas) {
                            detalles.add(Controlador.getInstancia().getDetallesPelicula(p));
                        }
                    %>      
                    
  
                    <div class="box">
                          
                        <div class="head">
                            <h2>Mejor valoradas</h2>
                            <p class="text-right" style="color: #ffffff">Ver todos</p>
                        </div>
                        <div class="movie">
                            <div class="movie-image">  <a href="perfilPelicula.jsp?id=<%= masValoradas.get(0).getId()%>" ><img src="<%= detalles.get(0).getPoster() %>" alt="" /></a> </div>
                            <div>
                                <% if (masValoradas.get(0).getMedia() == 0.0) { %>
                                <ul class="rating nostar">
                                    <% } else {
                                    if (masValoradas.get(0).getMedia() < 2.0) { %>
                                    <ul class="rating onestar">
                                        <% } else {
                                    if (masValoradas.get(0).getMedia() < 3.0) { %>
                                        <ul class="rating twostar">
                                            <% } else {
                                        if (masValoradas.get(0).getMedia() < 4.0) { %>
                                            <ul class="rating threestar">
                                                <% } else {
                                            if (masValoradas.get(0).getMedia() < 5.0) { %>
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
                                <img src="css/images/minicomentario.png" class="img-comments" alt="Nº valoraciones"></img>
                                <span class="comments"><%= masValoradas.get(0).getValoraciones().size() %></span> 
                            </div>
                        </div>
                        <div class="movie">
                            <div class="movie-image"> <a href="perfilPelicula.jsp?id=<%= masValoradas.get(1).getId()%>" ><img src="<%= detalles.get(1).getPoster() %>" alt="" /></a> </div>
                            <div>
                                <% if (masValoradas.get(1).getMedia() == 0.0) { %>
                                <ul class="rating nostar">
                                    <% } else {
                                    if (masValoradas.get(1).getMedia() < 2.0) { %>
                                    <ul class="rating onestar">
                                        <% } else {
                                    if (masValoradas.get(1).getMedia() < 3.0) { %>
                                        <ul class="rating twostar">
                                            <% } else {
                                        if (masValoradas.get(1).getMedia() < 4.0) { %>
                                            <ul class="rating threestar">
                                                <% } else {
                                            if (masValoradas.get(1).getMedia() < 5.0) { %>
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
                                <img src="css/images/minicomentario.png" class="img-comments" alt="Nº valoraciones"></img>
                                <span class="comments"><%=masValoradas.get(1).getValoraciones().size()%></span> </div>
                        </div>
                        <div class="movie">
                            <div class="movie-image"> <a href="perfilPelicula.jsp?id=<%= masValoradas.get(2).getId()%>" ><img src="<%= detalles.get(2).getPoster() %>" alt="" /></a> </div>
                            <div>
                                <% if (masValoradas.get(2).getMedia() == 0.0) { %>
                                <ul class="rating nostar">
                                    <% } else {
                                    if (masValoradas.get(2).getMedia() < 2.0) { %>
                                    <ul class="rating onestar">
                                        <% } else {
                                    if (masValoradas.get(2).getMedia() < 3.0) { %>
                                        <ul class="rating twostar">
                                            <% } else {
                                        if (masValoradas.get(2).getMedia() < 4.0) { %>
                                            <ul class="rating threestar">
                                                <% } else {
                                            if (masValoradas.get(2).getMedia() < 5.0) { %>
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
                                <img src="css/images/minicomentario.png" class="img-comments" alt="Nº valoraciones"></img>
                                <span class="comments"><%=masValoradas.get(2).getValoraciones().size()%></span> </div>
                        </div>
                        <div class="movie">
                            <div class="movie-image"> <a href="perfilPelicula.jsp?id=<%= masValoradas.get(3).getId()%>" ><img src="<%= detalles.get(3).getPoster() %>" alt="" /></a> </div>
                            <div>
                                <% if (masValoradas.get(3).getMedia() == 0.0) { %>
                                <ul class="rating nostar">
                                    <% } else {
                                    if (masValoradas.get(3).getMedia() < 2.0) { %>
                                    <ul class="rating onestar">
                                        <% } else {
                                    if (masValoradas.get(3).getMedia() < 3.0) { %>
                                        <ul class="rating twostar">
                                            <% } else {
                                        if (masValoradas.get(3).getMedia() < 4.0) { %>
                                            <ul class="rating threestar">
                                                <% } else {
                                            if (masValoradas.get(3).getMedia() < 5.0) { %>
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
                                <img src="css/images/minicomentario.png" class="img-comments" alt="Nº valoraciones"></img>
                                <span class="comments"><%=masValoradas.get(3).getValoraciones().size()%></span> </div>
                        </div>
                        <div class="movie">
                            <div class="movie-image"> <a href="perfilPelicula.jsp?id=<%= masValoradas.get(4).getId()%>" ><img src="<%= detalles.get(4).getPoster() %>" alt="" /></a> </div>
                            <div>
                                <% if (masValoradas.get(4).getMedia() == 0.0) { %>
                                <ul class="rating nostar">
                                    <% } else {
                                    if (masValoradas.get(4).getMedia() < 2.0) { %>
                                    <ul class="rating onestar">
                                        <% } else {
                                    if (masValoradas.get(4).getMedia() < 3.0) { %>
                                        <ul class="rating twostar">
                                            <% } else {
                                        if (masValoradas.get(4).getMedia() < 4.0) { %>
                                            <ul class="rating threestar">
                                                <% } else {
                                            if (masValoradas.get(4).getMedia() < 5.0) { %>
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
                                <img src="css/images/minicomentario.png" class="img-comments" alt="Nº valoraciones"></img>
                                <span class="comments"><%=masValoradas.get(4).getValoraciones().size()%></span> </div>
                        </div>
                        <div class="movie last">
                            <div class="movie-image"> <span class="play"><span class="name">ICE AGE</span></span> <a href="#"><img src="<%= detalles.get(5).getPoster() %>" alt="" /></a> </div>
                            <div>
                                <% if (masValoradas.get(5).getMedia() == 0.0) { %>
                                <ul class="rating nostar">
                                    <% } else {
                                    if (masValoradas.get(5).getMedia() < 2.0) { %>
                                    <ul class="rating onestar">
                                        <% } else {
                                    if (masValoradas.get(5).getMedia() < 3.0) { %>
                                        <ul class="rating twostar">
                                            <% } else {
                                        if (masValoradas.get(5).getMedia() < 4.0) { %>
                                            <ul class="rating threestar">
                                                <% } else {
                                            if (masValoradas.get(5).getMedia() < 5.0) { %>
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
                                <img src="css/images/minicomentario.png" class="img-comments" alt="Nº valoraciones"></img>
                                <span class="comments"><%=masValoradas.get(5).getValoraciones().size()%></span> </div>
                        </div>
                        <div class="cl">&nbsp;</div>
                    </div>
                    
                   
                    
                    
                    <%  
                        List<Pelicula> novedades = Controlador.getInstancia().getPeliculasNovedosas(0);
                        detalles.clear();
                        for (Pelicula p : novedades) {
                            detalles.add(Controlador.getInstancia().getDetallesPelicula(p));
                        }
                    %>                                    
                                                        
                                                        
                    <div class="box">
                        <div class="head">
                            <h2>Novedades</h2>
                            <p class="text-right" style="color: #ffffff">Ver todos</p>
                        </div>
                        <div class="movie">
                            <div class="movie-image"> <a href="perfilPelicula.jsp?id=<%= novedades.get(0).getId()%>"><img src="<%= detalles.get(0).getPoster() %>" alt="" /></a> </div>
                            <div>
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
                                <img src="css/images/minicomentario.png" class="img-comments" alt="Nº valoraciones"></img>
                                <span class="comments"><%=novedades.get(0).getValoraciones().size()%></span> </div>
                        </div>
                        <div class="movie">
                            <div class="movie-image"><a href="perfilPelicula.jsp?id=<%= novedades.get(1).getId()%>"><img src="<%= detalles.get(1).getPoster() %>" alt="" /></a> </div>
                            <div>
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
                                <img src="css/images/minicomentario.png" class="img-comments" alt="Nº valoraciones"></img>
                                <span class="comments"><%=novedades.get(1).getValoraciones().size()%></span> </div>
                        </div>
                        <div class="movie">
                            <div class="movie-image"><a href="perfilPelicula.jsp?id=<%= novedades.get(2).getId()%>"><img src="<%= detalles.get(2).getPoster() %>" alt="" /></a> </div>
                            <div>
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
                                <img src="css/images/minicomentario.png" class="img-comments" alt="Nº valoraciones"></img>
                                <span class="comments"><%=novedades.get(2).getValoraciones().size()%></span> </div>
                        </div>
                        <div class="movie">
                            <div class="movie-image"><a href="perfilPelicula.jsp?id=<%= novedades.get(3).getId()%>"><img src="<%= detalles.get(3).getPoster() %>" alt="" /></a> </div>
                            <div>
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
                                <img src="css/images/minicomentario.png" class="img-comments" alt="Nº valoraciones"></img>
                                <span class="comments"><%=novedades.get(3).getValoraciones().size()%></span> </div>
                        </div>
                        <div class="movie">
                            <div class="movie-image"> <a href="perfilPelicula.jsp?id=<%= novedades.get(4).getId()%>"><img src="<%= detalles.get(6).getPoster() %>" alt="" /></a> </div>
                            <div>
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
                                <img src="css/images/minicomentario.png" class="img-comments" alt="Nº valoraciones"></img>
                                <span class="comments"><%=novedades.get(4).getValoraciones().size()%></span> </div>
                        </div>
                        <div class="movie last">
                            <div class="movie-image"> <a href="perfilPelicula.jsp?id=<%= novedades.get(5).getId()%>"><img src="<%= detalles.get(5).getPoster() %>" alt="" /></a> </div>
                            <div>
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
                                <img src="css/images/minicomentario.png" class="img-comments" alt="Nº valoraciones"></img>
                                <span class="comments"><%=novedades.get(5).getValoraciones().size()%></span> </div>
                        </div>
                        <div class="cl">&nbsp;</div>
                    </div>
                                                        
                    <%
                      List<Pelicula> masComentadas = Controlador.getInstancia().getPeliculasMasComentadas(0);
                      detalles.clear();

                      for (Pelicula p : masComentadas) {
                           detalles.add(Controlador.getInstancia().getDetallesPelicula(p));
                      }
                     %>                                    
                                                        
                    <div class="box">
                        <div class="head">
                            <h2>Más comentadas</h2>
                            <p class="text-right" style="color: #ffffff">Ver todos</p>
                        </div>
                        <div class="movie">
                            <div class="movie-image"> <a href="perfilPelicula.jsp?id=<%= masComentadas.get(0).getId()%>"><img src="<%= detalles.get(0).getPoster() %>" alt="" /></a> </div>
                            <div>
                                <% if (masComentadas.get(0).getMedia() == 0.0) { %>
                                <ul class="rating nostar">
                                    <% } else {
                                    if (masComentadas.get(0).getMedia() < 2.0) { %>
                                    <ul class="rating onestar">
                                        <% } else {
                                    if (masComentadas.get(0).getMedia() < 3.0) { %>
                                        <ul class="rating twostar">
                                            <% } else {
                                        if (masComentadas.get(0).getMedia() < 4.0) { %>
                                            <ul class="rating threestar">
                                                <% } else {
                                            if (masComentadas.get(0).getMedia() < 5.0) { %>
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
                                <img src="css/images/minicomentario.png" class="img-comments" alt="Nº valoraciones"></img>
                                <span class="comments"><%=masComentadas.get(0).getValoraciones().size()%></span> </div>
                        </div>
                        <div class="movie">
                            <div class="movie-image"><a href="perfilPelicula.jsp?id=<%= masComentadas.get(1).getId()%>"><img src="<%= detalles.get(1).getPoster() %>" alt="" /></a> </div>
                            <div>
                                <% if (masComentadas.get(1).getMedia() == 0.0) { %>
                                <ul class="rating nostar">
                                    <% } else {
                                    if (masComentadas.get(1).getMedia() < 2.0) { %>
                                    <ul class="rating onestar">
                                        <% } else {
                                    if (masComentadas.get(1).getMedia() < 3.0) { %>
                                        <ul class="rating twostar">
                                            <% } else {
                                        if (masComentadas.get(1).getMedia() < 4.0) { %>
                                            <ul class="rating threestar">
                                                <% } else {
                                            if (masComentadas.get(1).getMedia() < 5.0) { %>
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
                                <img src="css/images/minicomentario.png" class="img-comments" alt="Nº valoraciones"></img>
                                <span class="comments"><%=masComentadas.get(1).getValoraciones().size()%></span> </div>
                        </div>
                        <div class="movie">
                            <div class="movie-image"><a href="perfilPelicula.jsp?id=<%= masComentadas.get(2).getId()%>"><img src="<%= detalles.get(2).getPoster() %>" alt="" /></a> </div>
                            <div>
                                <% if (masComentadas.get(2).getMedia() == 0.0) { %>
                                <ul class="rating nostar">
                                    <% } else {
                                    if (masComentadas.get(2).getMedia() < 2.0) { %>
                                    <ul class="rating onestar">
                                        <% } else {
                                    if (masComentadas.get(2).getMedia() < 3.0) { %>
                                        <ul class="rating twostar">
                                            <% } else {
                                        if (masComentadas.get(2).getMedia() < 4.0) { %>
                                            <ul class="rating threestar">
                                                <% } else {
                                            if (masComentadas.get(2).getMedia() < 5.0) { %>
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
                                <img src="css/images/minicomentario.png" class="img-comments" alt="Nº valoraciones"></img>
                                <span class="comments"><%=masComentadas.get(2).getValoraciones().size()%></span> </div>
                        </div>
                        <div class="movie">
                            <div class="movie-image"><a href="perfilPelicula.jsp?id=<%= masComentadas.get(3).getId()%>"><img src="<%= detalles.get(3).getPoster() %>" alt="" /></a> </div>
                            <div>
                                <% if (masComentadas.get(3).getMedia() == 0.0) { %>
                                <ul class="rating nostar">
                                    <% } else {
                                    if (masComentadas.get(3).getMedia() < 2.0) { %>
                                    <ul class="rating onestar">
                                        <% } else {
                                    if (masComentadas.get(3).getMedia() < 3.0) { %>
                                        <ul class="rating twostar">
                                            <% } else {
                                        if (masComentadas.get(3).getMedia() < 4.0) { %>
                                            <ul class="rating threestar">
                                                <% } else {
                                            if (masComentadas.get(3).getMedia() < 5.0) { %>
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
                                <img src="css/images/minicomentario.png" class="img-comments" alt="Nº valoraciones"></img>
                                <span class="comments"><%=masComentadas.get(3).getValoraciones().size()%></span> </div>
                        </div>
                        <div class="movie">
                            <div class="movie-image"><a href="perfilPelicula.jsp?id=<%= masComentadas.get(4).getId()%>"><img src="<%= detalles.get(4).getPoster() %>" alt="" /></a> </div>
                            <div>
                                <% if (masComentadas.get(4).getMedia() == 0.0) { %>
                                <ul class="rating nostar">
                                    <% } else {
                                    if (masComentadas.get(4).getMedia() < 2.0) { %>
                                    <ul class="rating onestar">
                                        <% } else {
                                    if (masComentadas.get(4).getMedia() < 3.0) { %>
                                        <ul class="rating twostar">
                                            <% } else {
                                        if (masComentadas.get(4).getMedia() < 4.0) { %>
                                            <ul class="rating threestar">
                                                <% } else {
                                            if (masComentadas.get(4).getMedia() < 5.0) { %>
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
                                <img src="css/images/minicomentario.png" class="img-comments" alt="Nº valoraciones"></img>
                                <span class="comments"><%=masComentadas.get(4).getValoraciones().size()%></span> </div>
                        </div>
                        <div class="movie last">
                            <div class="movie-image"><a href="perfilPelicula.jsp?id=<%= masComentadas.get(5).getId()%>"><img src="<%= detalles.get(5).getPoster() %>" alt="" /></a> </div>
                            <div>
                                <% if (masComentadas.get(5).getMedia() == 0.0) { %>
                                <ul class="rating nostar">
                                    <% } else {
                                    if (masComentadas.get(5).getMedia() < 2.0) { %>
                                    <ul class="rating onestar">
                                        <% } else {
                                    if (masComentadas.get(5).getMedia() < 3.0) { %>
                                        <ul class="rating twostar">
                                            <% } else {
                                        if (masComentadas.get(5).getMedia() < 4.0) { %>
                                            <ul class="rating threestar">
                                                <% } else {
                                            if (masComentadas.get(5).getMedia() < 5.0) { %>
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
                                <img src="css/images/minicomentario.png" class="img-comments" alt="Nº valoraciones"></img>
                                <span class="comments"><%=masComentadas.get(5).getValoraciones().size()%></span> </div>
                        </div>
                        <div class="cl">&nbsp;</div>
                    </div>
                </div>

                <div id="footer">
                    <p class="lf">Copyright &copy; 2013 <a href="#">Filmly</a> - All Rights Reserved</p>
                    <div style="clear:both;"></div>
                </div>
            </div>

            </div>
            <!-- END PAGE SOURCE -->
    </body>
</html>
