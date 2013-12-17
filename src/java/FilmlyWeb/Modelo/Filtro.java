/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package FilmlyWeb.Modelo;

import java.util.Map;

/**
 *
 * @author Pedro
 */
public class Filtro {
    
    Map _mapa;
    
    
    public Filtro(Map mapa){
        _mapa = mapa;
    }
    
    public Object getValor (String entrada){
        return _mapa.get(entrada);
    }
    
}
