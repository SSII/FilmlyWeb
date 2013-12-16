/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package FilmlyWeb.AlgoritmosRecomendacion;

import FilmlyWeb.MedidasSimilitud.Pearson;
import FilmlyWeb.MedidasSimilitud.Coseno;
import FilmlyWeb.MedidasSimilitud.MedidaSimilitud;
import FilmlyWeb.Modelo.Pelicula;
import FilmlyWeb.Modelo.Usuario;
import FilmlyWeb.Modelo.Valoracion;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 *
 * @author grupo 12
 */
public class WeigthedSum implements AlgoritmoRecomendacion {
    
    int algoritmo;
    MedidaSimilitud medida; // medida de similitud (Coseno = 0 o Pearson = 1)
    Usuario usuario; // Usuario actual
    Pelicula pelicula; // Película actual
    boolean ws; // Tipo de algoritmo; true WS, false WA
    Map<Usuario,Valoracion> valoracionesVecinos; // Mapa de valoraciones comunes;
    int n; // Tipo de algoritmo; -1 algoritmo general o n mayor que 0, n-dados
    List<Valoracion> valoraciones;
    

    public WeigthedSum(boolean ws, Usuario usuario, Pelicula pelicula, int algoritmo, List<Usuario> vecinos, int n) {
        this.ws = ws;
        this.usuario = usuario;
        this.pelicula = pelicula;
        this.algoritmo = algoritmo;
        this.valoracionesVecinos = new HashMap();
        
        if(vecinos != null){
            for (Usuario u:vecinos){
                 Valoracion vUsuario = u.getValoracion(pelicula);
                 if (vUsuario != null){
                     valoracionesVecinos.put(u, vUsuario);
                 }   
             }
        }
        
        if (n != -1){
            this.n = n;
        }else{
            if(usuario != null){
                this.n = this.usuario.getValoraciones().size();
            }
        }
               
    }
    
    @Override
    public float mediaUsuario(){
        
        float media = 0;
        
        for(Valoracion v: valoraciones){
            media += (float)v.getPuntuacion();
        }  
        
        return media/n;
        
    }
    
    public float mediaUsuario (Usuario u){
        float media = 0;
        
        for(Valoracion v:u.getValoraciones()){
            media += (float)v.getPuntuacion();
        }        
        
        return media/u.getValoraciones().size();
    }
    
    @Override
    public float mediaPelicula(){
        
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        
    }

    @Override
    public double prediccion() {
        float num = 0, den = 0;
        
        /* Sumatoria de la similitud de todos los usuarios que han votado la Pelicula
           con el Usuario. Denominador común de ambos algoritmos*/
        List<Usuario> valoracionesVecinosAux = new LinkedList(valoracionesVecinos.keySet());
            
        if (ws){
           // System.out.println("EMPIEZA VECINO");
            for (int i=0; i<valoracionesVecinosAux.size(); ++i){
                if (algoritmo == 0){
                    medida = new Coseno(usuario, valoracionesVecinosAux.get(i));
                }else{
                    medida = new Pearson(usuario, valoracionesVecinosAux.get(i));
                }
              //  System.out.println("SIMILITUD " + medida.similitud());

                den += medida.similitud();
                num += (float)valoracionesVecinos.get(valoracionesVecinosAux.get(i)).getPuntuacion() * medida.similitud();
            }
          //  System.out.println("ACABA VECINO");
          
            if(den == 0){
                return 0;
            } else {
                return num/den;
            }
           
        }else{
            float media = mediaUsuario();
            for (int i=0; i<valoracionesVecinosAux.size(); ++i){
                if (algoritmo == 0){
                    medida = new Coseno(usuario, valoracionesVecinosAux.get(i));
                }else{
                    medida = new Pearson(usuario, valoracionesVecinosAux.get(i));
                }
                den += medida.similitud();
                num += ((float)valoracionesVecinos.get(valoracionesVecinosAux.get(i)).getPuntuacion() - mediaUsuario(valoracionesVecinosAux.get(i))) * medida.similitud();
            }
            
            if(den == 0){
                return 0;
            } else {
                return media + num/den;
            }
        }
    }
        
    @Override
     public void setParametros(int algoritmo, List<Usuario> vecinos, Pelicula pelicula, Usuario usuario, int n) {
        this.algoritmo = algoritmo;
        valoracionesVecinos.clear();
        valoraciones = new LinkedList(usuario.getValoraciones());
        valoraciones.remove( usuario.getValoracion(pelicula) );

      
        for (Usuario u:vecinos){
            Valoracion vUsuario = u.getValoracion(pelicula);
            if (vUsuario != null){
                valoracionesVecinos.put(u,vUsuario);
            }   
        }
        
        this.pelicula = pelicula;
        this.usuario = usuario;
        
        if (n != -1){
            if(n > valoraciones.size()){
                this.n = n;
            } else {
                this.n = valoraciones.size();
            }
        }else{
            this.n = valoraciones.size();
        }
   }   
}
