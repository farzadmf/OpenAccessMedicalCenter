package models.temp;

import play.db.ebean.Model;

import javax.persistence.*;

@Entity
@Table(name = "Order_Details")
public class OrderDetails extends Model {

    @Embeddable
    public class OrderDetailKey {
        @Column(name = "Order_ID")
        public Integer orderId;
        @Column(name = "Supply_ID")
        public Integer supplyId;

        @Override
        public int hashCode() {
            return orderId.hashCode() + supplyId.hashCode();
        }

        @Override
        public boolean equals(Object obj) {
            if (obj == null)
                return false;

            if (!(obj instanceof OrderDetailKey))
                return false;

            OrderDetailKey other = (OrderDetailKey) obj;
            return (other.orderId.equals(orderId) && other.supplyId.equals(supplyId));
        }
    }

    @EmbeddedId
    private OrderDetailKey key;

    @Column(name = "Quantity")
    private Integer quantity;

    @Column(name = "Received_Quantity")
    private Integer receivedQuantity;

    //TODO: add foreign key for "Order" and "Supply"
}
