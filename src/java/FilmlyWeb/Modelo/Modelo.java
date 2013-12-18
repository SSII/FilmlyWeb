/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package FilmlyWeb.Modelo;

import FilmlyWeb.AlgoritmosRecomendacion.AlgoritmoRecomendacion;
import FilmlyWeb.AlgoritmosRecomendacion.KNN;
import FilmlyWeb.AlgoritmosRecomendacion.WeigthedSum;
import FilmlyWeb.Modelo.MapSort.ValueComparator;
import FilmlyWeb.Persistencia.GestorPersistencia;
import java.text.Collator;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
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
        EntityManager em = GestorPersistencia.getInstancia().getEntityManager();
        
        String busqueda = (String)filtro.getValor("Pelicula");
        Query q = em.createNativeQuery("select * from peliculas where titulo like :subcadena and detalles=true", Pelicula.class);
        
        q.setParameter("subcadena", "%" + busqueda + "%");
        
        return q.getResultList();
    }
    
    public Pelicula getDetallesPelicula( String id ){
        return null;
    }
    
    public void anadirValoracion( Valoracion v ){
         EntityManager em = GestorPersistencia.getInstancia().getEntityManager();
                
        Query q = em.createNativeQuery("INSERT INTO valoraciones VALUES(?,?,?,?,?)");
        q.setParameter(1, v.getUsuario().getId());
        q.setParameter(2, v.getPelicula().getId());
        q.setParameter(3, v.getPuntuacion());
        q.setParameter(4, obtenerUltimoIDValoraciones());
        q.setParameter(5, v.getComentario());
        
        em.getTransaction().begin();
        q.executeUpdate();
        em.getTransaction().commit();  
        
        usuarioLogueado.addValoracion(v);
        v.getPelicula().addValoracion(v);
        
        Query q1 = em.createNativeQuery("UPDATE peliculas SET media=:med WHERE id=:identificador");
        q1.setParameter("med", v.getPelicula().getValoracionMedia());
        q1.setParameter("identificador", v.getPelicula().getId());
        
        em.getTransaction().begin();
        q1.executeUpdate();
        em.getTransaction().commit();
        
         Query q2 = em.createNativeQuery("UPDATE peliculas SET valoraciones=:med WHERE id=:identificador");
        q2.setParameter("med", v.getPelicula().getValoraciones().size());
        q2.setParameter("identificador", v.getPelicula().getId());
        
        em.getTransaction().begin();
        q2.executeUpdate();
        em.getTransaction().commit();
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
    
    public Pelicula getPelicula(String titulo){
        EntityManager em = GestorPersistencia.getInstancia().getEntityManager();
        Query q = em.createNativeQuery("select * from peliculas where titulo=:titulo", Pelicula.class);
        q.setParameter("titulo", titulo);
        
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
        Query q = em.createNativeQuery("select * from peliculas where detalles=true order by media desc, titulo asc limit 10 offset :o", Pelicula.class);
        q.setParameter("o", offset);
              
        return q.getResultList();
    }
    
    public List<Pelicula> getPeliculasMasComentadas(int offset){
        EntityManager em = GestorPersistencia.getInstancia().getEntityManager();
        Query q = em.createNativeQuery("select * from peliculas where detalles=true order by valoraciones desc, titulo asc limit 10 offset :o", Pelicula.class);
        q.setParameter("o", offset);
              
        return q.getResultList();
    }
    
    public List<Pelicula> getPeliculasNovedosas(int offset){
        EntityManager em = GestorPersistencia.getInstancia().getEntityManager();
        Query q = em.createNativeQuery("select * from peliculas where detalles=true order by anho desc, titulo asc limit 10 offset :o", Pelicula.class);
        q.setParameter("o", offset);
              
        return q.getResultList();
    } 
    
    public int obtenerUltimoID(){
        EntityManager em = GestorPersistencia.getInstancia().getEntityManager();
        Query q = em.createNativeQuery("select * from usuarios order by id desc", Usuario.class);
        
        return ((Usuario) q.getResultList().get(0)).getId() + 1;
    }
    
    public long obtenerUltimoIDValoraciones(){
        EntityManager em = GestorPersistencia.getInstancia().getEntityManager();
        Query q = em.createNativeQuery("select * from valoraciones order by _id desc", Valoracion.class);
        
        return ((Valoracion) q.getResultList().get(0)).getId() + 1;
    }
    
    public Map<Pelicula,Double> obtenerRecomendaciones(){
        double prediccion;
        AlgoritmoRecomendacion algoritmo = new WeigthedSum(false, null, null, 1, null, 8);
        
        Map<Pelicula, Double> unsortMap = new HashMap<Pelicula, Double>();

        EntityManager em = GestorPersistencia.getInstancia().getEntityManager();
        Query q = em.createNativeQuery("select * from usuarios", Usuario.class);
        List<Usuario> usuariosTotales = q.getResultList();

        KNN knn = new KNN( usuariosTotales, usuarioLogueado, 5, 1);
        List<Usuario> vecinos = knn.evaluar();        
        
        List<Pelicula> peliculasRecomendables = getPeliculas(vecinos);
        
        
        for( Pelicula p : peliculasRecomendables ){
            algoritmo.setParametros(1, vecinos, p, usuarioLogueado, 8);
            prediccion = algoritmo.prediccion();
            
            if(prediccion > 5){
                prediccion = 5;
            }
            
            unsortMap.put(p, prediccion);
        }
       
        Map<Pelicula, Double> sortedMap = sortByComparator(unsortMap);
        for (Map.Entry<Pelicula, Double> entry : sortedMap.entrySet()) {
            System.out.println(entry.getKey());
            System.out.println(entry.getValue());
            
        }

        return sortedMap;
    }
    
    private List<Pelicula> getPeliculas(List<Usuario> usuarios){
        List<Pelicula> resultado = new LinkedList<Pelicula>();
        
        for (Usuario u : usuarios) {
            for (Pelicula p : u.getPeliculasValoradas() ) {
                if( !resultado.contains(p) && p.isDetalles() ){
                    resultado.add(p);
                }
            }
        }
        
        for(Pelicula p : usuarioLogueado.getPeliculasValoradas()){
            if( resultado.contains(p) ){
                resultado.remove(p);
            }
        }
        
        return resultado;
    }
    
    private static Map sortByComparator(Map unsortMap) {
 
            List list = new LinkedList(unsortMap.entrySet());

            // sort list based on comparator
            Collections.sort(list, new Comparator() {
                    public int compare(Object o1, Object o2) {
                            return ((Comparable) ((Map.Entry) (o2)).getValue())
                                   .compareTo(((Map.Entry) (o1)).getValue());
                    }
            });

            // put sorted list into map again
            //LinkedHashMap make sure order in which keys were inserted
            Map sortedMap = new LinkedHashMap();
            for (Iterator it = list.iterator(); it.hasNext();) {
                    Map.Entry entry = (Map.Entry) it.next();
                    sortedMap.put(entry.getKey(), entry.getValue());
            }
            return sortedMap;
    }
    
  
}
