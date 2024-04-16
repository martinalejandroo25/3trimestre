package FuncionalAvanzada.switchExpresions;

public class Main {
    public static void main(String[] args) {

        String day = "Monday";
        switch (day){
            case "Monday":
                System.out.println("Hoy es monday");
                break;
            case "Tuesday":
                System.out.println("Hoy es Tuesday");
                break;
            default:
                throw new IllegalStateException("");
        }

        switch (day){
            case "Monday" -> System.out.println("Hoy es monday");
            case "Tuesday" -> {
                System.out.println("Hoy es Tuesday1");
                System.out.println("Hoy es Tuesday2");
            }
            case "Wednesday" -> System.out.println("Hoy es wednesday");
            default -> throw new IllegalArgumentException("");
        }

    }
}
