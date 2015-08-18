package models;

import play.db.ebean.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.math.BigDecimal;

@Entity
@Table(name = "Employee_Type")
public class EmployeeType extends Model {

    @Id
    @Column(name = "Employee_Type_ID")
    private Integer employeeTypeId;

    @Column(name = "Employee_Type")
    private String employeeType;

    @Column(name = "Rate")
    private BigDecimal rate;

    @Column(name = "Seniority_Multiplier")
    private BigDecimal seniorityMultiplier;

    @Column(name = "Overtime_Rate")
    private BigDecimal overtimeRate;

    @Column(name = "Level")
    private String level;
}
