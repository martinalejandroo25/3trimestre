package PracticasJavaOW.FuncionalAvanzada.Ejercicio3.model;

import java.time.LocalDate;

public class Compra {

    private Long id;
    private Usuario comprador;
    private Usuario vendedor;
    private Producto2Mano producto;
    private LocalDate fecha;
    private Double precioCompra;

    //constructor


    public Compra(Long id, Usuario comprador, Usuario vendedor, Producto2Mano producto, LocalDate fecha, Double precioCompra) {
        this.id = id;
        this.comprador = comprador;
        this.vendedor = vendedor;
        this.producto = producto;
        this.fecha = fecha;
        this.precioCompra = precioCompra;
    }

    public Compra() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Usuario getComprador() {
        return comprador;
    }

    public void setComprador(Usuario comprador) {
        this.comprador = comprador;
    }

    public Usuario getVendedor() {
        return vendedor;
    }

    public void setVendedor(Usuario vendedor) {
        this.vendedor = vendedor;
    }

    public Producto2Mano getProducto() {
        return producto;
    }

    public void setProducto(Producto2Mano producto) {
        this.producto = producto;
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

    public Double getPrecioCompra() {
        return precioCompra;
    }

    public void setPrecioCompra(Double precioCompra) {
        this.precioCompra = precioCompra;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("Compra{");
        sb.append("id=").append(id);
        sb.append(", comprador=").append(comprador);
        sb.append(", vendedor=").append(vendedor);
        sb.append(", producto=").append(producto.getId()).append(producto.getNombre());
        sb.append(", fecha=").append(fecha);
        sb.append(", precioCompra=").append(precioCompra);
        sb.append('}');
        return sb.toString();
    }
}
