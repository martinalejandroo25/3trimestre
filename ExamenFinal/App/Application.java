package ExamenFinal.App;

import ExamenFinal.Services.ServicioSoporte;
import ExamenFinal.io.TicketsSoporte;
import ExamenFinal.models.Especialidad;
import ExamenFinal.models.TicketSoporte;

import java.io.IOException;
import java.util.Scanner;

public class Application {
    public static void main(String[] args) throws IOException {
        Scanner sc = new Scanner(System.in);
        ServicioSoporte ser = TicketsSoporte.cargarCSV();

        System.out.println("""
                                Bienvenido a Servicio Tecnico 'ExamenFinal'
                                - 1. Listar todos los tickets abiertos
                                - 2. Listar técnicos agrupados por especialidad
                                - 3. Mostrar el total de tickets resueltos
                                - 4. Mostrar la media de resolución de tickets pidiendo la prioridad de los tickets.
                                - 5. Insertar ticket soporte: que pida todos los datos y lo inserte en BD.
                                - 6. Eliminar ticket soporte: que pida el id y lo elimine de la BD.
                                - 7. Salir: que llame a grabarCSV().
                """);
        System.out.println("Seleccione una opción: ");
        int opcion = sc.nextInt();
        switch (opcion){
            case 1:
                ser.getTicketsAbiertos1().forEach(System.out::println);
                break;
            case 2:
                ser.getTecnicosGroupByEspecialidad(Especialidad.valueOf(ser.get));
                break;
            case 3:

                break;
            case 4:

                break;
            case 5:
                System.out.println("Inserte todos los datos del nuevo ticket");
                System.out.println("id: ");
                Long id = sc.nextLong();
                System.out.println("Fecha de Creación(AAAA/MM/DD): ");
                String fechaCreacion = sc.nextLine();
                System.out.println("Fecha de Finalización:");
                String finalizacion = sc.nextLine();
                System.out.println("estado(ABIERTO, ENPROCESO, RESUELTO)");
                String estado = sc.nextLine();
                System.out.println("prioridad(1 al 5)");
                Integer prioridad = sc.nextInt();
                System.out.println("Comentarios");
                String comentarios = sc.nextLine();
                System.out.println("Usuario solicitante (id)");
                Long solicitante = sc.nextLong();
                System.out.println("Tecnico asignado");
                Long asignado = sc.nextLong();
                ser.addTicketSoporte(id, fechaCreacion, finalizacion, estado, prioridad, comentarios, solicitante, asignado);
                break;
            case 6:
                System.out.println("Ingrese el Id del ticket a eliminar");
                Long idReserva = sc.nextLong();
                ser.deleteTicketSoporte(idReserva);
                System.out.println("Reserva eliminada");
                break;
            case 7:

                break;
        }

    }
}
