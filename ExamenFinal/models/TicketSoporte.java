package ExamenFinal.models;

import java.time.LocalDate;
import java.util.Objects;

public class TicketSoporte implements Comparable {
    private Long id= 1L;
    private LocalDate FechaCreacion;
    private LocalDate FechaFinalizacion;
    private Estado estado;
    private Integer prioridad;
    private String comentarios;
    private Usuario solicitante;
    private Tecnico asignado;


    public TicketSoporte(LocalDate fechaCreacion, LocalDate fechaFinalizacion, Estado estado, Integer prioridad, String comentarios, Usuario solicitante, Tecnico asignado) {
        FechaCreacion = fechaCreacion;
        FechaFinalizacion = fechaFinalizacion;
        this.estado = estado;
        this.prioridad = prioridad;
        this.comentarios = comentarios;
        this.solicitante = solicitante;
        this.asignado = asignado;
    }

    public TicketSoporte(Long id, LocalDate fechaCreacion, LocalDate fechaFinalizacion, Estado estado, Integer prioridad, String comentarios, Usuario solicitante, Tecnico asignado) {
        this.id = id++;
        FechaCreacion = fechaCreacion;
        FechaFinalizacion = fechaFinalizacion;
        this.estado = estado;
        this.prioridad = prioridad;
        this.comentarios = comentarios;
        this.solicitante = solicitante;
        this.asignado = asignado;
    }

    public Long getId() {
        return id;
    }

    public LocalDate getFechaCreacion() {
        return FechaCreacion;
    }

    public void setFechaCreacion(LocalDate fechaCreacion) {
        FechaCreacion = fechaCreacion;
    }

    public LocalDate getFechaFinalizacion() {
        return FechaFinalizacion;
    }

    public void setFechaFinalizacion(LocalDate fechaFinalizacion) {
        FechaFinalizacion = fechaFinalizacion;
    }

    public Integer getPrioridad() {
        return prioridad;
    }

    public void setPrioridad(Integer prioridad) {
        this.prioridad = prioridad;
    }

    public Usuario getSolicitante() {
        return solicitante;
    }

    public void setSolicitante(Usuario solicitante) {
        this.solicitante = solicitante;
    }

    public Tecnico getAsignado() {
        return asignado;
    }

    public void setAsignado(Tecnico asignado) {
        this.asignado = asignado;
    }

    public String getComentarios() {
        return comentarios;
    }

    public void setComentarios(String comentarios) {
        this.comentarios = comentarios;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("TicketSoporte{");
        sb.append("id=").append(id);
        sb.append(", FechaCreacion=").append(FechaCreacion);
        sb.append(", FechaFinalizacion=").append(FechaFinalizacion);
        sb.append(", estado=").append(estado);
        sb.append(", prioridad=").append(prioridad);
        sb.append(", comentarios='").append(comentarios).append('\'');
        sb.append(", solicitante=").append(solicitante);
        sb.append(", asignado=").append(asignado);
        sb.append('}');
        return sb.toString();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        TicketSoporte that = (TicketSoporte) o;
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
