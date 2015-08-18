package models;

import play.db.ebean.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.sql.Date;

@Entity
@Table(name = "Doctor Rotation")
public class DoctorRotation extends Model {

    @Id
    @Column(name = "Roation_ID")
    private Integer rotationId;

    @Column(name = "Start_Date")
    private Date startDate;

    @Column(name = "End_Date")
    private Date endDate;

    //TODO: add foreign keys for "Doctor" and "Unit"
}
