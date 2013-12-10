/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package FilmlyWeb.MedidasSimilitud;

import FilmlyWeb.Modelo.Pelicula;
import FilmlyWeb.Modelo.Usuario;
import FilmlyWeb.Modelo.Valoracion;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author grupo 12
 */
public class Pearson implements MedidaSimilitud {
    
    Usuario u;
    Usuario i;
    Map<Pelicula, Pair<Valoracion, Valoracion>> valoraciones; 
    
    public Pearson(Usuario u, Usuario i) {
        
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
         
    private float mediaUsuario(Usuario u){
        
        float media = 0;
        
        for (Pair<Valoracion, Valoracion> p:valoraciones.values()){
            if (p.getFirst().getUsuario().equals(u)){
                media += p.getFirst().getPuntuacion();
            }else{
                media += p.getSecond().getPuntuacion();
            }
         }

        if( valoraciones.isEmpty() ){
            return 0;
        } else {
            return media/valoraciones.size();
        }
    }
    
    
    
    @Override
    public float similitud() {
        float num = 0, factor1 = 0, factor2 = 0;
        float mediaUsuarioU = mediaUsuario(u);
        float mediaUsuarioI = mediaUsuario(i);
        
        for (Pelicula j:valoraciones.keySet()){
            Valoracion vu = u.getValoracion(j);
            Valoracion vi = i.getValoracion(j);
            if (vu != null && vi != null){
                num += (vu.getPuntuacion() - mediaUsuarioU) * (vi.getPuntuacion() - mediaUsuarioI);
                factor1 += Math.pow((vu.getPuntuacion() - mediaUsuarioU), 2);
                factor2 += Math.pow((vi.getPuntuacion() - mediaUsuarioI), 2);                
            }   
        }

       
        //Medida de similitud transformada
        //
        if( factor2 == 0 || factor1 == 0 ){
            return 0;
        } else {
            return (num / (float)Math.sqrt(factor1 * factor2) + 1 ) / 2;
        }
    }
    
}
