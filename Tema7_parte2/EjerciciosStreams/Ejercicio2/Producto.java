package EjerciciosStreams.Ejercicio2;

public class Producto {
    private Long id;
    private String Nombre;
    private String Categoria;
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

    public String getCategoria() {
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
        final StringBuffer sb = new StringBuffer("Producto{");
        sb.append("id=").append(id);
        sb.append(", Nombre='").append(Nombre).append('\'');
        sb.append(", Categoria='").append(Categoria).append('\'');
        sb.append(", Precio=").append(Precio);
        sb.append('}');
        return sb.toString();
    }

}
