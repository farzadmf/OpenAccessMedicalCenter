package models.current;

import play.db.ebean.Model;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "Patient")
public class Patient extends Model {

    @Id
    @Column(name = "Patient_ID")
    public Integer patientId;

    @Column(name = "Last_Name")
    public String lastName;

    @Column(name = "First_Name")
    public String firstName;

    @Column(name = "Phone_Number")
    public String phoneNumber;

    @Column(name = "Address")
    public String address;

    @Column(name = "Medicare_Number")
    public String medicareNumber;

    @OneToMany(mappedBy = "patient")
    public List<PatientTreatment> treatments;
}
