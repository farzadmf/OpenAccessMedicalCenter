package models;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "Patient_Treatment_Instances")
public class PatientTreatment {

    @Embeddable
    public class PatientTreatmentKey {
        @Column(name = "Instance_ID")
        public Integer instanceId;
        @Column(name = "Location_Location_ID")
        public Integer locationId;

        @Override
        public int hashCode() {
            return instanceId.hashCode() + locationId.hashCode();
        }

        @Override
        public boolean equals(Object obj) {
            if (obj == null)
                return false;

            if (!(obj instanceof PatientTreatmentKey))
                return false;

            PatientTreatmentKey other = (PatientTreatmentKey) obj;
            return (other.instanceId.equals(instanceId) && other.locationId.equals(locationId));
        }
    }

    @EmbeddedId
    private PatientTreatmentKey key;

    @Column(name = "Treatment_Date")
    private Date date;

    //TODO: add foreign keys for "patient", "employee", and "treatment"
}
