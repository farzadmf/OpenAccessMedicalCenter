package models.temp;

import play.db.ebean.Model;

import javax.persistence.*;

@Entity
@Table(name = "TreatmentSupply")
public class TreatmentSupply extends Model {

    @Embeddable
    public class TreatmentSupplyKey {
        @Column(name = "Patient_Treatment_ID")
        public Integer patientTreatmentId;
        @Column(name = "Supply_ID")
        public Integer supplyId;

        @Override
        public int hashCode() {
            return patientTreatmentId.hashCode() + supplyId.hashCode();
        }

        @Override
        public boolean equals(Object obj) {
            if (obj == null)
                return false;

            if (!(obj instanceof TreatmentSupplyKey))
                return false;

            TreatmentSupplyKey other = (TreatmentSupplyKey) obj;
            return (other.patientTreatmentId.equals(patientTreatmentId) && other.supplyId.equals(supplyId));
        }
    }

    @EmbeddedId
    private TreatmentSupplyKey key;

    //TODO: add foreign keys for "PatientTreatment" and "Supply"
}
