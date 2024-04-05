package EjerciciosStreams.Ejercicio2;

import java.time.LocalDate;
import java.util.Set;

public class Pedido {
    private Long id;
    private LocalDate fechaPedido;
    private LocalDate fechaEnvio;
    private String estado;
    private Cliente cliente;
    private Set<Producto> productos;

    public Pedido(Long id, LocalDate fechaPedido, LocalDate fechaEnvio, String estado, Cliente cliente) {
        this.id = id;
        this.fechaPedido = fechaPedido;
        this.fechaEnvio = fechaEnvio;
        this.estado = estado;
        this.cliente = cliente;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public LocalDate getFechaPedido() {
        return fechaPedido;
    }

    public void setFechaPedido(LocalDate fechaPedido) {
        this.fechaPedido = fechaPedido;
    }

    public LocalDate getFechaEnvio() {
        return fechaEnvio;
    }

    public void setFechaEnvio(LocalDate fechaEnvio) {
        this.fechaEnvio = fechaEnvio;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("Pedido{");
        sb.append("id=").append(id);
        sb.append(", fechaPedido=").append(fechaPedido);
        sb.append(", fechaEnvio=").append(fechaEnvio);
        sb.append(", estado='").append(estado).append('\'');
        sb.append(", cliente=").append(cliente);
        sb.append(", productoS=").append(productoS);
        sb.append('}');
        return sb.toString();
    }
}
