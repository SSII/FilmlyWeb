/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package FilmlyWeb.Vista;

import FilmlyWeb.Controlador.Controlador;
import FilmlyWeb.Controlador.*;
import FilmlyWeb.Modelo.Usuario;

/**
 *
 * @author Pedro
 */
public class Vista implements ObservadorLoginUsuario{
    static Vista instancia = null;
    String usuario;
    String password;
    
    
    private Vista(){
        
    }
    
    public static Vista getInstancia(){
        if (instancia == null){
            instancia = new Vista();
        }
        
        return instancia;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    @Override
    public void cambioLoginUsuario() {
        Usuario u = Controlador.getInstancia().getUsuarioLogueado();
        
        if(u != null ){
            
        } else {
            
        }
    }
}
