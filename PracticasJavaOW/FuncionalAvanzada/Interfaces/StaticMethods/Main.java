package FuncionalAvanzada.Interfaces.StaticMethods;

public class Main {
    public static void main(String[] args) {
        var calculator = Calculator.getInstance();
        var res = calculator.sum(3, 6);
        System.out.println(res);
    }
}
