package models;

import play.db.ebean.Model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "Order")
public class Order extends Model {

    @Embeddable
    public class OrderKey {
        @Column(name = "Order_ID")
        public Integer orderId;
        @Column(name = "Carrier_Carrier_ID")
        public Integer carrierId;
        @Column(name = "Vendors_Vendor_ID")
        public Integer vendorId;

        @Override
        public int hashCode() {
            return orderId.hashCode() + carrierId.hashCode() + vendorId.hashCode();
        }

        @Override
        public boolean equals(Object obj) {
            if (obj == null)
                return false;

            if (!(obj instanceof OrderKey))
                return false;

            OrderKey other = (OrderKey)obj;
            return (other.orderId.equals(orderId) && other.carrierId.equals(carrierId) &&
                    other.vendorId.equals(vendorId));
        }
    }

    @EmbeddedId
    private OrderKey key;

    @Column(name = "Date")
    private Date date;

    //TODO: do we want question mark here???
    @Column(name = "Rush?")
    private Boolean rush;

    // TODO: add foreign keys for "Vendor" and "Carrier"
}
