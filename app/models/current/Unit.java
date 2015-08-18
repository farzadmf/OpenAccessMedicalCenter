package models.current;

import play.db.ebean.Model;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "Unit")
public class Unit extends Model {

    @Id
    @Column(name = "Unit_ID")
    public Integer unitId;

    @Column(name = "Name")
    public String name;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "unit")
    public List<Employee> employees;
}
