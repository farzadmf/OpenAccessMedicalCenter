package models.temp;

import play.db.ebean.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Patient")
public class Patient extends Model {

    @Id
    @Column(name = "Patient_ID")
    private Integer patientId;

    @Column(name = "Last_Name")
    private String lastName;

    @Column(name = "First_Name")
    private String firstName;

    @Column(name = "Phone_Number")
    private Integer phoneNumber;

    @Column(name = "Address")
    private String address;

    @Column(name = "Medicare_Number")
    private String medicareNumber;

}
