/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package FilmlyWeb.AlgoritmosRecomendacion;
import FilmlyWeb.Modelo.Pelicula;
import FilmlyWeb.Modelo.Usuario;
import java.util.List;

/**
 *
 * @author Alvaro
 */
public interface AlgoritmoRecomendacion {
    
    /** Algoritmo de predicción a implementar */
    public abstract float prediccion();
    
    /** Media de todas la valoraciones hechas por el Usuario */
    public abstract float mediaUsuario();
    
    /** Media de todas la valoraciones hechas por los usuarios a la Pelicula */
    public abstract float mediaPelicula();
    
    /** Modificacion de los parametros del algoritmo de recomendación */
    public void setParametros(int algoritmo, List<Usuario> vecinos, Pelicula pelicula, Usuario usuario, int n);

}
