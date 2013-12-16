/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package FilmlyWeb.Modelo;

import java.io.Serializable;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author Alvaro
 */
@Entity
@Table(name="peliculas")
public class Pelicula implements Serializable {
    
    @Column(name="titulo")
    private String _titulo;
    @Column(name="anho")
    private int _anno;
    @Id
    @Column(name="id")
    private int _id;
    @OneToMany(targetEntity=Valoracion.class, cascade=CascadeType.ALL, mappedBy="_pelicula")
    private List<Valoracion> _valoraciones;
    @Column(name="media")
    private float _media;
    @Column(name="detalles")
    private boolean _detalles;
    
    public Pelicula() {
    }

    public Pelicula(String _titulo, int _anno, int _id, List<Valoracion> _valoraciones, float _media, boolean _detalles) {
        this._titulo = _titulo;
        this._anno = _anno;
        this._id = _id;
        this._valoraciones = _valoraciones;
        this._media = _media;
        this._detalles = _detalles;
    }

    

    public String getTitulo() {
        return _titulo;
    }

    public void setTitulo(String _titulo) {
        this._titulo = _titulo;
    }

    public int getAnno() {
        return _anno;
    }

    public void setAnno(int _anno) {
        this._anno = _anno;
    }

    public int getId() {
        return _id;
    }

    public void setId(int _id) {
        this._id = _id;
    }

    public List<Valoracion> getValoraciones() {
        return _valoraciones;
    }
    
    public void setValoraciones(List<Valoracion> valoraciones) {
        
        _valoraciones = valoraciones;
        
    }
    
    public void addValoracion(Valoracion v){
        
        _valoraciones.add(v);
    }
    
     public float getValoracionMedia(){
        float nota = 0;
        
        for (Valoracion valoracion : _valoraciones) {
            nota += valoracion.getPuntuacion();
        }
        
        if( _valoraciones.isEmpty() ){
            return 0;
        }
        
        return (float) Math.round( nota/_valoraciones.size() * 10 )/10;
    }

    public float getMedia() {
        return _media;
    }

    public void setMedia(float media) {
        this._media = media;
    }

    public void setDetalles(boolean _detalles) {
        this._detalles = _detalles;
    }

    public boolean isDetalles() {
        return _detalles;
    }
    
    
}

