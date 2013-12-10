/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package FilmlyWeb.MedidasSimilitud;

import FilmlyWeb.Modelo.Pelicula;
import FilmlyWeb.Modelo.Usuario;
import FilmlyWeb.Modelo.Valoracion;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author grupo 12
 */
public class Coseno implements MedidaSimilitud {

    Usuario u;
    Usuario i;
    Map<Pelicula, Pair<Valoracion, Valoracion>> valoraciones; 

    public Coseno(Usuario u, Usuario i){
        this.u = u;
        this.i = i;
        valoraciones = new HashMap();
        
        for (Valoracion v1:u.getValoraciones()){
            for (Valoracion v2:i.getValoraciones()){
                if (v1.getPelicula().equals(v2.getPelicula())){
                    valoraciones.put(v1.getPelicula(), new Pair(v1, v2));
                }
            }
        }
    }
    

    @Override
    public float similitud() {
        float num = 0, factor1 = 0, factor2 = 0;
        
        for (Pelicula j:valoraciones.keySet()){
            Valoracion vu = u.getValoracion(j);
            Valoracion vi = i.getValoracion(j);
            if (vu != null && vi != null){
                num += vu.getPuntuacion() * vi.getPuntuacion();
                factor1 += Math.pow(vu.getPuntuacion(), 2);
                factor2 += Math.pow(vi.getPuntuacion(), 2);
            }   
        }
         
        if( valoraciones.isEmpty() ){
            return 0;
        } else {
            return num / (float)(Math.sqrt(factor1) * Math.sqrt(factor2));
        }

    }
    
}
