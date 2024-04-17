package Practica1;

public class JugadorBasket {
    private String jugador;
    private Double altura;
    private String posicion; //base, alero, escolta, alapivot, pivot
    private Integer dorsal;
    private Double puntosPorPartido, rebotesPorPartido, taponesPorPartido, asistenciasPorPartido, robosPorPartido;

    public JugadorBasket(String jugador, Double altura, String posicion, Integer dorsal, Double puntosPorPartido, Double rebotesPorPartido, Double taponesPorPartido, Double asistenciasPorPartido, Double robosPorPartido) {
        this.jugador = jugador;
        this.altura = altura;
        this.posicion = posicion;
        this.dorsal = dorsal;
        this.puntosPorPartido = puntosPorPartido;
        this.rebotesPorPartido = rebotesPorPartido;
        this.taponesPorPartido = taponesPorPartido;
        this.asistenciasPorPartido = asistenciasPorPartido;
        this.robosPorPartido = robosPorPartido;
    }

    public String getJugador() {
        return jugador;
    }

    public void setJugador(String jugador) {
        this.jugador = jugador;
    }

    public Double getAltura() {
        return altura;
    }

    public void setAltura(Double altura) {
        this.altura = altura;
    }

    public String getPosicion() {
        return posicion;
    }

    public void setPosicion(String posicion) {
        this.posicion = posicion;
    }

    public Integer getDorsal() {
        return dorsal;
    }

    public void setDorsal(Integer dorsal) {
        this.dorsal = dorsal;
    }

    public Double getPuntosPorPartido() {
        return puntosPorPartido;
    }

    public void setPuntosPorPartido(Double puntosPorPartido) {
        this.puntosPorPartido = puntosPorPartido;
    }

    public Double getRebotesPorPartido() {
        return rebotesPorPartido;
    }

    public void setRebotesPorPartido(Double rebotesPorPartido) {
        this.rebotesPorPartido = rebotesPorPartido;
    }

    public Double getTaponesPorPartido() {
        return taponesPorPartido;
    }

    public void setTaponesPorPartido(Double taponesPorPartido) {
        this.taponesPorPartido = taponesPorPartido;
    }

    public Double getAsistenciasPorPartido() {
        return asistenciasPorPartido;
    }

    public void setAsistenciasPorPartido(Double asistenciasPorPartido) {
        this.asistenciasPorPartido = asistenciasPorPartido;
    }

    public Double getRobosPorPartido() {
        return robosPorPartido;
    }

    public void setRobosPorPartido(Double robosPorPartido) {
        this.robosPorPartido = robosPorPartido;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("JugadorBasket{");
        sb.append("jugador='").append(jugador).append('\'');
        sb.append(", altura=").append(altura);
        sb.append(", posicion='").append(posicion).append('\'');
        sb.append(", dorsal=").append(dorsal);
        sb.append(", puntosPorPartido=").append(puntosPorPartido);
        sb.append(", rebotesPorPartido=").append(rebotesPorPartido);
        sb.append(", taponesPorPartido=").append(taponesPorPartido);
        sb.append(", asistenciasPorPartido=").append(asistenciasPorPartido);
        sb.append(", robosPorPartido=").append(robosPorPartido);
        sb.append('}');
        return sb.toString();
    }
}
