package ExamenFinal.Services;

import ExamenFinal.models.*;
import org.w3c.dom.ls.LSOutput;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

public class ServicioSoporte {
    private List<TicketSoporte> tickets;
    private Set<Usuario> usuarios;
    private Set<Tecnico> tecnicos;

    public void addUsuario(Usuario u){
        this.usuarios.add(u);
    }
    public void deleteUsuario(Long id){
        this.usuarios.remove(id);
        this.tickets.removeIf(ticketSoporte -> ticketSoporte.getSolicitante().equals(id));
    }
    public void addTecnico(Tecnico t){
        this.tecnicos.add(t);
    }
    public void deleteTecnico(Long id){
        this.tecnicos.remove(id);
        this.tickets.removeIf(ticketSoporte -> ticketSoporte.getAsignado().equals(id));
    }
    public void setTickets(Set<TicketSoporte> tickets){
        this.tickets = (List<TicketSoporte>) tickets;
    }
    public void addTicketSoporte(LocalDate fechaCreacion, LocalDate fechaFinalizacion, Estado estado, Integer prioridad, String comentarios, Usuario usuario, Tecnico tecnico){
        this.tickets.add(new TicketSoporte(fechaCreacion, fechaFinalizacion, estado, prioridad, comentarios, usuario, tecnico));
    }
    public void deleteTicketSoporte(Long id){
        this.tickets.remove(id);
    }
//    Tecnico findTecnicoById(int id): técnico con el id indicado.
    public Tecnico findTecnicoById(int id){
        return (Tecnico) this.tecnicos.stream()
                .filter(tecnico -> tecnico.getId().equals(tecnico));
    }
//    o Usuario findUsuarioById(int id): usuario con el id indicado.
    public Usuario findUsuarioById(int id) {
        return (Usuario) this.usuarios.stream()
                .filter(usuario -> usuario.getId().equals(usuario));
    }
//    o List<Tecnico> getTecnicosByEspecialidad(Especialidad esp): lista de técnicos de una especialidad.
    public List<Tecnico> getTecnicosByEspecialidad(Especialidad esp) {
        return (List<Tecnico>) this.tecnicos.stream()
                .filter(tecnico -> tecnico.getEspecialidad().equals(esp));
    }
//    o Map<Especialidad, List<Tecnico>> getTecnicosGroupByEspecialidad(Especialidad esp): mapa con
//    especialidad y para cada una la lista de técnicos de esa especialidad ordenados por valoración.
    public Map<Especialidad , List<Tecnico>> getTecnicosGroupByEspecialidad(Especialidad esp) {
        return this.tecnicos.stream()
                .collect(Collectors.groupingBy(Tecnico::getEspecialidad));
        //SIN TERMINAR
    }

//    o TicketSoporte findTicketById(int id): ticket de soporte con el id indicado.
    public TicketSoporte findTicketById(int id){
        return (TicketSoporte) this.tickets.stream()
                .filter(ticketSoporte -> ticketSoporte.getId().equals(ticketSoporte));
    }
//    o List<TicketSoporte> getTicketsAbiertos(): lista con todos los tickets abiertos ordenados por fecha
//    de creacion descendente.
    public List<TicketSoporte> getTicketsAbiertos1() {
                    return this.tickets.stream()
                    .filter(ticketSoporte -> ticketSoporte.getId().equals(tickets) && !ticketSoporte.getFechaFinalizacion().isBefore(LocalDate.now()))
                    .collect(Collectors.toList());

    }
    public List<TicketSoporte> getTicketsAbiertos2() {
        return this.tickets.stream()
                .filter(ticketSoporte -> {
                    if (ticketSoporte.getId().equals(tickets)) {
                        LocalDate.now();
                    }
                    return false;
                })
                .collect(Collectors.toList());

    }

//    o List<TicketSoporte> getTicketsCerrados(): lista con todos los tickets resueltos ordenados por fecha
//    de finalización descendente.
    public List<TicketSoporte> getTicketsCerrados() {
        return this.tickets.stream()
                .filter(ticketSoporte -> ticketSoporte.getId().equals(tickets) && !ticketSoporte.getFechaFinalizacion().isAfter(LocalDate.now()))
                .collect(Collectors.toList());
    }
    //    o List<TicketSoporte> getTicketsEnProcesoTecnicoInformatico(): devuelve todos los tickets
//    ENPROCESO que tienen asignado un técnico de la especialidad de informática.
    public List<TicketSoporte> getTicketsEnProcesoTecnicoInformatico() {
        return (List<TicketSoporte>) this.tickets.stream()
                .filter(ticketSoporte -> ticketSoporte.getEstado().equals(Especialidad.INFORMATICA));
    }
//    o Integer getTotalTicketsResueltos(Integer prioridad): devuelve el total de tickets resueltos de una
//    determinada prioridad.

//    o Set<TicketSoporte> findTicketsByEstadoAndPrioridad(Estado estado, Integer prioridad): conjunto
//    con los tickets con el estado y la prioridad indicados, ordenados por fecha de creación ascendente.

//    o Map<Especialidad, List<Tecnico>> findTecnicosInTickets(): muestra todos los técnicos que han
//    trabajado en algún ticket, agrupados por especialidad

//    o Set<Tecnico> findTecnicosRapidos(): muestra una lista de los técnicos que han solucionado tickets
//    en menos de 5 días.

//    o Integer getTotalTicketsRetardados(): devuelve el total de tickets cerrados que han tardado más de
//    una semana en cerrarse desde que se abrieron.

//    o Double getMediaResolucionTickets(Integer prioridad): devuelve la media de días en que se
//    resuelven los tickets de una determinada prioridad.

//    o Map<Tecnico, Double> getMediaResolucionTicketsGroupByTecnico(): devuelve un mapa donde
//    para cada técnico que resuelve tickets muestre la media de días en que resuelve los tickets.

//    o Boolean areAllTicketsFinishedLessThanTenDays(): dice si todos los tickets han sido o no resueltos
//    en menos de 10 días, solo para los tickets resueltos.

//    o Optional<TicketSoporte> getFirstTicketSolvedOneDay(): devuelve un ticket que haya sido resuelto
//    el mismo día.
    public Optional<TicketSoporte> getFirstTicketSolvedOneDay() {

    }

}
