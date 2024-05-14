package FuncionalAvanzada.Funcional2.Comparadores;

import Funcional2.Product;

import java.util.*;

public class ComparatorMain {
    public static void main(String[] args) {

        Comparator<Double> comparator1 = (n1, n2) -> n1.compareTo(n2);
        Comparator<Double> comparator2 = Double::compareTo; //referencia a método
        System.out.println(comparator1.compare(50.0, 100.0));
        System.out.println(comparator1.compare(50.0, 50.0));
        System.out.println(comparator1.compare(100.0, 50.0));

        Product product1 = new Product("1", "product1", 49.99, false);
        Product product2 = new Product("2", "product2", 10.99, false);

        Comparator<Product> productComparator1 = (p1, p2) -> p1.getPrice().compareTo(p2.getPrice()); //con lambda
        Comparator<Product> productComparator2 = Comparator.comparing(Product::getPrice); //con Comparator.comparing
        System.out.println(productComparator1.compare(product1, product2));

        List<Product> products = new ArrayList<>(List.of(
                //new ArrayList ya que List es inmutable y añadir el ArrayList lo hace modificable
                new Product("1", "product1",9.99, false),
                new Product("2", "product2",14.99, false),
                new Product("3", "product3",25.99, false),
                new Product("4", "product4",5.99, false)
        ));

        System.out.println(products);
        products.sort(productComparator1); //ordena de menor a mayor
        System.out.println(products);
        products.sort(productComparator1.reversed()); //ordena de mayor a menor
        System.out.println(products);

        Comparator.reverseOrder(); //ordena de menor a mayor de la list
        Comparator.naturalOrder();
        Collections.sort(products, productComparator1);
    }
}
