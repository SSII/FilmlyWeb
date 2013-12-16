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
                        <li><a href="#">MÁS COMENTADAS</a></li>
                        <li><a href="#">NOVEDADES</a></li>
                        
                    </ul>
            </div>

            <div id="main">
                <div id="content">
                    <div class="box">
                        <div class="head">
                            <h2>Novedades</h2>
                            <p class="text-right"><a href="#">Ver todos</a></p>
                        </div>
                        <div class="movie">
                            <div class="movie-image"> <span class="play"><span class="name">X-MAN</span></span> <a href="#"><img src="css/images/movie1.jpg" alt="" /></a> </div>
                            <div class="rating">
                                <p>RATING</p>
                                <div class="stars">
                                    <div class="stars-in"> </div>
                                </div>
                                <span class="comments">12</span> </div>
                        </div>
                        <div class="movie">
                            <div class="movie-image"> <span class="play"><span class="name">SPIDER MAN 2</span></span> <a href="#"><img src="css/images/movie2.jpg" alt="" /></a> </div>
                            <div class="rating">
                                <p>RATING</p>
                                <div class="stars">
                                    <div class="stars-in"> </div>
                                </div>
                                <span class="comments">12</span> </div>
                        </div>
                        <div class="movie">
                            <div class="movie-image"> <span class="play"><span class="name">SPIDER MAN 3</span></span> <a href="#"><img src="css/images/movie3.jpg" alt="" /></a> </div>
                            <div class="rating">
                                <p>RATING</p>
                                <div class="stars">
                                    <div class="stars-in"> </div>
                                </div>
                                <span class="comments">12</span> </div>
                        </div>
                        <div class="movie">
                            <div class="movie-image"> <span class="play"><span class="name">VALKYRIE</span></span> <a href="#"><img src="css/images/movie4.jpg" alt="" /></a> </div>
                            <div class="rating">
                                <p>RATING</p>
                                <div class="stars">
                                    <div class="stars-in"> </div>
                                </div>
                                <span class="comments">12</span> </div>
                        </div>
                        <div class="movie">
                            <div class="movie-image"> <span class="play"><span class="name">GLADIATOR</span></span> <a href="#"><img src="css/images/movie5.jpg" alt="" /></a> </div>
                            <div class="rating">
                                <p>RATING</p>
                                <div class="stars">
                                    <div class="stars-in"> </div>
                                </div>
                                <span class="comments">12</span> </div>
                        </div>
                        <div class="movie last">
                            <div class="movie-image"> <span class="play"><span class="name">ICE AGE</span></span> <a href="#"><img src="css/images/movie6.jpg" alt="" /></a> </div>
                            <div class="rating">
                                <p>RATING</p>
                                <div class="stars">
                                    <div class="stars-in"> </div>
                                </div>
                                <span class="comments">12</span> </div>
                        </div>
                        <div class="cl">&nbsp;</div>
                    </div>
                    <div class="box">
                        <div class="head">
                            <h2>Mejor valoradas</h2>
                            <p class="text-right"><a href="#">Ver todos</a></p>
                        </div>
                        <div class="movie">
                            <div class="movie-image"> <span class="play"><span class="name">TRANSFORMERS</span></span> <a href="#"><img src="css/images/movie7.jpg" alt="" /></a> </div>
                            <div class="rating">
                                <p>RATING</p>
                                <div class="stars">
                                    <div class="stars-in"> </div>
                                </div>
                                <span class="comments">12</span> </div>
                        </div>
                        <div class="movie">
                            <div class="movie-image"> <span class="play"><span class="name">MAGNETO</span></span> <a href="#"><img src="css/images/movie8.jpg" alt="" /></a> </div>
                            <div class="rating">
                                <p>RATING</p>
                                <div class="stars">
                                    <div class="stars-in"> </div>
                                </div>
                                <span class="comments">12</span> </div>
                        </div>
                        <div class="movie">
                            <div class="movie-image"> <span class="play"><span class="name">KUNG FU PANDA</span></span> <a href="#"><img src="css/images/movie9.jpg" alt="" /></a> </div>
                            <div class="rating">
                                <p>RATING</p>
                                <div class="stars">
                                    <div class="stars-in"> </div>
                                </div>
                                <span class="comments">12</span> </div>
                        </div>
                        <div class="movie">
                            <div class="movie-image"> <span class="play"><span class="name">EAGLE EYE</span></span> <a href="#"><img src="css/images/movie10.jpg" alt="" /></a> </div>
                            <div class="rating">
                                <p>RATING</p>
                                <div class="stars">
                                    <div class="stars-in"> </div>
                                </div>
                                <span class="comments">12</span> </div>
                        </div>
                        <div class="movie">
                            <div class="movie-image"> <span class="play"><span class="name">NARNIA</span></span> <a href="#"><img src="css/images/movie11.jpg" alt="" /></a> </div>
                            <div class="rating">
                                <p>RATING</p>
                                <div class="stars">
                                    <div class="stars-in"> </div>
                                </div>
                                <span class="comments">12</span> </div>
                        </div>
                        <div class="movie last">
                            <div class="movie-image"> <span class="play"><span class="name">ANGELS &amp; DEMONS</span></span> <a href="#"><img src="css/images/movie12.jpg" alt="" /></a> </div>
                            <div class="rating">
                                <p>RATING</p>
                                <div class="stars">
                                    <div class="stars-in"> </div>
                                </div>
                                <span class="comments">12</span> </div>
                        </div>
                        <div class="cl">&nbsp;</div>
                    </div>
                    <div class="box">
                        <div class="head">
                            <h2>Más comentadas</h2>
                            <p class="text-right"><a href="#">Ver todos</a></p>
                        </div>
                        <div class="movie">
                            <div class="movie-image"> <span class="play"><span class="name">HOUSE</span></span> <a href="#"><img src="css/images/movie13.jpg" alt="" /></a> </div>
                            <div class="rating">
                                <p>RATING</p>
                                <div class="stars">
                                    <div class="stars-in"> </div>
                                </div>
                                <span class="comments">12</span> </div>
                        </div>
                        <div class="movie">
                            <div class="movie-image"> <span class="play"><span class="name">VACANCY</span></span> <a href="#"><img src="css/images/movie14.jpg" alt="" /></a> </div>
                            <div class="rating">
                                <p>RATING</p>
                                <div class="stars">
                                    <div class="stars-in"> </div>
                                </div>
                                <span class="comments">12</span> </div>
                        </div>
                        <div class="movie">
                            <div class="movie-image"> <span class="play"><span class="name">MIRRORS</span></span> <a href="#"><img src="css/images/movie15.jpg" alt="" /></a> </div>
                            <div class="rating">
                                <p>RATING</p>
                                <div class="stars">
                                    <div class="stars-in"> </div>
                                </div>
                                <span class="comments">12</span> </div>
                        </div>
                        <div class="movie">
                            <div class="movie-image"> <span class="play"><span class="name">THE KINGDOM</span></span> <a href="#"><img src="css/images/movie16.jpg" alt="" /></a> </div>
                            <div class="rating">
                                <p>RATING</p>
                                <div class="stars">
                                    <div class="stars-in"> </div>
                                </div>
                                <span class="comments">12</span> </div>
                        </div>
                        <div class="movie">
                            <div class="movie-image"> <span class="play"><span class="name">MOTIVES</span></span> <a href="#"><img src="css/images/movie17.jpg" alt="" /></a> </div>
                            <div class="rating">
                                <p>RATING</p>
                                <div class="stars">
                                    <div class="stars-in"> </div>
                                </div>
                                <span class="comments">12</span> </div>
                        </div>
                        <div class="movie last">
                            <div class="movie-image"> <span class="play"><span class="name">THE PRESTIGE</span></span> <a href="#"><img src="css/images/movie18.jpg" alt="" /></a> </div>
                            <div class="rating">
                                <p>RATING</p>
                                <div class="stars">
                                    <div class="stars-in"> </div>
                                </div>
                                <span class="comments">12</span> </div>
                        </div>
                        <div class="cl">&nbsp;</div>
                    </div>
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
