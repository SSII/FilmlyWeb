/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package FilmlyWeb.Persistencia;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;


/**
 *
 * @author Ezequiel J.
 */
public class GestorPersistencia {
    
    EntityManagerFactory emf;
    EntityManager em;
    static GestorPersistencia instancia = null;
    
    
    private GestorPersistencia() {
        
        emf = Persistence.createEntityManagerFactory("FilmlyWebPU");
        em = emf.createEntityManager();
        
    }

    public EntityManager getEntityManager() {
        return em;
    }
    
    public static void crearConexion() {
        
        if (instancia == null) {
            
            instancia = new GestorPersistencia();
            
        }
        
    }

    public static GestorPersistencia getInstancia() {
        return instancia;
    }
    
    public static void desconectar() {
        
        if (instancia != null) {
            
            instancia.em.getTransaction().begin();
            instancia.em.createNativeQuery("shutdown").executeUpdate();
            instancia.em.getTransaction().commit();
            instancia.em.close();
            instancia.emf.close();
            instancia = null;
            
        }
        
    }
    
    
}
