package Tema7.IntroduccionStreams.Ejercicio1;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.Random;

public class Registro {
    private LocalDateTime fechaHora;
    private Double temperatura;
    private Double humedad;

    public Registro() {
    }

    public Registro(LocalDateTime fechaHora, Double temperatura, Double humedad) {
        this.fechaHora = fechaHora;
        this.temperatura = temperatura;
        this.humedad = humedad;
    }

    public LocalDateTime getFechaHora() {
        return fechaHora;
    }

    public void setFechaHora(LocalDateTime fechaHora) {
        this.fechaHora = fechaHora;
    }

    public Double getTemperatura() {
        return temperatura;
    }

    public void setTemperatura(Double temperatura) {
        this.temperatura = temperatura;
    }

    public Double getHumedad() {
        return humedad;
    }

    public void setHumedad(Double humedad) {
        this.humedad = humedad;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("Registro{");
        sb.append("fechaHora=").append(fechaHora);
        sb.append(", temperatura=").append(temperatura);
        sb.append(", humedad=").append(humedad);
        sb.append('}');
        return sb.toString();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Registro registro = (Registro) o;
        return Objects.equals(fechaHora, registro.fechaHora) && Objects.equals(temperatura, registro.temperatura) && Objects.equals(humedad, registro.humedad);
    }

    @Override
    public int hashCode() {
        return Objects.hash(fechaHora, temperatura, humedad);
    }

    public List<Registro> generarRegistros() {
        List<Registro> registros = new ArrayList<>();
        LocalDateTime fechaHoraInicial = LocalDateTime.now();
        Random random = new Random();

        for (int i = 0; i < 100; i++) {
            Double temperatura = -10 + 40 * random.nextDouble();
            Double humedad = 0 + 100 * random.nextDouble();

            registros.add(new Registro(fechaHoraInicial.plusMinutes(i), temperatura, humedad));
        }

        return registros;
    }

}
