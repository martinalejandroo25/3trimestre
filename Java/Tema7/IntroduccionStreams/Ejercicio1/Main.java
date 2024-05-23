package Tema7.IntroduccionStreams.Ejercicio1;

import java.time.LocalDateTime;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;

public class Main {
    public static void main(String[] args) {
        Registro generador = new Registro();
        List<Registro> registros = generador.generarRegistros();

        for (Registro registro : registros) {
            System.out.println(registro);
        }

        registros.stream()
                /*Filtrar los registros de temperatura que sean */
                .filter(registro -> registro.getTemperatura() > 25)
                .filter(registro -> registro.getHumedad() > 70)
                .filter(registro -> registro.getFechaHora().isBefore(LocalDateTime.now()))
                .forEach(System.out::println);
                /*Encontrar el registro con la temperatura más alta y mostrar el registro completo*/
        System.out.println("Temperatura más alta");
        Optional<Registro> registroMaximo = registros.stream()
                .max(Comparator.comparingDouble(Registro::getTemperatura));
        registroMaximo.ifPresent(System.out::println);
    }
}
