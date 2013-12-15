/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package FilmlyWeb.Controlador;

import FilmlyWeb.Modelo.*;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author Pedro
 */
public class Controlador implements ObservadorCambioUsuarioLogueado{
    
    List<ObservadorBusquedaPelicula> _observadoresBusquedaPelicula;
    List<ObservadorNuevaValoracion> _observadoresNuevaValoracion;
    List<ObservadorNuevoComentario> _observadoresNuevoComentario;
    List<ObservadorNuevoUsuario> _observadoresNuevoUsuario;
    List<ObservadorPerfilPelicula> _observadoresPerfilPelicula;
    List<ObservadorLoginUsuario> _observadoresLoginUsuario;
    Modelo modelo;
    List<Pelicula> _peliculasMasValoradas;
    List<Pelicula> _peliculasMasComentadas;
    List<Pelicula> _peliculasNovedades;
    int idUsuario;
    
    static Controlador instancia = null;
    
    private Controlador(){
        _observadoresBusquedaPelicula = new LinkedList();
        _observadoresLoginUsuario = new LinkedList();
        _observadoresNuevaValoracion = new LinkedList();
        _observadoresNuevoComentario = new LinkedList();
        _observadoresNuevoUsuario = new LinkedList();
        _observadoresPerfilPelicula = new LinkedList();
        _peliculasMasComentadas = new LinkedList();
        _peliculasMasValoradas = new LinkedList();
        _peliculasNovedades = new LinkedList();
        
        
        modelo = new Modelo();
        
        modelo.registrarObservadorCambioUsuarioLogueado(this);
        
        idUsuario = modelo.obtenerUltimoID();
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
        for (ObservadorLoginUsuario o : _observadoresLoginUsuario) {
            o.cambioLoginUsuario();
        }
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

    @Override
    public void cambioUsuarioLogeado() {
            
          notificarCambioLogin();       
    }
    
    public void loginUsuario(String usuario, String pass){
        modelo.loginUsuario(usuario, pass);
    }
    
    public Usuario getUsuarioLogueado(){
        return modelo.getUsuarioLogueado();
    }
    
    public void logout(){
        modelo.logout();
    }
    
    public DetallesPelicula getDetallesPelicula(Pelicula p){
        return modelo.getDetallesPelicula(p);
    }
    
    public List<Pelicula> getPeliculasMasValoradas(int offset){
            _peliculasMasValoradas = modelo.getPeliculasMasValoradas(offset);
       
        return _peliculasMasValoradas;
    }
    
    public void anadirUsuario(String nombre, String nick, String claveCodificada, String email){
        
        System.out.println("NICK: " + nick);
        System.out.println("ID: " + idUsuario);
        
        modelo.anadirUsuario( new Usuario(nombre, nick, claveCodificada, email, idUsuario));
        
        idUsuario++;
    }
    
}
