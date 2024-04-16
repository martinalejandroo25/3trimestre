package Funcional2;

import java.util.List;
import java.util.Objects;

public class Developer {
    private String name;
    private Integer age;
    private List<Task> tasks;

    public Developer(String name, Integer age, List<Task> tasks) {
        this.name = name;
        this.age = age;
        this.tasks = tasks;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public List<Task> getTasks() {
        return tasks;
    }

    public void setTasks(List<Task> tasks) {
        this.tasks = tasks;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("Developer{");
        sb.append("name='").append(name).append('\'');
        sb.append(", age=").append(age);
        sb.append(", tasks=").append(tasks);
        sb.append('}');
        return sb.toString();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Developer developer = (Developer) o;
        return Objects.equals(name, developer.name) && Objects.equals(age, developer.age) && Objects.equals(tasks, developer.tasks);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name, age, tasks);
    }

}
