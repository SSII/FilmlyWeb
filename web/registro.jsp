<%@page import="FilmlyWeb.Controlador.Controlador"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Filmly</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
        <link href='http://fonts.googleapis.com/css?family=Baumans' rel='stylesheet' type='text/css'>
            <!--<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
            <script type="text/javascript" src="js/jquery-func.js"></script>-->
            <!--[if IE 6]><link rel="stylesheet" href="css/ie6.css" type="text/css" media="all" /><![endif]-->
    </head>
    <body>
        <!-- START PAGE SOURCE -->
        <div id="shell">
            <div id="header">
                <h1 id="logo"><a href="index.jsp">Filmly</a></h1>
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
                        <li><a class="active" href="#">HOME</a></li>
                        <li><a href="#">NEWS</a></li>
                        <li><a href="#">IN THEATERS</a></li>
                        <li><a href="#">COMING SOON</a></li>
                        <li><a href="#">CONTACT</a></li>
                        <li><a href="#">ADVERTISE</a></li>
                    </ul>
                </div>
                <div id="sub-navigation">
                    <ul>
                        <li><a href="#">MEJOR VALORADAS</a></li>
                        <li><a href="#">MÁS COMENTADAS</a></li>
                        <li><a href="#">NOVEDADES</a></li>
                    </ul>
                    <div id="search">
                        <form action="#" method="get" accept-charset="utf-8">
                            <label for="search-field">SEARCH</label>
                            <input type="text" name="search field" value="Enter search here" id="search-field" class="blink search-field"  />
                            <input type="submit" value="GO!" class="search-button" />
                        </form>
                    </div>
                </div>
            </div>
            <div>
                <div>
                    <div align="center" id="sub-navigation">
                        <br>
                        <table border="0" align="center">
                            <tr>
                                <td>
                                    <form action="AnadirUsuario" method="post">
                                        <div id='textarea' class='outerDiv'>
                                            <input type="text" name="name" required maxlength="70 "value="Nombre y apellidos" style="height:30px; width:200px; font-size:15px; color:#9c9c9c" 
                                                   onclick="if(this.value=='Nombre y apellidos'){ this.value=''; this.style.color='#000000';}" 
                                                   onblur="if(this.value==''){ this.value='Nombre y apellidos'; this.style.color='#9c9c9c' }" />
                                        </div>
                                        <br>
                                        <div id='textarea' class='outerDivS'>
                                            <input type="text" name="username" required maxlength="20" value="Nombre de usuario" style="height:30px; width:200px; font-size:15px; color:#9c9c9c" 
                                                   onclick="if(this.value=='Nombre de usuario'){ this.value=''; this.style.color='#000000';}" 
                                                   onblur="if(this.value==''){ this.value='Nombre de usuario'; this.style.color='#9c9c9c' }"/>
                                        </div>
                                        <br>
                                        <div id='textarea' class='outerDiv' >
                                            <input type="text" name="password" required maxlength="20" value="Contraseña" style="height:30px; width:200px; font-size:15px; color:#9c9c9c" 
                                                   onclick="if(this.value=='Contraseña'){ this.type='password'; this.value=''; this.style.color='#000000';}" 
                                                   onblur="if(this.value==''){this.type='text'; this.value='Contraseña'; this.style.color='#9c9c9c' }" />
                                        </div>
                                            <br>
                                        <div id='textarea' class='outerDiv'>
                                            <input type="email" name="email" required maxlength="50" value="Correo electrónico" style="height:30px; width:200px; font-size:15px; color:#9c9c9c" 
                                                   onclick="if(this.value=='Correo electrónico'){ this.value=''; this.style.color='#000000';}" 
                                                   onblur="if(this.value==''){ this.value='Correo electrónico'; this.style.color='#9c9c9c' }" />
                                        </div>
                                                <br>
                                        <div id='submit' class='outerDiv' align="right">
                                            <input type="submit" value="Crea mi cuenta" class ='myButton'/>
                                        </div>
                                    </form>
                                </td>
                                <td width="300"><img align="right" src="images/batman-5.jpg" alt="some_text" width="200" height="200"></td>
                            </tr>
                        </table>
                    </div>
                </div>           
            </div>


            <div id="footer">
                <p class="lf">Copyright &copy; 2013 <a href="#">Filmly</a> - All Rights Reserved</p>
                <div style="clear:both;"></div>
            </div>
        </div>
        <!-- END PAGE SOURCE -->
    </body>
</html>
