package helpers;

import com.avaje.ebean.Ebean;
import models.current.Employee;
import models.current.EmployeeType;
import play.mvc.Http.Context;

import java.lang.annotation.*;

/**
 * This class is used to implement a custom security mechanism
 */
public class Security {

    @Retention(RetentionPolicy.RUNTIME)
    @Target(ElementType.METHOD)
    public @interface AuthorizedRoles {
        Authorized[] value();
    }

    /**
     * This is the annotation used to indicate which roles are allowed to access
     *      a specific method
     */
    @Retention(RetentionPolicy.RUNTIME)
    @Target(ElementType.METHOD)
    @Repeatable(AuthorizedRoles.class)
    public @interface Authorized {
        EmployeeType.EmployeeTypes role();
    }

    @Retention(RetentionPolicy.RUNTIME)
    @Target(ElementType.METHOD)
    public @interface Authenticated { }

    public static boolean isAuthenticated(Context context) {
        return context.session().containsKey("username");
    }

    public static boolean isAuthorized(Context context, Authorized[] roles) {
        String username = context.session().get("username");
        Employee employee = Employee.getByUsername(context.session().get("username"));

        if (employee == null)
            return false;

        for (Authorized authorized: roles)
            if (employee.employeeType.employeeType == authorized.role())
                return true;

        return false;
    }

    public static boolean login(Context context, String username, String password) {
        Employee employee = Ebean.find(Employee.class)
                .where()
                .eq("username", username)
                .eq("password", password)
                .findUnique();

        if (employee != null) {
            context.session().put("username", username);
            return true;
        }

        return false;
    }

    public static boolean isLoggedIn(Context context) {
        return context.session().containsKey("username");
    }

    public static String getUserInfo(Context context) {
        Employee employee = Employee.getByUsername(context.session().get("username"));
        return String.format("%s %s (%s)", employee.firstName, employee.lastName,
                employee.employeeType.employeeType);
    }

    public static Integer getAccessLevel(Context context) {
        if (!(context.session().containsKey("username")))
            return -1;

        EmployeeType employeeType = Ebean.find(Employee.class)
                .fetch("employeeType")
                .where()
                .eq("user_name", context.session().get("username"))
                .findUnique().employeeType;

        return Ebean.find(EmployeeType.class)
                .where()
                .eq("Employee_Type", employeeType.employeeType)
                .findUnique().accessLevel;
    }
}
