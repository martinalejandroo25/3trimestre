package PracticasJavaOW.FuncionalAvanzada.Ejercicio3.model;

import java.util.Objects;

public class Producto2Mano {

    private String id, nombre, descripcion;
    public enum categoria {INMUEBLES, TELEFONÍA, INFORMÁTICA, COCHES, BICICLETAS, MUEBLES, ANTIGUEDADES, ROPA}
    public enum estado {PERFECTO, BUENO, POCO_USO, MUY_USADO, DEFECTUOSO, MALO}
    private boolean envio ;
    private double precio;

    public Producto2Mano(String id, String nombre, String descripcion,categoria categoria, estado estado, boolean envio, double precio) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.envio = envio;
        this.precio = precio;
    }

    public Producto2Mano() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public boolean isEnvio() {
        return envio;
    }

    public void setEnvio(boolean envio) {
        this.envio = envio;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("Producto2Mano{");
        sb.append("id='").append(id).append('\'');
        sb.append(", nombre='").append(nombre).append('\'');
        sb.append(", descripcion='").append(descripcion).append('\'');
        sb.append(", envio=").append(envio);
        sb.append(", precio=").append(precio);
        sb.append('}');
        return sb.toString();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Producto2Mano that = (Producto2Mano) o;
        return Objects.equals(id, that.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}
