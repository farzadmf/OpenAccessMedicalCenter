package models;

import play.db.ebean.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.math.BigDecimal;

@Entity
@Table(name = "Treatment")
public class Treatment extends Model {

    @Id
    @Column(name = "Treatment_ID")
    private Integer treatmentId;

    @Column(name = "Name")
    private String name;

    @Column(name = "Cost")
    private BigDecimal cost;

}
