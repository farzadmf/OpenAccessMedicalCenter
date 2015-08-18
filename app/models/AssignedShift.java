package models;

import play.db.ebean.Model;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Time;

@Entity
@Table(name = "Assigned_Shift")
public class AssignedShift extends Model {

    @Embeddable
    public class AssignedShiftKey {
        @Column(name = "Shift_ID")
        public Integer shiftId;
        @Column(name = "Employee_ID")
        public Integer employeeId;

        @Override
        public int hashCode() {
            return shiftId.hashCode() + employeeId.hashCode();
        }

        @Override
        public boolean equals(Object obj) {
            if (obj == null)
                return false;

            if (!(obj instanceof AssignedShiftKey))
                return false;

            AssignedShiftKey other = (AssignedShiftKey) obj;
            return (other.employeeId.equals(employeeId) && other.shiftId.equals(shiftId));
        }
    }

    @EmbeddedId
    private AssignedShiftKey key;

    @Column(name = "Date")
    private Date date;

    @Column(name = "Override_Start")
    private Time overrideStart;

    @Column(name = "Override_Duration")
    private Time overrideDuration;

    //TODO: add foreign key for "Shift", "Employee", "Supervisor"
}
