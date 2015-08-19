package models.temp;

import models.current.Employee;
import models.current.Treatment;
import play.db.ebean.Model;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "EmployeeSchedule")
public class EmployeeSchedule extends Model {

    @Embeddable
    public class EmployeeScheduleKey {
        @Column(name = "Employee_ID")
        public Integer employeeId;
        @Column(name = "Patient_Treatment_ID")
        public Integer treatmentId;

        @Override
        public int hashCode() {
            return employeeId.hashCode() + treatmentId.hashCode();
        }

        @Override
        public boolean equals(Object obj) {
            if (obj == null)
                return false;

            if (!(obj instanceof EmployeeScheduleKey))
                return false;

            EmployeeScheduleKey other = (EmployeeScheduleKey) obj;
            return (other.employeeId.equals(employeeId) && other.treatmentId.equals(treatmentId));
        }
    }

    @EmbeddedId
    public EmployeeScheduleKey key;

    //TODO: add foreign keys for "Employee" and "PatientTreatment"
    @ManyToOne
    @JoinColumn(name = "Employee_ID")
    public List<Employee> employees;

    @ManyToOne
    @JoinColumn(name = "Patient_Treatment_ID")
    public List<Treatment> treatments;
}
