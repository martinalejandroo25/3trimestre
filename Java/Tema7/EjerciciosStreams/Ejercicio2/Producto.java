package EjerciciosStreams.Ejercicio2;

public class Producto {
    private Long id;
    private String Nombre;
    private static String Categoria;
    private Double Precio;

    public Producto(Long id, String nombre, String categoria, Double precio) {
        this.id = id;
        Nombre = nombre;
        Categoria = categoria;
        Precio = precio;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String nombre) {
        Nombre = nombre;
    }

    public static String getCategoria() {
        return Categoria;
    }

    public void setCategoria(String categoria) {
        Categoria = categoria;
    }

    public Double getPrecio() {
        return Precio;
    }

    public void setPrecio(Double precio) {
        Precio = precio;
    }

    @Override
    public String toString() {
        return "Producto{" + "id=" + id +
                ", Nombre='" + Nombre + '\'' +
                ", Categoria='" + Categoria + '\'' +
                ", Precio=" + Precio +
                '}';
    }

}
