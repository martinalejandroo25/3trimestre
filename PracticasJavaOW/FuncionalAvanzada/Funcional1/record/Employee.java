package FuncionalAvanzada.record;

import java.time.LocalDate;

/*
* Crea objetos inmutables, sin seters*/
public record Employee(Long id, String name, Double salary) {

    //la creacion de constructores personalizados es opcional
    //toda la estructura de metodos que se suelen crear ya están presentes
    public Employee(String name) {
        this(null, name, null);
    }

    public Employee(String name, Double salary) {
        this(null, name, salary);
    }
}
