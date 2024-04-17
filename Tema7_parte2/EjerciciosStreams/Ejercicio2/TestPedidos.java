package EjerciciosStreams.Ejercicio2;

import java.util.ArrayList;
import java.util.stream.Stream;

public class TestPedidos {
    public static void main(String[] args) {
        Cliente c1 = new Cliente(123456L, "Jose Manueh'", 5);
        Cliente c2 = new Cliente(654321L, "Benito Camela", 3);
        Cliente c3 = new Cliente (523542L, "Rosa Melano", 8);

        Producto p11 = new Producto(11L, "Monopoly",            "Juegos",        29.99);
        Producto p12 = new Producto(12L, "The Witcher 3",       "Juegos",        39.99);
        Producto p13 = new Producto(13L, "Settlers of Catan",   "Juegos",        44.99);
        Producto p14 = new Producto(14L, "Dungeons & Dragons",  "Juegos",        49.99);
        Producto p15 = new Producto(15L, "Super Smash Bros",    "Juegos",        59.99);

        Producto p21 = new Producto(21L, "The Great Gatsby",    "Libros",        9.99);
        Producto p22 = new Producto(22L, "To Kill a Mockingbird", "Libros",      12.99);
        Producto p23 = new Producto(23L, "1984",                "Libros",       14.99);
        Producto p24 = new Producto(24L, "The Catcher in the Rye", "Libros",     11.99);
        Producto p25 = new Producto(25L, "The Hobbit",          "Libros",       24.99);

        Producto p31 = new Producto(31L, "Wireless Mouse",      "Periféricos",   14.99);
        Producto p32 = new Producto(32L, "Mechanical Keyboard", "Periféricos",   59.99);
        Producto p33 = new Producto(33L, "Gaming Headset",      "Periféricos",   49.99);
        Producto p34 = new Producto(34L, "External Hard Drive", "Periféricos",   79.99);
        Producto p35 = new Producto(35L, "4K Monitor",          "Periféricos",  299.99);

        ArrayList<Pedido> pedidos = new ArrayList<Pedido>();
        //2.
        pedidos.stream()
                .filter( pedido -> pedido.getProductos().stream().isParallel())
                .equals(Producto.getCategoria());
    }
}
