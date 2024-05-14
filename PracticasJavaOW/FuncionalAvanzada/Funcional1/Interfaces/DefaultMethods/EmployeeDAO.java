package FuncionalAvanzada.Interfaces.DefaultMethods;

public interface EmployeeDAO {

    String saludo();

    default String despedida() {
        return "Hasta Luego";
    }
}
