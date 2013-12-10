/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package FilmlyWeb.Controlador;

import FilmlyWeb.Modelo.Pelicula;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author Pedro
 */
public class Controlador {
    
    List<ObservadorBusquedaPelicula> _observadoresBusquedaPelicula;
    List<ObservadorNuevaValoracion> _observadoresNuevaValoracion;
    List<ObservadorNuevoComentario> _observadoresNuevoComentario;
    List<ObservadorNuevoUsuario> _observadoresNuevoUsuario;
    List<ObservadorPerfilPelicula> _observadoresPerfilPelicula;
    List<ObservadorLoginUsuario> _observadoresLoginUsuario;
    static Controlador instancia = null;
    
    private Controlador(){
        _observadoresBusquedaPelicula = new LinkedList();
        _observadoresLoginUsuario = new LinkedList();
        _observadoresNuevaValoracion = new LinkedList();
        _observadoresNuevoComentario = new LinkedList();
        _observadoresNuevoUsuario = new LinkedList();
        _observadoresPerfilPelicula = new LinkedList();
        
    }
    
    public static Controlador getInstancia(){
        if (instancia == null){
            instancia = new Controlador();
        }
        
        return instancia;
    }
    
    private void notificarCambioPeliculasBuscadas(){
        
    }
    
    private void notificarNuevaValoracion(){
        
    }
    
    private void notificarNuevoComentario(){
        
    }
    
    private void notificarCambioPeliculaVisualizada(){
        
    }
    
    private void notificarNuevoUsuario(){
        
    }
    
    private void notificarCambioLogin(){
        
    }
    
    public void registrarObservadorBusquedaPelicula(){
        
    }
    
    public void registrarObservadorNuevaValoracion(){
        
    }
    
    public void registrarObservadorNuevoComentario(){
        
    }
    
    public void registrarObservadorNuevoUsuario(){
        
    }
    
    public void registrarObservadorBusquedaUsuario(){
        
    }
    
    public void registrarObservadorLoginUsuario(){
        
    }
    
    public List<Pelicula> getPeliculasBuscadas(){
        return null;
    }
    
}
