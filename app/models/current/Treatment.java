package models.current;

import play.db.ebean.Model;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;

@Entity
@Table(name = "Treatment")
public class Treatment extends Model {

    @Id
    @Column(name = "Treatment_ID")
    @GeneratedValue
    public Integer treatmentId;

    @Column(name = "Name")
    public String name;

    @Column(name = "Cost")
    public BigDecimal cost;

    @OneToMany(mappedBy = "treatment")
    public List<PatientTreatment> treatments;
}
