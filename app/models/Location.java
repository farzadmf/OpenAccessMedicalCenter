package models;

import play.db.ebean.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Location")
public class Location extends Model {

    @Id
    @Column(name = "Location_ID")
    private Integer locationId;

    @Column(name = "Unit_ID")
    private Integer unitId;

    @Column(name = "Floor")
    private Integer floor;

    @Column(name = "Room")
    private Integer room;

    //TODO: Are we sure we want bed-count to be a string
    @Column(name = "BedCount")
    private String bedCount;

}
