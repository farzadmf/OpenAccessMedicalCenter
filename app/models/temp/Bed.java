package models.temp;

import models.current.Patient;
import play.db.ebean.Model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "Bed")
public class Bed extends Model {

    @Embeddable
    public class BedKey implements Serializable {
        @Column(name = "Bed_ID")
        public Integer bedId;
        @Column(name = "Location_Location_ID")
        public Integer locationId;

        @Override
        public int hashCode() {
            return bedId.hashCode() + locationId.hashCode();
        }

        @Override
        public boolean equals(Object obj) {
            if (obj == null)
                return false;

            if (!(obj instanceof BedKey))
                return false;

            BedKey other = (BedKey) obj;
            return (other.bedId.equals(bedId) && other.locationId.equals(locationId));
        }
    }

    @EmbeddedId
    public BedKey key;

    @ManyToOne
    @JoinColumn(name = "Patient_ID")
    public Patient patient;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "bedId")
    public List<ShiftBed> shiftBeds;
}
