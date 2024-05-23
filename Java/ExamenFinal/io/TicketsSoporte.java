<<<<<<< HEAD
 package ExamenFinal.io;

import ExamenFinal.Services.ServicioSoporte;
import ExamenFinal.models.*;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

public class TicketsSoporte {
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
        Path usuariosFile = Paths.get(".", "ExamenFinal", "resources", "usuarios.csv");
        Path tecnicosFile = Paths.get(".", "ExamenFinal", "resources", "tecnico.csv");
        Path ticketsFile = Paths.get(".", "ExamenFinal", "resources", "tickets.csv");

        ServicioSoporte ser = new ServicioSoporte();

        List<Usuario> usuarios = Files.lines(usuariosFile)
                .map(linea -> {
                    // Divide cada línea del archivo en partes usando comas como delimitador.
                    String[] cad = linea.split(",");
                    return new Usuario(
                                Long.parseLong(cad[0]), cad[1], cad[2], cad[3], cad[4],
                                LocalDate.parse(cad[5]));
                    })
                .toList();
        return ser;

        List<Tecnico> tecnicos = Files.lines(tecnicosFile)
                .map(linea -> {
                    String[] cad = linea.split(",");
                    return new Tecnico(
                            Long.parseLong(cad[0]), cad[1], cad[2], cad[3], cad[4], Especialidad.valueOf(cad[4]), Integer.parseInt(cad[5]));
                })
                .collect(Collectors.toSet());

        Set<TicketSoporte> tickets = Files.lines(ticketsFile)
                .map(linea -> {
                    String[] cad = linea.split(",");
                    Usuario usuario = ser.findUsuarioById(Integer.parseInt(cad[6]));
                    Tecnico tecnico = ser.findTecnicoById(Integer.parseInt(cad[7]));
                    return new TicketSoporte(
                            Long.parseLong(cad[0]), LocalDate.parse(cad[1]), LocalDate.parse(cad[2]), Estado.valueOf(cad[3]), Integer.parseInt(cad[4]), cad[5], usuario, tecnico);
                })
                .collect(Collectors.toSet());

    }
}
=======
package ExamenFinal.io;

import ExamenFinal.Services.ServicioSoporte;
import ExamenFinal.models.*;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

public class TicketsSoporte {
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
        Path usuariosFile = Paths.get(".", "ExamenFinal", "resources", "usuarios.csv");
        Path tecnicosFile = Paths.get(".", "ExamenFinal", "resources", "tecnico.csv");
        Path ticketsFile = Paths.get(".", "ExamenFinal", "resources", "tickets.csv");

        ServicioSoporte ser = new ServicioSoporte();

        List<Usuario> usuarios = Files.lines(usuariosFile)
                .map(linea -> {
                    // Divide cada línea del archivo en partes usando comas como delimitador.
                    String[] cad = linea.split(",");
                    return new Usuario(
                                Long.parseLong(cad[0]), cad[1], cad[2], cad[3], cad[4],
                                LocalDate.parse(cad[5]));
                    })
                .toList();
        return ser;

        List<Tecnico> tecnicos = Files.lines(tecnicosFile)
                .map(linea -> {
                    String[] cad = linea.split(",");
                    return new Tecnico(
                            Long.parseLong(cad[0]), cad[1], cad[2], cad[3], cad[4], Especialidad.valueOf(cad[4]), Integer.parseInt(cad[5]));
                })
                .collect(Collectors.toSet());

        Set<TicketSoporte> tickets = Files.lines(ticketsFile)
                .map(linea -> {
                    String[] cad = linea.split(",");
                    Usuario usuario = ser.findUsuarioById(Integer.parseInt(cad[6]));
                    Tecnico tecnico = ser.findTecnicoById(Integer.parseInt(cad[7]));
                    return new TicketSoporte(
                            Long.parseLong(cad[0]), LocalDate.parse(cad[1]), LocalDate.parse(cad[2]), Estado.valueOf(cad[3]), Integer.parseInt(cad[4]), cad[5], usuario, tecnico);
                })
                .collect(Collectors.toSet());

    }
}
>>>>>>> fe53b8d8a97179a18b92594bdcf9abc7678cc31b
