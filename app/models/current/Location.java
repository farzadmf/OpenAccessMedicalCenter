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
    private Integer locationId;

    @Column(name = "Floor")
    private Integer floor;

    @Column(name = "Room")
    private Integer room;

    //TODO: Are we sure we want bed-count to be a string
    @Column(name = "BedCount")
    private Integer bedCount;

    @ManyToOne
    @JoinColumn(name = "Unit_ID")
    public Unit unit;

    @OneToMany(mappedBy = "location")
    public List<PatientTreatment> treatments;
}
