package Tema7.IntroduccionStreams.Ejercicio1;

import java.time.LocalDateTime;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        Registro generador = new Registro();
        List<Registro> registros = generador.generarRegistros();

        for (Registro registro : registros) {
            System.out.println(registro);
        }

        registros.stream()
                .filter(registro -> registro.getTemperatura() > 25)
                .filter(registro -> registro.getHumedad() > 70)
                .filter(registro -> registro.getFechaHora().isBefore(LocalDateTime.now()))
                .forEach(System.out::println);

    }
}
