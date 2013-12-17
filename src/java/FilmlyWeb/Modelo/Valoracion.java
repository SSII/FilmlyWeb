/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package FilmlyWeb.Modelo;

import java.io.Serializable;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author grupo 12
 */

@Entity
@Table(name="valoraciones")
public class Valoracion implements Serializable {
    @Id
    @GeneratedValue
    Long _id;
    
    @Column(name="rate")
    private int _puntuacion;
    
    @Column(name="comentario")
    String _comentario;
    
    @ManyToOne(cascade=CascadeType.ALL, fetch=FetchType.EAGER)
    @JoinColumn(name="idUser", referencedColumnName = "id")
    private Usuario _usuario;
    
    @ManyToOne(cascade=CascadeType.ALL)
    @JoinColumn(name="idPelicula", referencedColumnName = "id")
    private Pelicula _pelicula;

    public Valoracion() {
    }

    public Valoracion(int puntuacion, String comentario, Usuario usuario, Pelicula pelicula) {
        this._puntuacion = puntuacion;
        this._comentario = comentario;
        this._usuario = usuario;
        this._pelicula = pelicula;
    }

    public Valoracion(int puntuacion) {
        this._puntuacion = puntuacion;
    }

    public int getPuntuacion() {
        return _puntuacion;
    }

    public String getComentario() {
        return _comentario;
    }

    public Usuario getUsuario() {
        return _usuario;
    }

    public Pelicula getPelicula() {
        return _pelicula;
    }
    
    public void setUsuario(Usuario _usuario) {
        this._usuario = _usuario;
        _usuario.addValoracion(this);
    }

    public void setPelicula(Pelicula _pelicula) {
        this._pelicula = _pelicula;
        _pelicula.addValoracion(this);
    }

    public Long getId() {
        return _id;
    }
    
    
    
}
