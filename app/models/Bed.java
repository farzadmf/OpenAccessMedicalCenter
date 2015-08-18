package models;

import play.db.ebean.Model;

import javax.persistence.*;

@Entity
@Table(name = "Beds")
public class Bed extends Model {

    @Embeddable
    public class BedKey {
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
    private BedKey key;

    //TODO: set the foreign key for "patient"
    //TODO: shouldn't we allow NULLs for patient
}
