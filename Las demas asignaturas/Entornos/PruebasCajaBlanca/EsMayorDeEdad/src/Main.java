import java.util.Scanner;

public class Main {
    static Scanner sc = new Scanner(System.in);

    public static boolean EsMayor(int edad) {
        if (edad < 18) {
            return false;
        } else if (edad >= 18) {
            return true;
        }
        return false;
    }
    public static void main(String[] args) {
        System.out.println("Introduce una edad a comprobar");
        int edad = sc.nextInt();
        System.out.println(EsMayor(edad));
    }

}