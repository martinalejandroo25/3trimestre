package ExamenFinal.io;

import ExamenFinal.Services.ServicioSoporte;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

public class TicketSoporte {
//    o static cargarCSV(): que cree un objeto ServicioSoporte. Luego lea el fichero usuarios.csv y añada los
//    usuarios del fichero leídos al set de usuarios del objeto ServicioSoporte. Que haga lo mismo para los
//    técnicos. Por último, lea el fichero tickets.csv y los añada a la lista de tickets de ServicioSoporte.
//    Fíjate que ya llevan id los Tickets en el fichero y que su técnico y usuario llevan un id, tendrás que
//    buscarlos en sus sets para pasarle objeto Usuario y Tecnico al objeto TicketSoporte. Por último, fíjate
//    que todos los tickets llevan fecha de cierre, aunque estén abiertos, si están abiertos o en proceso no
//    pongas fecha de cierre.
//    o static grabarCSV(): debe leer los datos en memoria del objeto TicketSoporte y machacar los datos
//    de los ficheros usuarios.csv, tecnicos.csv y tickets.csv.

    public static ServicioSoporte cargarCSV() throws IOException {
        //definir rutas de los archivos
        Path usuarios = Paths.get(".", "ExamenFinal", "resources", "usuarios.csv");
        Path tecnicos = Paths.get(".", "ExamenFinal", "resources", "tecnico.csv");

        ServicioSoporte ser = new ServicioSoporte();
    }
}
