package controllers;

import com.avaje.ebean.Ebean;
import models.Staff;
import play.mvc.Http.Context;
import play.mvc.Result;
import play.mvc.Security;

public class Secured extends Security.Authenticator {

    @Override
    public String getUsername(Context context) {
        return context.session().get("username");
    }

    @Override
    public Result onUnauthorized(Context context) {
        return redirect(routes.Application.login());
    }

    public static boolean isLoggedIn(Context context) {
        return context.session().containsKey("username");
    }

    public static String getUserInfo(Context context) {
        Staff staff = Ebean.find(Staff.class)
                .where()
                .eq("username", context.session().get("username"))
                .findList().get(0);

        return String.format("%s %s", staff.getFirstName(), staff.getLastName());
    }
}
