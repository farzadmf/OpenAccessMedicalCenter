package models;

import play.db.ebean.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.sql.Date;

@Entity
@Table(name = "Employee")
public class Employee extends Model {
    @Id
    @Column(name = "Employee_ID")
    private Integer employeeId;

    @Column(name = "Last_Name")
    private String lastName;

    @Column(name = "First_Name")
    private String firstName;

    @Column(name = "Salary_Type")
    private String salaryType;

    @Column(name = "Specialization")
    private String specialization;

    @Column(name = "Hire_Date")
    private Date hireDate;

    @Column(name = "Years_Experience")
    private Integer yearsExperience;

    //TODO: check the foreign keys for "unit" and "employeeType"
}
