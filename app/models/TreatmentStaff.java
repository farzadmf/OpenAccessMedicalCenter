package models;

import play.db.ebean.Model;

import javax.persistence.*;

@Entity
@Table(name = "TreatmentStaff")
public class TreatmentStaff extends Model {

    @Embeddable
    public class TreatmentStaffKey {
        @Column(name = "Employee_Type_ID")
        public Integer employeeTypeId;
        @Column(name = "Treatment_ID")
        public Integer treatmentId;

        @Override
        public int hashCode() {
            return employeeTypeId.hashCode() + treatmentId.hashCode();
        }

        @Override
        public boolean equals(Object obj) {
            if (obj == null)
                return false;

            if (!(obj instanceof TreatmentStaffKey))
                return false;

            TreatmentStaffKey other = (TreatmentStaffKey) obj;
            return (other.employeeTypeId.equals(employeeTypeId) && other.treatmentId.equals(treatmentId));
        }
    }

    @EmbeddedId
    private TreatmentStaffKey key;

    //TODO: add foregin keys for "EmployeeType" and "TreatmentID"
}
