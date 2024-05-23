package PracticasJavaOW.FuncionalAvanzada.Ejercicio3.service;

import PracticasJavaOW.FuncionalAvanzada.Ejercicio3.model.Compra;
import PracticasJavaOW.FuncionalAvanzada.Ejercicio3.model.Producto2Mano;
import PracticasJavaOW.FuncionalAvanzada.Ejercicio3.model.Usuario;
import com.sun.source.doctree.SeeTree;

import java.util.HashSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class PerfilUsuario {
    private Usuario usuario;
    private Set<Producto2Mano> productosALaVenta;
    private List<Compra> compras;
    private List<Compra> ventas;

    public PerfilUsuario(Usuario usuario) {
        this.usuario = usuario;
        productosALaVenta = new HashSet<>();
        compras = new ArrayList<>();
        ventas = new ArrayList<>();
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public Set<Producto2Mano> getProductosALaVenta() {
        return productosALaVenta;
    }

    public List<Compra> getCompras() {
        return compras;
    }

    public List<Compra> getVentas() {
        return ventas;
    }

    private void addProducto2Mano(Producto2Mano producto) {
        productosALaVenta.add(producto);
    }

    private void addCompra (Compra compra) {
        compras.add(compra);
    }

    private void addVenta (Compra compra) {
        ventas.add(compra);
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("PerfilUsuario{");
        sb.append("usuario=").append(usuario);
        sb.append(", productosALaVenta=").append(productosALaVenta);
        sb.append(", compras=").append(compras);
        sb.append(", ventas=").append(ventas);
        sb.append('}');
        return sb.toString();
    }
}
