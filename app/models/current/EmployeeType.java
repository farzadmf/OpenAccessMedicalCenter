package models.current;

import play.db.ebean.Model;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;

@Entity
@Table(name = "Employee_Type")
public class EmployeeType extends Model {

    public enum EmployeeTypes {
        Administrator,
        Director,
        Doctor,
        Nurse,
        ShiftSupervisor,
        Intern,
        Resident,
        Technician;
    }

    @Id
    @Column(name = "Employee_Type_ID")
    @GeneratedValue
    public Integer employeeTypeId;

    @Column(name = "Employee_Type")
    @Enumerated(value = EnumType.STRING)
    public EmployeeTypes employeeType;

    @Column(name = "Level")
    public Integer accessLevel;

    @Column(name = "Rate")
    public BigDecimal rate;

    @Column(name = "Seniority_Multiplier")
    public BigDecimal seniorityMultiplier;

    @Column(name = "Overtime_Rate")
    public BigDecimal overtimeRate;

    @OneToMany(mappedBy = "employeeType")
    public List<Employee> employees;
}
