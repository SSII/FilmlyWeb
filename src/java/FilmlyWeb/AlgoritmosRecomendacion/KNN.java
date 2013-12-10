/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package FilmlyWeb.AlgoritmosRecomendacion;

import FilmlyWeb.MedidasSimilitud.Pearson;
import FilmlyWeb.MedidasSimilitud.Coseno;
import FilmlyWeb.MedidasSimilitud.MedidaSimilitud;
import FilmlyWeb.Modelo.Usuario;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 *
 * @author Graciano
 */
public class KNN {
    
    List<Usuario> _entrenamiento;
    Map<Usuario, Float> _vecinos;
    Usuario _ejemplo;
    int _k;
    MedidaSimilitud _algoritmoSimilitud;
    int _indiceAlgoritmo;

    public KNN(List<Usuario> _entrenamiento, Usuario _ejemplo, int _k, int _indiceAlgoritmo) {
        this._entrenamiento = _entrenamiento;
        this._ejemplo = _ejemplo;
        this._k = _k;
        this._indiceAlgoritmo = _indiceAlgoritmo;
        this._vecinos = new HashMap();
    }
    
    public KNN(List<Usuario> _entrenamiento, int _k, MedidaSimilitud _algoritmoSimilitud) {
        this._entrenamiento = _entrenamiento;
        this._k = _k;
        this._algoritmoSimilitud = _algoritmoSimilitud;
        this._vecinos = new HashMap();
    }

    public void setEjemplo(Usuario _ejemplo) {
        this._ejemplo = _ejemplo;
    }

    public void setK(int _k) {
        this._k = _k;
    }
    
    public Usuario peorUsuario (){
        float sim = 1;
        Usuario menor = null;
        
        
        for(Usuario u:_vecinos.keySet()){
            if (_vecinos.get(u) <= sim){
                menor = u;
                sim = _vecinos.get(u);
            }
        }
        return menor;
    }
    
    public List<Usuario> evaluar(){
        
        for(Usuario u:_entrenamiento){
            if (_indiceAlgoritmo == 0){
                _algoritmoSimilitud = new Coseno (u, _ejemplo);
            }else{
                _algoritmoSimilitud = new Pearson (u, _ejemplo);
            }
            

            float similitud = _algoritmoSimilitud.similitud();        
            
        
           
                
            if (_vecinos.size() < _k){
                _vecinos.put(u, similitud);   
            }else{
                if (_vecinos.get(peorUsuario()) < similitud){
                    _vecinos.remove(peorUsuario());
                    _vecinos.put(u, similitud);
                }
            }
        }
        
        List<Usuario> listaUsuarios = new LinkedList();
        
        listaUsuarios.addAll(_vecinos.keySet());
               
        return listaUsuarios;
    }
    
}
