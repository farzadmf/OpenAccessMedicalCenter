package models.current;

import com.avaje.ebean.Ebean;
import models.current.EmployeeType.EmployeeTypes;
import play.db.ebean.Model;

import javax.persistence.*;
import java.sql.Date;
import java.util.List;

@Entity
@Table(name = "Employee")
public class Employee extends Model {
    @Id
    @Column(name = "Employee_ID")
    @GeneratedValue
    public Integer employeeId;

    @Column(name = "Last_Name")
    public String lastName;

    @Column(name = "First_Name")
    public String firstName;

    @Column(name = "Salary_Type")
    public String salaryType;

    @Column(name = "Specialization")
    public String specialization;

    @Column(name = "Hire_Date")
    public Date hireDate;

    @Column(name = "Years_Experience")
    public Integer yearsExperience;

    @Column(name = "user_name", unique = true)
    public String username;

    @Column(name = "password")
    public String password;

    @ManyToOne
    @JoinColumn(name = "unit_id")
    public Unit unit;

    @ManyToOne
    @JoinColumn(name = "employee_type_id")
    public EmployeeType employeeType;

    @OneToMany(mappedBy = "employee")
    public List<PatientTreatment> treatments;

    public static Employee getByUsername(String username) {
        return Ebean.find(Employee.class)
                .where()
                .eq("username", username)
                .findUnique();
    }
}
