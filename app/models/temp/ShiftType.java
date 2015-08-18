package models.temp;

import play.db.ebean.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.sql.Time;

@Entity
@Table(name = "Shift_Type")
public class ShiftType extends Model {

    @Id
    @Column(name = "Shift_Type_ID")
    private Integer shiftTypeId;

    @Column(name = "Start_Time")
    private Time startTime;

    @Column(name = "Duration")
    private Integer duration;

    //TODO: add foreign key for "Unit"
}
