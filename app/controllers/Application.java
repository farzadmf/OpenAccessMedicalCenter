package controllers;

import com.avaje.ebean.Ebean;
import helpers.Config;
import helpers.Security.Authorized;
import models.Staff;
import play.data.Form;
import play.mvc.Controller;
import play.mvc.Result;
import views.html.index;

import java.util.List;

public class Application extends Controller {

    public static Result index() {
        return ok(index.render("Your new application is ready."));
    }

    public static Result login() {
        return ok(views.html.viewhelpers.loginForm.render());
    }

    public static Result postLogin() {
        Form<Staff> staffForm = Form.form(Staff.class).bindFromRequest();

        if (staffForm.data().containsKey("loginCancel")) {
            String pageBeforeLogin = session(Config.PAGE_BEFORE_LOGIN);
            return redirect(pageBeforeLogin == null ? "/" : pageBeforeLogin);
        }

        Staff staff = staffForm.get();

        List<Staff> staffs = Ebean.find(Staff.class)
                .where()
                .eq("username", staff.getUsername())
                .eq("password", staff.getPassword())
                .findList();

        if (staffs.size() == 0)
            return ok("Username password don't exist");

        session("username", staff.getUsername());
        String originalUrl = session().get("lastVisitedUrl");
        return redirect(originalUrl == null ? "/" : originalUrl);
    }

    public static Result logout() {
        session().clear();
        return ok(index.render("You have logged out of the system. See you later!"));
    }

    @Authorized(role = Config.Roles.ADMINISTRATOR)
    public static Result admin() {
        return ok(views.html.temp.authorized.render(Config.Roles.ADMINISTRATOR.toString()));
    }

    @Authorized(role = Config.Roles.DOCTOR)
    public static Result doctor() {
        return ok(views.html.temp.authorized.render(Config.Roles.DOCTOR.toString()));
    }

    @Authorized(role = Config.Roles.INTERN)
    public static Result intern() {
        return ok(views.html.temp.authorized.render(Config.Roles.INTERN.toString()));
    }

    @Authorized(role = Config.Roles.SHIFT_SUPERVISOR)
    public static Result shiftSupervisor() {
        return ok(views.html.temp.authorized.render(Config.Roles.SHIFT_SUPERVISOR.toString()));
    }

    @Authorized(role = Config.Roles.NURSE)
    public static Result nurse() {
        return ok(views.html.temp.authorized.render(Config.Roles.NURSE.toString()));
    }

    public static Result unauthorizedPage() {
        return unauthorized(views.html.temp.unauthorized.render());
    }
}
