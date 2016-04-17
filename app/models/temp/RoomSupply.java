package models.temp;

import play.db.ebean.Model;

import javax.persistence.*;

@Entity
@Table(name = "Room_Supply")
public class RoomSupply extends Model {

    @Embeddable
    public class RoomSupplyKey {
        @Column(name = "Location_ID")
        public Integer locationId;
        @Column(name = "Supplies_Internal_Supply_ID")
        public Integer supplyId;

        @Override
        public int hashCode() {
            return locationId.hashCode() + supplyId.hashCode();
        }

        @Override
        public boolean equals(Object obj) {
            if (obj == null)
                return false;

            if (!(obj instanceof RoomSupplyKey))
                return false;

            RoomSupplyKey other = (RoomSupplyKey) obj;
            return (other.locationId.equals(locationId) && other.supplyId.equals(supplyId));
        }
    }

    @EmbeddedId
    private RoomSupplyKey key;

    @Column(name = "Quantity")
    private Integer quantity;

    @Column(name = "Alotment")
    private Integer allotment;

    //TODO: Add foreign keys for "Location" and "Supply"
}
