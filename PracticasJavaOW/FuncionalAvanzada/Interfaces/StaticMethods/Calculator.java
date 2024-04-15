package FuncionalAvanzada.Interfaces.StaticMethods;

public interface Calculator {
    int sum(int num1, int num2);

    static Calculator getInstance(){
        return new BasicCalculator();
    }
}
