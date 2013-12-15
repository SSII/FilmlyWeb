/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package FilmlyWeb.Modelo;

import FilmlyWeb.Persistencia.GestorPersistencia;
import java.util.LinkedList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;

/**
 *
 * @author Pedro
 */
public class Modelo {
    List<ObservadorCambioRankingMasComentado> _observadoresMasComentada;
    List<ObservadorCambioRankingMasValorada> _observadoresMasValorada;
    List<ObservadorCambioUsuarioLogueado> _observadoresUsuarioLogueado;
    List<ObservadorPeliculaVisualizada> _observadoresPeliculaVisualizada;
    Usuario usuarioLogueado;
    

    public Modelo() {
        _observadoresMasComentada = new LinkedList();
        _observadoresMasValorada = new LinkedList();
        _observadoresPeliculaVisualizada = new LinkedList();
        _observadoresUsuarioLogueado = new LinkedList();
        GestorPersistencia.crearConexion();
    }   
    
    
    private void notificarCambioUsuarioLogueado(){
        for (ObservadorCambioUsuarioLogueado o : _observadoresUsuarioLogueado) {
            o.cambioUsuarioLogeado();
        }
        
    }
    
    private void notificarCambioRankingMasValoradas(){
        
    }
    
    private void notificarCambioRankingMasComentadas(){
        
    }
    
    private void notificarCambioPeliculaVisualizada(){
        
    }
    
    public void registrarObservadorCambioUsuarioLogueado(ObservadorCambioUsuarioLogueado o){
        _observadoresUsuarioLogueado.add(o);        
    }
    
    public void registrarObservadorCambioRankingMasValoradas(){
        
    }
    
    public void registrarObservadorCambioRankingMasComentadas(){
        
    }
    
    public void registrarObservadorPeliculaVisualizada(){
        
    }
    
    public void anadirUsuario( Usuario usuario ){
        EntityManager em = GestorPersistencia.getInstancia().getEntityManager();
                
        Query q = em.createNativeQuery("INSERT INTO usuarios VALUES(?,?,?,?,?)");
        q.setParameter(1, usuario.getId());
        q.setParameter(2, usuario.getNombre());
        q.setParameter(3, usuario.getNick());
        q.setParameter(4, usuario.getPass());
        q.setParameter(5, usuario.getEmail());
        
        em.getTransaction().begin();
        q.executeUpdate();
        em.getTransaction().commit();
        
        usuarioLogueado = usuario;
        
        notificarCambioUsuarioLogueado();
    }
    
    public List<Pelicula> buscaPelicula( Filtro filtro ){
        return null;
    }
    
    public Pelicula getDetallesPelicula( String id ){
        return null;
    }
    
    public void anadirValoracion( Valoracion v ){
        
    }
    
    public Usuario getUsuarioLogueado(){
        return usuarioLogueado;
    }
    
    public Usuario getUsuario(String s){
        return null;
    }
    
    public Pelicula getPelicula(int id){
        EntityManager em = GestorPersistencia.getInstancia().getEntityManager();
        Query q = em.createNativeQuery("select * from peliculas where id=:id", Pelicula.class);
        q.setParameter("id", id);
        
        return (Pelicula) q.getResultList().get(0);
    }
    
    public Valoracion getValoracion(Usuario u, Pelicula p){
        return null;
    }
    
    public List<Valoracion> getValoraciones(Usuario u){
        return null;
    }
    
    public void loginUsuario(String u, String p){
        EntityManager em = GestorPersistencia.getInstancia().getEntityManager();
        Query q = em.createNativeQuery("select * from usuarios where nick=:u and pass=:p", Usuario.class);
        q.setParameter("u", u);
        q.setParameter("p", p);
        
        List<Usuario> lista = q.getResultList();
        
        if( lista.isEmpty() ){
            usuarioLogueado = null;
        } else {
            usuarioLogueado = lista.get(0);
        }
        
        notificarCambioUsuarioLogueado();
    }
    
    public void logout(){
        usuarioLogueado = null;
        
        notificarCambioUsuarioLogueado();
    }
    
    public DetallesPelicula getDetallesPelicula(Pelicula p){
        DetallesPelicula detalles = new DetallesPelicula(p);
        
        return detalles;
    }
    
    public List<Pelicula> getPeliculasMasValoradas(int offset){
        EntityManager em = GestorPersistencia.getInstancia().getEntityManager();
        //Query q = em.createNativeQuery("select * from peliculas order by media desc, titulo asc limit 10 offset :o", Pelicula.class);
        Query q = em.createNativeQuery("select * from peliculas where detalles=true order by media desc, titulo asc limit 10 offset :o", Pelicula.class);
        q.setParameter("o", offset);
              
        return q.getResultList();
    }
    
    public int obtenerUltimoID(){
        EntityManager em = GestorPersistencia.getInstancia().getEntityManager();
        Query q = em.createNativeQuery("select * from usuarios order by id desc", Usuario.class);
        
        return ((Usuario) q.getResultList().get(0)).getId() + 1;
    }
}
