package models.current;

import play.db.ebean.Model;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "Location")
public class Location extends Model {

    @Id
    @Column(name = "Location_ID")
    @GeneratedValue
    public Integer locationId;

    @Column(name = "Floor")
    public Integer floor;

    @Column(name = "Room")
    public Integer room;

    //TODO: Are we sure we want bed-count to be a string
    @Column(name = "BedCount")
    public Integer bedCount;

    @ManyToOne
    @JoinColumn(name = "Unit_ID")
    public Unit unit;

    @OneToMany(mappedBy = "location")
    public List<PatientTreatment> treatments;
}
