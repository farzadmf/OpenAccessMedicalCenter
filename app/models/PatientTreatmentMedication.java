package models;

import play.db.ebean.Model;

import javax.persistence.*;

@Entity
@Table(name = "Patient_Treatment_Instances_has_Medication")
public class PatientTreatmentMedication extends Model {

    @Embeddable
    public class PatientTreatmentMedicationKey {
        @Column(name = "Patient_Treatment_Instances_ID")
        public Integer instanceId;
        @Column(name = "Medication_ID")
        public Integer locationId;

        @Override
        public int hashCode() {
            return instanceId.hashCode() + locationId.hashCode();
        }

        @Override
        public boolean equals(Object obj) {
            if (obj == null)
                return false;

            if (!(obj instanceof PatientTreatmentMedicationKey))
                return false;

            PatientTreatmentMedicationKey other = (PatientTreatmentMedicationKey) obj;
            return (other.instanceId.equals(instanceId) && other.locationId.equals(locationId));
        }
    }

    @EmbeddedId
    private PatientTreatmentMedicationKey key;

    //TODO: add foreign keys for "PatientTreatment" and "Medication"
}
