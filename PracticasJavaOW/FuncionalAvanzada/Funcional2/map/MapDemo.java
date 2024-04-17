package PracticasJavaOW.FuncionalAvanzada.Funcional2.map;

import PracticasJavaOW.FuncionalAvanzada.Funcional2.*;

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

        List<Developer> developers = getDevelopers();
        developers.stream()
                .flatMap(dev -> dev.getTasks().stream())
                .filter(task -> task.getHours() > 5)
                .forEach(System.out::println);
    }
        private static List<Developer> getDevelopers(){
            Task task1 = new Task(1L, "task1", 5);
            Task task2 = new Task(2L, "task2", 4);
            Task task3 = new Task(3L, "task3", 6);
            Developer dev1 = new Developer("dev1", 30, List.of(task1, task2, task3));

            Task task4 = new Task(4L, "task4", 2);
            Task task5 = new Task(5L, "task5", 10);
            Task task6 = new Task(6L, "task6", 7);
            Developer dev2 = new Developer("dev2", 30, List.of(task4, task5, task6));

            return List.of(dev1, dev2);
        }
}
