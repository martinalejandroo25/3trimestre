package BeforeExam.Entities;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Objects;

public class Reserva implements Comparable{
    private Long id= 1L;
    private LocalDate Fecha;
    private LocalTime Hora;
    private int cantidadPersonas;
    private String dniCliente;
    private String nombreCliente;
    private Restaurante restaurante;

    public Reserva() {
    }

    public Reserva(Long id, LocalDate fecha, LocalTime hora, int cantidadPersonas, String dniCliente, String nombreCliente, Restaurante restaurante) {
        this.id = id++;
        Fecha = fecha;
        Hora = hora;
        this.cantidadPersonas = cantidadPersonas;
        this.dniCliente = dniCliente;
        this.nombreCliente = nombreCliente;
        this.restaurante = restaurante;
    }

    public Long getId() {
        return id;
    }

    public LocalDate getFecha() {
        return Fecha;
    }

    public void setFecha(LocalDate fecha) {
        Fecha = fecha;
    }

    public LocalTime getHora() {
        return Hora;
    }

    public void setHora(LocalTime hora) {
        Hora = hora;
    }

    public int getCantidadPersonas() {
        return cantidadPersonas;
    }

    public void setCantidadPersonas(int cantidadPersonas) {
        this.cantidadPersonas = cantidadPersonas;
    }

    public String getDniCliente() {
        return dniCliente;
    }

    public void setDniCliente(String dniCliente) {
        this.dniCliente = dniCliente;
    }

    public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }

    public Restaurante getRestaurante() {
        return restaurante;
    }

    public void setRestaurante(Restaurante restaurante) {
        this.restaurante = restaurante;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("Reserva{");
        sb.append("id=").append(id);
        sb.append(", Fecha=").append(Fecha);
        sb.append(", Hora=").append(Hora);
        sb.append(", cantidadPersonas=").append(cantidadPersonas);
        sb.append(", dniCliente='").append(dniCliente).append('\'');
        sb.append(", nombreCliente='").append(nombreCliente).append('\'');
        sb.append(", restaurante=").append(restaurante);
        sb.append('}');
        return sb.toString();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Reserva reserva = (Reserva) o;
        return Objects.equals(id, reserva.id);
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
