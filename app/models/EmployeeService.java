package models;

import play.db.ebean.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Employee_Services")
public class EmployeeService extends Model {
    //TODO: check foreign keys for "serviceId" and "employeeId"
}
