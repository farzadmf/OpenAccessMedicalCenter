package models;

import java.util>*;
import javax.persistence.*;

import play.db.ebean.*;
import play.data.format.*;
import play.data.validation.*;

/* Guidelines

This is the Ebean mappings I made in Notepad ++ for those entities that 
have no foreign keys: Patient, Unit, Vendors, Carrier, Supplies, 
Service_Type. The file comments include some links to important JavaDoc
files, and the guidelines I used in making these.  There are bound to be 
some errors, and I don't know all the Formatting/Constraining methods. 


-all attributes have public visibility
-the variable name is the same as the column name
-constraints are listed above the variable declaration


-public static Finder<keydatatype, classname> find = new Finder<keydatatype, classname>(
	keydatatype.class, classname.class);
	
	public static Finder<kdt, cn> find = new Finder<kdt, cn>(
	kdt.class, cn.class);
	
	Documentation Overview: https://www.playframework.com/documentation/2.4.x/api/java/overview-summary.html
	Constraints: https://www.playframework.com/documentation/2.4.x/api/java/play/data/validation/Constraints.html
	Formats: https://www.playframework.com/documentation/2.4.x/api/java/play/data/format/Formats.html
	One-to-Many: https://docs.oracle.com/javaee/6/api/javax/persistence/OneToMany.html
	
*/

@Entity
public class Patient extends Model {
	
	@ID
	public int Patient_ID;
	
	@Constraints.Max(45)
	public String Last_Name;
	
	@Constraints.Max(45)
	public String First_Name;
	
	public int Phone_Number
	public String Address;
	
	@Constraints.Equals(12)
	
	public String Medicare_Number;
	
	public static Finder<int,Patient> find = new Finder<int, Patient>(
	int.class, Patient.class);
}

@Entity 
public class Unit extends Model {
	
	@ID
	public int Unit_ID;
	
	@Constraints.Max(45);
	public String Name;
	
	public static Finder<int, Unit> find = new Finder<int, Unit>(
	int.class, Unit.class);

}

@Entity
public class Vendors extends Model {
	
	@ID
	public int Vendor_ID;
	
	@Constraints.Max(45)
	public String Name;
	
	@Constraints.Max(45)
	public String Address;
	
	public int Phone_Number;
	
	public int Fax_Number;
	
	public static Finder<int, Vendor> find = new Finder<int, Vendor>(
	int.class, Vendor.class);

}

@Entity
public class Carrier extends Model {
	
	@ID
	public int Carrier_ID;
	
	@Constraints.Max(45)
	public String Name;
	
	@Constraints.Max(45)
	public String Address;
	
	public int Phone_Number;
	
	public int Fax_Number;
	
	public boolean Can_Rush?;
	
	public static Finder<int, Carrier> find = new Finder<int, Carrier>(
	int.class, Carrier.class);

}

@Entity
public class Supplies extends Model {
	
	@ID
	public int Internal_Supply_ID;
	
	//WHAT IS THE LENGTH OF TINYTEXT?!
	@Constraints.
	public String Name;
	
	//WHAT IS THE LENGTH OF LONGTEXT?
	@Constraints.
	public String Description;
	
	//HOW DO WE CONSTRAIN DECIMAL FORMATTING?
	@Constraints.
	public float Price_per_Unit;
	
	@Formats.DateTime(pattern="dd/MM/yyyy")
	public Date Expiration_Date;
	
	@Constraints.Max(45)
	public String Main_Category;
	
	@Constraints.Max(45)
	public String Sub_Category;
	
	public static Finder<int, Supplies> find = new Finder<int, Supplies>(
	int.class, Supplies.class);
	
}

@Entity
public class Service_Type extends Model {

	@ID
	public int Service_ID;
	
	//Illegible att
	
	//Illegible att
	
	//Illegible att
}
