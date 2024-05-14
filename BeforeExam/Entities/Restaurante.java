package BeforeExam.Entities;

import java.util.Objects;

public class Restaurante implements Comparable{
    protected Long id= 1L;
    protected String nombre;
    protected String direccion;
    protected String localidad;
    protected String provincia;
    protected int capacidad;
    protected Double precioPromedio;
    protected Double calificacion;

    public Restaurante() {
    }

    public Restaurante(Long id, String nombre, String direccion, String localidad, String provincia, int capacidad, Double precioPromedio, Double calificacion) {
        this.id=id++;
        this.nombre = nombre;
        this.direccion = direccion;
        this.localidad = localidad;
        this.provincia = provincia;
        this.capacidad = capacidad;
        this.precioPromedio = precioPromedio;
        this.calificacion = calificacion;
    }

    public Long getId() {
        return id;
    }
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getLocalidad() {
        return localidad;
    }

    public void setLocalidad(String localidad) {
        this.localidad = localidad;
    }

    public String getProvincia() {
        return provincia;
    }

    public void setProvincia(String provincia) {
        this.provincia = provincia;
    }

    public int getCapacidad() {
        return capacidad;
    }

    public void setCapacidad(int capacidad) {
        this.capacidad = capacidad;
    }

    public Double getPrecioPromedio() {
        return precioPromedio;
    }

    public void setPrecioPromedio(Double precioPromedio) {
        this.precioPromedio = precioPromedio;
    }

    public Double getCalificacion() {
        return calificacion;
    }

    public void setCalificacion(Double calificacion) {
        this.calificacion = calificacion;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("Restaurante{");
        sb.append("id=").append(id);
        sb.append(", nombre='").append(nombre).append('\'');
        sb.append(", direccion='").append(direccion).append('\'');
        sb.append(", localidad='").append(localidad).append('\'');
        sb.append(", provincia='").append(provincia).append('\'');
        sb.append(", capacidad=").append(capacidad);
        sb.append(", precioPromedio=").append(precioPromedio);
        sb.append(", calificacion=").append(calificacion);
        sb.append('}');
        return sb.toString();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Restaurante that = (Restaurante) o;
        return Objects.equals(id, that.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    @Override
    public int compareTo(Object o) {
        return 0;
    }
}
