package Tema7.EjercicioPeliculas;

import java.util.Objects;

public class Director {

    private static long contador=0;
    private long id;
    private String nombre;
    //private ArrayList <Pelicula> pelicuals;


    public Director(long id, String nombre) {
        this.id = Director.contador++;
        this.nombre = nombre;
        //this.peliculas = new ArrayList<Pelicula>()
    }

    public long getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }
    //public ArrayList<Pelicula> getPeliculas() {
    // return peliculas;
    //
    // }


    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("Director{");
        sb.append("id=").append(id);
        sb.append(", nombre='").append(nombre).append('\'');
        //sb.append(", peliculas=").append(peliculas);
        sb.append('}');
        return sb.toString();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Director director = (Director) o;
        return id == director.id && Objects.equals(nombre, director.nombre);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, nombre);
    }

   /*
   *  public void addPelicula(Pelicula p) {
        this.peliculas.add(p);
    }*/

  /*
  *   public void deletePelicula(Pelicula p) {
        this.peliculas.remove(p);
    }*/
}
