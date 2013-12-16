<%@page import="FilmlyWeb.Modelo.DetallesPelicula"%>
<%@page import="java.util.LinkedList"%>
<%@page import="FilmlyWeb.Controlador.Controlador"%>
<%@page import="java.util.List"%>
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
    </head>
    <body>
        <!-- START PAGE SOURCE -->
       <% List<Pelicula> masValoradas = Controlador.getInstancia().getPeliculasMasValoradas(0);
            List<DetallesPelicula> detalles = new LinkedList();

            for (Pelicula p : masValoradas) {
                detalles.add(Controlador.getInstancia().getDetallesPelicula(p));
            }%>

        <div id="shell">
            <div id="header">
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

                <div id="cssBusqueda">
                    <div id="search">
                        <form action="#" method="get" accept-charset="utf-8">
                            <input type="text"   name="search field" value="Busca una película..." id="search-field" class="blink search-field" 
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
                        <li><a href="mejorValoradas.jsp?index=0">MEJOR VALORADAS</a></li>
                        <li><a href="masComentadas.jsp?index=0">MÁS COMENTADAS</a></li>
                        <li><a href="novedades.jsp?index=0">NOVEDADES</a></li>
                        
                    </ul>
            </div>

            <div id="main">
                <div id="content">
                    <div class="box">
                        <div class="head">
                            <h2>Mejor valoradas</h2>
                            <p class="text-right"><a href="#">Ver todos</a></p>
                        </div>
                        <div class="movie">
                            <div class="movie-image"> <span class="play"><span class="name">X-MAN</span></span> <a href="#"><img src="<%= detalles.get(0).getPoster() %>" alt="" /></a> </div>
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
                            <div class="movie-image"> <span class="play"><span class="name">SPIDER MAN 2</span></span> <a href="#"><img src="<%= detalles.get(1).getPoster() %>" alt="" /></a> </div>
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
                            <div class="movie-image"> <span class="play"><span class="name">SPIDER MAN 3</span></span> <a href="#"><img src="<%= detalles.get(2).getPoster() %>" alt="" /></a> </div>
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
                            <div class="movie-image"> <span class="play"><span class="name">VALKYRIE</span></span> <a href="#"><img src="<%= detalles.get(3).getPoster() %>" alt="" /></a> </div>
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
                            <div class="movie-image"> <span class="play"><span class="name">GLADIATOR</span></span> <a href="#"><img src="<%= detalles.get(4).getPoster() %>" alt="" /></a> </div>
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
                            <p class="text-right"><a href="#">Ver todos</a></p>
                        </div>
                        <div class="movie">
                            <div class="movie-image"> <span class="play"><span class="name">TRANSFORMERS</span></span> <a href="#"><img src="<%= detalles.get(0).getPoster() %>" alt="" /></a> </div>
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
                            <div class="movie-image"> <span class="play"><span class="name">MAGNETO</span></span> <a href="#"><img src="<%= detalles.get(1).getPoster() %>" alt="" /></a> </div>
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
                            <div class="movie-image"> <span class="play"><span class="name">KUNG FU PANDA</span></span> <a href="#"><img src="<%= detalles.get(2).getPoster() %>" alt="" /></a> </div>
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
                            <div class="movie-image"> <span class="play"><span class="name">EAGLE EYE</span></span> <a href="#"><img src="<%= detalles.get(3).getPoster() %>" alt="" /></a> </div>
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
                            <div class="movie-image"> <span class="play"><span class="name">NARNIA</span></span> <a href="#"><img src="<%= detalles.get(7).getPoster() %>" alt="" /></a> </div>
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
                            <div class="movie-image"> <span class="play"><span class="name">ANGELS &amp; DEMONS</span></span> <a href="#"><img src="<%= detalles.get(5).getPoster() %>" alt="" /></a> </div>
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
                            <p class="text-right"><a href="#">Ver todos</a></p>
                        </div>
                        <div class="movie">
                            <div class="movie-image"> <span class="play"><span class="name">HOUSE</span></span> <a href="#"><img src="<%= detalles.get(0).getPoster() %>" alt="" /></a> </div>
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
                            <div class="movie-image"> <span class="play"><span class="name">VACANCY</span></span> <a href="#"><img src="<%= detalles.get(1).getPoster() %>" alt="" /></a> </div>
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
                            <div class="movie-image"> <span class="play"><span class="name">MIRRORS</span></span> <a href="#"><img src="<%= detalles.get(2).getPoster() %>" alt="" /></a> </div>
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
                            <div class="movie-image"> <span class="play"><span class="name">THE KINGDOM</span></span> <a href="#"><img src="<%= detalles.get(3).getPoster() %>" alt="" /></a> </div>
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
                            <div class="movie-image"> <span class="play"><span class="name">MOTIVES</span></span> <a href="#"><img src="<%= detalles.get(4).getPoster() %>" alt="" /></a> </div>
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
                            <div class="movie-image"> <span class="play"><span class="name">THE PRESTIGE</span></span> <a href="#"><img src="<%= detalles.get(5).getPoster() %>" alt="" /></a> </div>
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
