package models;

import play.db.ebean.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Vendors")
public class Vendor extends Model {

    @Id
    @Column(name = "Vendor_ID")
    private Integer vendorId;

    @Column(name = "Name")
    private String name;

    @Column(name = "Address")
    private String address;

    @Column(name = "Phone_Number")
    private Integer phoneNumber;

    @Column(name = "Fax_Number")
    private Integer faxNumber;

}
