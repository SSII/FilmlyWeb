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

        <% String nombre = Controlador.getInstancia().getUsuarioLogueado().getNombre();
            int nvaloraciones = Controlador.getInstancia().getUsuarioLogueado().getPeliculasValoradas().size();
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
                            <p><%= "Bienvenido " + nombre%> </p>
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
                <br>
                    <table border="0" align="center" cellpadding="5" cellspacing="5">
                        <!-- Primera fila-->

                        <tr> 
                            <!-- Pelicula 1 -->
                            <td rowspan="2"> 
                                <div class="movie-list-image"> 
                                    <img src="http://ia.media-imdb.com/images/M/MV5BMTkyMTMwNjA3MV5BMl5BanBnXkFtZTcwNzE2NTI2OQ@@._V1_SX300.jpg" height="42" width="42"/>
                                </div>
                            </td>
                            <td><h1>Batman vs. Dracula (2012)</h1>
                                <ul class="rating threestar">
                                    <li class="one"></li>
                                    <li class="two"></li>
                                    <li class="three"></li>
                                    <li class="four"></li>
                                    <li class="five"></li>
                                </ul>
                                <br/>
                                <br/>
                                <br/>
                                <h3>Director:</h3><p><h3>Polla gorda el hornero</h3></p>
                            </td>
                            <td style="padding-right: 50px"/>
                            <td rowspan="2" style="padding-bottom: 50px">
                                <div class="puntuacion rojo">
                                    <div class="valor-puntuacion entero">
                                        4
                                    </div>
                                </div>
                                <div>
                                    <img src="css/images/comentario1.png" height="auto" width="20"/>
                                </div>
                            </td>
                            
                            <!-- Pelicula 2 -->
                            <td style="padding-right: 20px"/>
                            <td rowspan="2"> 
                                <div class="movie-list-image"> 
                                    <img src="http://ia.media-imdb.com/images/M/MV5BMTkyMTMwNjA3MV5BMl5BanBnXkFtZTcwNzE2NTI2OQ@@._V1_SX300.jpg" height="42" width="42"/>
                                </div>
                            </td>
                            <td><h1>Batman vs. Dracula (2012)</h1>
                                <ul class="rating threestar">
                                    <li class="one"></li>
                                    <li class="two"></li>
                                    <li class="three"></li>
                                    <li class="four"></li>
                                    <li class="five"></li>
                                </ul>
                                <br/>
                                <br/>
                                <br/>
                                <h3>Director:</h3><p><h3>Polla gorda el hornero</h3></p>
                            </td>
                            <td style="padding-right: 50px"/>
                            <td rowspan="2" style="padding-bottom: 50px">
                                <div class="puntuacion rojo">
                                    <div class="valor-puntuacion entero">
                                        4
                                    </div>
                                </div>
                                <div>
                                    <img src="css/images/comentario1.png" height="auto" width="20"/>
                                </div>
                            </td>
                             
                             
                            
                        </tr>


                        <!-- Segunda fila-->
                        <tr style="padding-top: 20px"/>
                        <tr> 
                            <!-- Pelicula 1 -->
                            <td rowspan="2"> 
                                <div class="movie-list-image"> 
                                    <img src="http://ia.media-imdb.com/images/M/MV5BMTkyMTMwNjA3MV5BMl5BanBnXkFtZTcwNzE2NTI2OQ@@._V1_SX300.jpg" height="42" width="42"/>
                                </div>
                            </td>
                            <td><h1>Batman vs. Dracula (2012)</h1>
                                <ul class="rating threestar">
                                    <li class="one"></li>
                                    <li class="two"></li>
                                    <li class="three"></li>
                                    <li class="four"></li>
                                    <li class="five"></li>
                                </ul>
                                <br/>
                                <br/>
                                <br/>
                                <h3>Director:</h3><p><h3>Polla gorda el hornero</h3></p>
                            </td>
                            <td style="padding-right: 50px"/>
                            <td rowspan="2" style="padding-bottom: 50px">
                                <div class="puntuacion rojo">
                                    <div class="valor-puntuacion entero">
                                        4
                                    </div>
                                </div>
                                <div>
                                    <img src="css/images/comentario1.png" height="auto" width="20"/>
                                </div>
                            </td>
                            
                            <!-- Pelicula 2 -->
                            <td style="padding-right: 20px"/>
                            <td rowspan="2"> 
                                <div class="movie-list-image"> 
                                    <img src="http://ia.media-imdb.com/images/M/MV5BMTkyMTMwNjA3MV5BMl5BanBnXkFtZTcwNzE2NTI2OQ@@._V1_SX300.jpg" height="42" width="42"/>
                                </div>
                            </td>
                            <td><h1>Batman vs. Dracula (2012)</h1>
                                <ul class="rating threestar">
                                    <li class="one"></li>
                                    <li class="two"></li>
                                    <li class="three"></li>
                                    <li class="four"></li>
                                    <li class="five"></li>
                                </ul>
                                <br/>
                                <br/>
                                <br/>
                                <h3>Director:</h3><p><h3>Polla gorda el hornero</h3></p>
                            </td>
                            <td style="padding-right: 50px"/>
                            <td rowspan="2" style="padding-bottom: 50px">
                                <div class="puntuacion rojo">
                                    <div class="valor-puntuacion entero">
                                        4
                                    </div>
                                </div>
                                <div>
                                    <img src="css/images/comentario1.png" height="auto" width="20"/>
                                </div>
                            </td>
                             
                             
                            
                        </tr>


                        <!-- Tercera fila-->
                        
                        <tr style="padding-top: 20px"/>
                        <tr> 
                            <!-- Pelicula 1 -->
                            <td rowspan="2"> 
                                <div class="movie-list-image"> 
                                    <img src="http://ia.media-imdb.com/images/M/MV5BMTkyMTMwNjA3MV5BMl5BanBnXkFtZTcwNzE2NTI2OQ@@._V1_SX300.jpg" height="42" width="42"/>
                                </div>
                            </td>
                            <td><h1>Batman vs. Dracula (2012)</h1>
                                <ul class="rating threestar">
                                    <li class="one"></li>
                                    <li class="two"></li>
                                    <li class="three"></li>
                                    <li class="four"></li>
                                    <li class="five"></li>
                                </ul>
                                <br/>
                                <br/>
                                <br/>
                                <h3>Director:</h3><p><h3>Polla gorda el hornero</h3></p>
                            </td>
                            <td style="padding-right: 50px"/>
                            <td rowspan="2" style="padding-bottom: 50px">
                                <div class="puntuacion rojo">
                                    <div class="valor-puntuacion entero">
                                        4
                                    </div>
                                </div>
                                <div>
                                    <img src="css/images/comentario1.png" height="auto" width="20"/>
                                </div>
                            </td>
                            
                            <!-- Pelicula 2 -->
                            <td style="padding-right: 20px"/>
                            <td rowspan="2"> 
                                <div class="movie-list-image"> 
                                    <img src="http://ia.media-imdb.com/images/M/MV5BMTkyMTMwNjA3MV5BMl5BanBnXkFtZTcwNzE2NTI2OQ@@._V1_SX300.jpg" height="42" width="42"/>
                                </div>
                            </td>
                            <td><h1>Batman vs. Dracula (2012)</h1>
                                <ul class="rating threestar">
                                    <li class="one"></li>
                                    <li class="two"></li>
                                    <li class="three"></li>
                                    <li class="four"></li>
                                    <li class="five"></li>
                                </ul>
                                <br/>
                                <br/>
                                <br/>
                                <h3>Director:</h3><p><h3>Polla gorda el hornero</h3></p>
                            </td>
                            <td style="padding-right: 50px"/>
                            <td rowspan="2" style="padding-bottom: 50px">
                                <div class="puntuacion rojo">
                                    <div class="valor-puntuacion entero">
                                        4
                                    </div>
                                </div>
                                <div>
                                    <img src="css/images/comentario1.png" height="auto" width="20"/>
                                </div>
                            </td>
                             
                             
                            
                        </tr>


                        <!-- Cuarta fila-->

                        <tr style="padding-top: 20px"/>
                        <tr> 
                            <!-- Pelicula 1 -->
                            <td rowspan="2"> 
                                <div class="movie-list-image"> 
                                    <img src="http://ia.media-imdb.com/images/M/MV5BMTkyMTMwNjA3MV5BMl5BanBnXkFtZTcwNzE2NTI2OQ@@._V1_SX300.jpg" height="42" width="42"/>
                                </div>
                            </td>
                            <td><h1>Batman vs. Dracula (2012)</h1>
                                <ul class="rating threestar">
                                    <li class="one"></li>
                                    <li class="two"></li>
                                    <li class="three"></li>
                                    <li class="four"></li>
                                    <li class="five"></li>
                                </ul>
                                <br/>
                                <br/>
                                <br/>
                                <h3>Director:</h3><p><h3>Polla gorda el hornero</h3></p>
                            </td>
                            <td style="padding-right: 50px"/>
                            <td rowspan="2" style="padding-bottom: 50px">
                                <div class="puntuacion rojo">
                                    <div class="valor-puntuacion entero">
                                        4
                                    </div>
                                </div>
                                <div>
                                    <img src="css/images/comentario1.png" height="auto" width="20"/>
                                </div>
                            </td>
                            
                            <!-- Pelicula 2 -->
                            <td style="padding-right: 20px"/>
                            <td rowspan="2"> 
                                <div class="movie-list-image"> 
                                    <img src="http://ia.media-imdb.com/images/M/MV5BMTkyMTMwNjA3MV5BMl5BanBnXkFtZTcwNzE2NTI2OQ@@._V1_SX300.jpg" height="42" width="42"/>
                                </div>
                            </td>
                            <td><h1>Batman vs. Dracula (2012)</h1>
                                <ul class="rating threestar">
                                    <li class="one"></li>
                                    <li class="two"></li>
                                    <li class="three"></li>
                                    <li class="four"></li>
                                    <li class="five"></li>
                                </ul>
                                <br/>
                                <br/>
                                <br/>
                                <h3>Director:</h3><p><h3>Polla gorda el hornero</h3></p>
                            </td>
                            <td style="padding-right: 50px"/>
                            <td rowspan="2" style="padding-bottom: 50px">
                                <div class="puntuacion rojo">
                                    <div class="valor-puntuacion entero">
                                        4
                                    </div>
                                </div>
                                <div>
                                    <img src="css/images/comentario1.png" height="auto" width="20"/>
                                </div>
                            </td>
                             
                             
                            
                        </tr>


                        <!-- Quinta fila-->
                        
                        <tr style="padding-top: 20px"/>
                        <tr> 
                            <!-- Pelicula 1 -->
                            <td rowspan="2"> 
                                <div class="movie-list-image"> 
                                    <img src="http://ia.media-imdb.com/images/M/MV5BMTkyMTMwNjA3MV5BMl5BanBnXkFtZTcwNzE2NTI2OQ@@._V1_SX300.jpg" height="42" width="42"/>
                                </div>
                            </td>
                            <td><h1>Batman vs. Dracula (2012)</h1>
                                <ul class="rating threestar">
                                    <li class="one"></li>
                                    <li class="two"></li>
                                    <li class="three"></li>
                                    <li class="four"></li>
                                    <li class="five"></li>
                                </ul>
                                <br/>
                                <br/>
                                <br/>
                                <h3>Director:</h3><p><h3>Polla gorda el hornero</h3></p>
                            </td>
                            <td style="padding-right: 50px"/>
                            <td rowspan="2" style="padding-bottom: 50px">
                                <div class="puntuacion rojo">
                                    <div class="valor-puntuacion entero">
                                        4
                                    </div>
                                </div>
                                <div>
                                    <img src="css/images/comentario1.png" height="auto" width="20"/>
                                </div>
                            </td>
                            
                            <!-- Pelicula 2 -->
                            <td style="padding-right: 20px"/>
                            <td rowspan="2"> 
                                <div class="movie-list-image"> 
                                    <img src="http://ia.media-imdb.com/images/M/MV5BMTkyMTMwNjA3MV5BMl5BanBnXkFtZTcwNzE2NTI2OQ@@._V1_SX300.jpg" height="42" width="42"/>
                                </div>
                            </td>
                            <td><h1>Batman vs. Dracula (2012)</h1>
                                <ul class="rating threestar">
                                    <li class="one"></li>
                                    <li class="two"></li>
                                    <li class="three"></li>
                                    <li class="four"></li>
                                    <li class="five"></li>
                                </ul>
                                <br/>
                                <br/>
                                <br/>
                                <h3>Director:</h3><p><h3>Polla gorda el hornero</h3></p>
                            </td>
                            <td style="padding-right: 50px"/>
                            <td rowspan="2" style="padding-bottom: 50px">
                                <div class="puntuacion rojo">
                                    <div class="valor-puntuacion entero">
                                        4
                                    </div>
                                </div>
                                <div>
                                    <img src="css/images/comentario1.png" height="auto" width="20"/>
                                </div>
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
