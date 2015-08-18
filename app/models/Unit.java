package models;

import play.db.ebean.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Unit")
public class Unit extends Model {
    @Id
    @Column(name = "Unit_ID")
    private Integer unitId;

    @Column(name = "Name")
    private String name;
}
