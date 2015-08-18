package models;

import play.db.ebean.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.math.BigDecimal;

@Entity
@Table(name = "Service_Type")
public class ServiceType extends Model {
    @Id
    @Column(name = "Service_ID")
    private Integer serviceId;

    @Column(name = "Service_Name")
    private String serviceName;

    @Column(name = "Description")
    private String description;

    @Column(name = "Cost")
    private BigDecimal cost;
}
