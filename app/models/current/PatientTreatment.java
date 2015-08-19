package models.current;

import play.db.ebean.Model;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "Treatment_Instances")
public class PatientTreatment extends Model {

    @Id
    @Column(name = "Instance_ID")
    public Integer patientTreatmentId;

//    @Embeddable
//    public class PatientTreatmentKey {
//        @Column(name = "Instance_ID")
//        public Integer instanceId;
//        @Column(name = "Location_Location_ID")
//        public Integer locationId;
//
//        @Override
//        public int hashCode() {
//            return instanceId.hashCode() + locationId.hashCode();
//        }
//
//        @Override
//        public boolean equals(Object obj) {
//            if (obj == null)
//                return false;
//
//            if (!(obj instanceof PatientTreatmentKey))
//                return false;
//
//            PatientTreatmentKey other = (PatientTreatmentKey) obj;
//            return (other.instanceId.equals(instanceId) && other.locationId.equals(locationId));
//        }
//    }
//
//    @EmbeddedId
//    private PatientTreatmentKey key;

    @Column(name = "Treatment_Date")
    private Date date;

    //TODO: add foreign keys for "patient", "employee", and "treatment"
    @ManyToOne
    @JoinColumn(name = "Patient_ID")
    public Patient patient;

    @ManyToOne
    @JoinColumn(name = "Employee_ID")
    public Employee employee;

    @ManyToOne
    @JoinColumn(name = "Treatment_ID")
    public Treatment treatment;

    @ManyToOne
    @JoinColumn(name = "Location_ID")
    public Location location;
}
