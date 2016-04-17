package models.temp;

import models.current.AssignedShift;
import models.temp.Bed;
import play.db.ebean.Model;

import javax.persistence.*;

@Entity
@Table(name = "Bed_assigned_to_shift")
public class ShiftBed extends Model {

    @Embeddable
    public class ShiftBedKey {
        @Column(name = "Bed_ID")
        public Integer bedId;
        @Column(name = "Shift_ID")
        public Integer shiftId;

        @Override
        public int hashCode() {
            return bedId.hashCode() + shiftId.hashCode();
        }

        @Override
        public boolean equals(Object obj) {
            if (obj == null)
                return false;

            if (!(obj instanceof ShiftBedKey))
                return false;

            if (bedId == null || shiftId == null)
                return false;

            ShiftBedKey other = (ShiftBedKey) obj;
            return (other.bedId.equals(bedId) && other.shiftId.equals(shiftId));
        }
    }

    @EmbeddedId
    public ShiftBedKey key;

    @ManyToOne
    @JoinColumn(name = "Bed_ID")
    public Bed bed;

    @ManyToOne
    @JoinColumn(name = "Shift_ID")
    public AssignedShift assignedShift;
}
