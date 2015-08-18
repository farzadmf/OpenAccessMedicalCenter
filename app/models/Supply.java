package models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "Supplies")
public class Supply {

    @Id
    @Column(name = "Internal_Supply_ID")
    private Integer supplyId;

    @Column(name = "Name")
    private String name;

    @Column(name = "Description")
    private String description;

    @Column(name = "Price_Per_Unit")
    private BigDecimal pricePerUnit;

    @Column(name = "Expiration_Date")
    private Date expirationDate;

    @Column(name = "Main_Category")
    private String mainCategory;

    @Column(name = "Sub_Category")
    private String subCategory;
}
