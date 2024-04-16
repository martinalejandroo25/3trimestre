package Funcional2.Comparadores;

import java.util.Comparator;

public class ComparatorMain {
    public static void main(String[] args) {

        Comparator<Double> comparator1 = (n1, n2) -> n1.compareTo(n2);
        Comparator<Double> comparator2 = Double::compareTo; //referencia a método
        comparator1.compare(50.0, 100.0);
    }
}
