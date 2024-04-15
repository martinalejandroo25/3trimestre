package FuncionalAvanzada.Interfaces.DefaultMethods;

public class EmployeeDAOImpl implements EmployeeDAO {
    @Override
    public String saludo() {
        return "Hola mundo";
    }

    @Override
    public String despedida() {
        return "Hasta nunca";


    }
}
