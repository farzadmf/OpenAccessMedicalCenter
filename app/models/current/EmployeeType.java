package models.current;

import play.db.ebean.Model;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.List;

@Entity
@Table(name = "Employee_Type")
public class EmployeeType extends Model {

    @Id
    @Column(name = "Employee_Type_ID")
    @GeneratedValue
    public Integer employeeTypeId;

    @Column(name = "Employee_Type")
    public String employeeType;

    @Column(name = "Rate")
    public BigDecimal rate;

    @Column(name = "Seniority_Multiplier")
    public BigDecimal seniorityMultiplier;

    @Column(name = "Overtime_Rate")
    public BigDecimal overtimeRate;

    @OneToMany(mappedBy = "employeeType")
    public List<Employee> employees;
}
