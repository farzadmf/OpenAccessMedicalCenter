package models;

import play.db.ebean.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Carrier")
public class Carrier extends Model {

    @Id
    @Column(name = "Carrier_ID")
    private Integer carrierId;

    @Column(name = "Name")
    private String name;

    @Column(name = "Address")
    private String address;

    @Column(name = "Phone_Number")
    private Integer phoneNumber;

    @Column(name = "Fax_Number")
    private Integer faxNumber;

    //TODO: do we want question mark here???
    @Column(name = "Can_Rush?")
    private Boolean canRush;

}
