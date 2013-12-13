/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package FilmlyWeb.Modelo;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.Scanner;

/**
 *
 * @author Pedro
 */
public class DetallesPelicula {
    Pelicula _pelicula;

    public DetallesPelicula(Pelicula _pelicula) {
        this._pelicula = _pelicula;
    }
    
    private String getURL(){
        String url = "http://www.imdbapi.com/?i=&t=";        
        Scanner scanner = new Scanner( _pelicula.getTitulo() ).useDelimiter("\\s+");
        String aux = "";

        while( scanner.hasNext() ) {                                
            aux += scanner.next();

            if( scanner.hasNext() ){
                aux += "+";
            }
        }

        url += aux;
        
        return url;
    }
    
     public String getTitulo(){
        String titulo = "";
        try{
            URL url = new URL( getURL() );
            BufferedReader in = new BufferedReader(
            new InputStreamReader(url.openStream()));
            
            Scanner scanner = new Scanner(in.readLine());
            scanner.useDelimiter("\"");

            while( scanner.hasNext() ){
               if( scanner.next().equals("Title") ){
                   scanner.next();
                   titulo = scanner.next();
               }
            }

        }catch(Exception ex){} 

        return titulo;
    }
    
    public String getPoster(){
        String poster = "";
        try{
            URL url = new URL( getURL() );
            BufferedReader in = new BufferedReader(
            new InputStreamReader(url.openStream()));
            
            Scanner scanner = new Scanner(in.readLine());
            scanner.useDelimiter("\"");

            while( scanner.hasNext() ){
               if( scanner.next().equals("Poster") ){
                   scanner.next();
                   poster = scanner.next();
               }
            }

        }catch(Exception ex){} 

        return poster;
    }
    
    public String getDirector(){
        String director = "";
        try{
            URL url = new URL( getURL() );
            BufferedReader in = new BufferedReader(
            new InputStreamReader(url.openStream()));
            
            Scanner scanner = new Scanner(in.readLine());
            scanner.useDelimiter("\"");

            while( scanner.hasNext() ){
               if( scanner.next().equals("Director") ){
                   scanner.next();
                   director = scanner.next();
               }
            }

        }catch(Exception ex){} 

        return director;
    }
    
    public String getActores(){
        String actores = "";
        try{
            URL url = new URL( getURL() );
            BufferedReader in = new BufferedReader(
            new InputStreamReader(url.openStream()));
            
            Scanner scanner = new Scanner(in.readLine());
            scanner.useDelimiter("\"");

            while( scanner.hasNext() ){
               if( scanner.next().equals("Actors") ){
                   scanner.next();
                   actores = scanner.next();
               }
            }

        }catch(Exception ex){} 

        return actores;
    }
    
    public String getDuracion(){
        String duracion = "";
        try{
            URL url = new URL( getURL() );
            BufferedReader in = new BufferedReader(
            new InputStreamReader(url.openStream()));
            
            Scanner scanner = new Scanner(in.readLine());
            scanner.useDelimiter("\"");

            while( scanner.hasNext() ){
               if( scanner.next().equals("Runtime") ){
                   scanner.next();
                   duracion = scanner.next();
               }
            }

        }catch(Exception ex){} 

        return duracion;
    }
    
    public String getAnho(){
        String anho = "";
        try{
            URL url = new URL( getURL() );
            BufferedReader in = new BufferedReader(
            new InputStreamReader(url.openStream()));
            
            Scanner scanner = new Scanner(in.readLine());
            scanner.useDelimiter("\"");

            while( scanner.hasNext() ){
               if( scanner.next().equals("Year") ){
                   scanner.next();
                   anho = scanner.next();
               }
            }

        }catch(Exception ex){} 

        return anho;
    }
    
    public String getGenero(){
        String genero = "";
        try{
            URL url = new URL( getURL() );
            BufferedReader in = new BufferedReader(
            new InputStreamReader(url.openStream()));
            
            Scanner scanner = new Scanner(in.readLine());
            scanner.useDelimiter("\"");

            while( scanner.hasNext() ){
               if( scanner.next().equals("Genre") ){
                   scanner.next();
                   genero = scanner.next();
               }
            }

        }catch(Exception ex){} 

        return genero;
    }
    
    public String getDescipcion(){
        String descripcion = "";
        try{
            URL url = new URL( getURL() );
            BufferedReader in = new BufferedReader(
            new InputStreamReader(url.openStream()));
            
            Scanner scanner = new Scanner(in.readLine());
            scanner.useDelimiter("\"");

            while( scanner.hasNext() ){
               if( scanner.next().equals("Plot") ){
                   scanner.next();
                   descripcion = scanner.next();
               }
            }

        }catch(Exception ex){} 

        return descripcion;
    }
}
