package map;

import PracticasJavaOW.FuncionalAvanzada.Funcional2.*;

import Funcional2.Task;

import java.util.Comparator;
import java.util.List;

public class MapDemo {
    public static void main(String[] args) {

        List<String> names = List.of("patricia", "antonio", "Juan", "raquel", "Juan");

        names.stream()
                .map(String::toUpperCase) // Extrae y transforma a mayúsculas
                .distinct() // Elimina duplicados
                .sorted(Comparator.comparing(String::length)) // ordena por longitud
                .forEach(System.out::println); //Imprime

        List<Developer> developer1 = getDevelopers(){
            Task task1 = new Task(1L, "task1", 5);
            Task task2 = new Task(2L, "task2", 4);
            Task task3 = new Task(3L, "task3", 6);
            Developer dev1 = new Developer("dev1", 30, List.of(task1, task2, task3));
        };

    }
}
