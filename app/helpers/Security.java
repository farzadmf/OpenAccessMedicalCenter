package helpers;

import com.avaje.ebean.Ebean;
import models.Staff;
import play.mvc.Http;

import java.lang.annotation.*;
import java.util.List;

/**
 * This class is used to implement a custom security mechanism
 */
public class Security {

    /**
     * Roles available in the application
     */
    public enum Roles {
        ADMINISTRATOR,
        DOCTOR,
        INTERN,
        SHIFT_SUPERVISOR,
        NURSE;
    }

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
        Roles role();
    }

    @Retention(RetentionPolicy.RUNTIME)
    @Target(ElementType.METHOD)
    public @interface Authenticated { }

    public static boolean isAuthenticated(Http.Context context) {
        return context.session().containsKey("username");
    }

    public static boolean isAuthorized(Http.Context context, Authorized[] roles) {
        String username = context.session().get("username");
        List<Staff> staffs = Staff.getByUsername(username);

        if (staffs.size() == 0 || staffs.size() > 1)
            return false;

        Staff staff = staffs.get(0);
        for (Authorized authorized: roles)
            if (staff.getRole() == authorized.role())
                return true;

        return false;
    }

    public static String getUserInfo(Http.Context context) {
        Staff staff = Ebean.find(Staff.class)
                .where()
                .eq("username", context.session().get("username"))
                .findList().get(0);

        return String.format("%s %s", staff.getFirstName(), staff.getLastName());
    }
}
