package Tema7.EjercicioPeliculas;

public class Genero {
    private static long contador=0;
    private long id;
    private String nombre;

    public Genero(long id, String nombre) {
        this.nombre = nombre;
        this.id = Genero.contador++;
    }

    public long getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("Genero{");
        sb.append("id=").append(id);
        sb.append(", nombre='").append(nombre).append('\'');
        sb.append('}');
        return sb.toString();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Genero genero = (Genero) o;
        return id == genero.id;
    }

    @Override
    public int hashCode() {
        return (int) (id ^ (id >>> 32));
    }
}
