package models.current;

import play.db.ebean.Model;

import javax.persistence.*;
import java.sql.Time;
import java.util.List;

@Entity
@Table(name = "Shift_Type")
public class Shift extends Model {

    @Id
    @Column(name = "Shift_Type_ID")
    public Integer shiftTypeId;

    @Column(name = "Start_Time")
    public Time startTime;

    @Column(name = "Duration")
    public Integer duration;

    //TODO: add foreign key for "Unit"
    @ManyToOne
    @JoinColumn(name = "Unit_ID")
    public Unit unit;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "shift")
    public List<AssignedShift> assignedShifts;
}
