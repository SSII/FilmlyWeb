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
                                           onFocus="if (this.value == 'Usuario') {
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
                                       onFocus="if (this.value == 'Contraseña') {
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
                            <input type="text"   name="search field" value="Busca película..." id="search-field" class="blink search-field"  />
                        </form>
                    </div>


                </div>
                <ul class="dashboard">
                    <li><a href="#">MEJOR VALORADAS</a></li>
                    <li><a href="#">MÁS COMENTADAS</a></li>
                    <li><a href="#">NOVEDADES</a></li>

                </ul>
            </div>
            <div align="center" id="content-registro">
                <br>
                    <table border="0" align="center">
                        <tr>
                            <td>
                                <form action="anadirUsuario.jsp" method="post">
                                    <div id='textarea'>
                                        <input type="text" name="name" class='caja-texto' required maxlength="70" value="Nombre y apellidos" style="height:30px; width:250px; font-size:15px; color:#9c9c9c" 
                                               onfocus="if (this.value == 'Nombre y apellidos') {
                                                           this.value = '';
                                                           this.style.color = '#000000';
                                                       }" 
                                               onblur="if (this.value == '') {
                                                           this.value = 'Nombre y apellidos';
                                                           this.style.color = '#9c9c9c'
                                                       }" />
                                    </div>
                                    <div id='textarea'>
                                        <input type="text" class='caja-texto' name="username" required maxlength="20" value="Nombre de usuario" style="height:30px; width:250px; font-size:15px; color:#9c9c9c" 
                                               onfocus="if (this.value == 'Nombre de usuario') {
                                                           this.value = '';
                                                           this.style.color = '#000000';
                                                       }" 
                                               onblur="if (this.value == '') {
                                                           this.value = 'Nombre de usuario';
                                                           this.style.color = '#9c9c9c'
                                                       }"/>
                                    </div>
                                    <br>
                                        <div id='textarea'>
                                            <input type="text" class='caja-texto' name="password" required maxlength="20" value="Contraseña" style="height:30px; width:250px; font-size:15px; color:#9c9c9c" 
                                                   onfocus="if (this.value == 'Contraseña') {
                                                               this.type = 'password';
                                                               this.value = '';
                                                               this.style.color = '#000000';
                                                           }" 
                                                   onblur="if (this.value == '') {
                                                               this.type = 'text';
                                                               this.value = 'Contraseña';
                                                               this.style.color = '#9c9c9c'
                                                           }" />
                                        </div>
                                        <br>
                                            <div id='textarea'>
                                                <input type="email" class='caja-texto' name="email" required maxlength="50" value="Correo electrónico" style="height:30px; width:250px; font-size:15px; color:#9c9c9c" 
                                                       onfocus="if (this.value == 'Correo electrónico') {
                                                                   this.value = '';
                                                                   this.style.color = '#000000';
                                                               }" 
                                                       onblur="if (this.value == '') {
                                                                   this.value = 'Correo electrónico';
                                                                   this.style.color = '#9c9c9c'
                                                               }" />
                                            </div>
                                            <br>
                                                <div id='submit' class='outerDiv' align="right">
                                                    <input type="submit" value="Crea mi cuenta" class ='botonRegistro'/>
                                                </div>
                                                </form>
                                                </td>
                                                <td width="300"><img align="right" src="images/batman-5.jpg" alt="some_text" width="200" height="200"></td>
                                                </tr>
                                                </table>
                                                </div>


                                                <div id="footer">
                                                    <p class="lf">Copyright &copy; 2013 <a href="#">Filmly</a> - All Rights Reserved</p>
                                                    <div style="clear:both;"></div>
                                                </div>
                                                </div>
                                                <!-- END PAGE SOURCE -->
                                                </body>
                                                </html>
