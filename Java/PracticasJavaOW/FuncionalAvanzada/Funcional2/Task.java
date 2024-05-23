package Funcional2;

import java.util.Objects;

public class Task {
    private Long id;
    private String title;
    private Integer hours;

    public Task(Long id, String title, Integer hours) {
        this.id = id;
        this.title = title;
        this.hours = hours;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getHours() {
        return hours;
    }

    public void setHours(Integer hours) {
        this.hours = hours;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Task task = (Task) o;
        return Objects.equals(id, task.id) && Objects.equals(title, task.title) && Objects.equals(hours, task.hours);
    }


    @Override
    public int hashCode() {
        return Objects.hash(id, title, hours);
    }
    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("Task{");
        sb.append("id=").append(id);
        sb.append(", title='").append(title).append('\'');
        sb.append(", hours=").append(hours);
        sb.append('}');
        return sb.toString();
    }

}
