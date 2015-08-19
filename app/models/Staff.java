package models;

//import com.avaje.ebean.Ebean;
//import models.current.EmployeeType.EmployeeTypes;
//import play.db.ebean.Model;
//
//import javax.persistence.Column;
//import javax.persistence.Entity;
//import javax.persistence.GeneratedValue;
//import javax.persistence.Id;
//import java.util.List;
//
//@Entity
//public class Staff extends Model {
//    @Id
//    @GeneratedValue
//    private Long Id;
//
//    @Column(unique = true, nullable = false)
//    private String username;
//
//    @Column(unique = true, nullable = false)
//    private String email;
//
//    @Column(nullable = false)
//    private String password;
//
//    private EmployeeTypes role;
//
//    private String firstName;
//    private String lastName;
//
//    public static Finder<Long, Staff> find = new Finder<>(Long.class, Staff.class);
//
//    public static List<Staff> getByUsername(String username) {
//        return Ebean.find(Staff.class)
//                .where()
//                .eq("username", username)
//                .findList();
//    }
//
//    public String getFirstName() { return firstName; }
//    public void setFirstName(String firstName) { this.firstName = firstName; }
//    public Long getId() { return Id; }
//    public void setId(Long id) { Id = id; }
//    public String getLastName() { return lastName; }
//    public void setLastName(String lastName) { this.lastName = lastName; }
//    public String getPassword() { return password; }
//    public void setPassword(String password) { this.password = password; }
//    public String getUsername() { return username; }
//    public void setUsername(String username) { this.username = username; }
//    public String getEmail() { return email; }
//    public void setEmail(String email) { this.email = email; }
//    public EmployeeTypes getRole() { return role; }
//    public void setRole(EmployeeTypes role) { this.role = role; }
//
//    @Override
//    public String toString() {
//        return "[ Staff: " + "username: " + username + ", password = " + password +
//                ", email = " + email + " ]";
//    }
//}
