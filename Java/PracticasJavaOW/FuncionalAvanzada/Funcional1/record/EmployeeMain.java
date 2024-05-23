package FuncionalAvanzada.record;

import org.w3c.dom.ls.LSOutput;

public class EmployeeMain {
    public static void main(String[] args) {
        Employee employee = new Employee("employe1", 4000.0);
        System.out.println(employee);

        employee.id();
        System.out.println(employee.id());
        System.out.println(employee.name());
        System.out.println(employee.salary());
    }
}
