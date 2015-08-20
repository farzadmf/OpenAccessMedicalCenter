package controllers;

import com.avaje.ebean.Ebean;
import helpers.Config;
import helpers.Security;
import helpers.Security.Authorized;
import models.current.Employee;
import models.current.EmployeeType.EmployeeTypes;
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
        Form<Employee> employeeForm = Form.form(Employee.class).bindFromRequest();

        if (employeeForm.data().containsKey("loginCancel")) {
            String pageBeforeLogin = session(Config.PAGE_BEFORE_LOGIN);
            return redirect(pageBeforeLogin == null ? "/" : pageBeforeLogin);
        }

        Employee employee = employeeForm.get();

        if (!Security.login(ctx(), employee.username, employee.password))
            return ok(views.html.temp.noUserPassword.render());

        String originalUrl = session().get("lastVisitedUrl");
        return redirect(originalUrl == null ? "/" : originalUrl);
    }

    public static Result logout() {
        session().clear();
        return ok(index.render("You have logged out of the system. See you later!"));
    }

    public static Result unauthorizedPage() {
        return unauthorized(views.html.temp.unauthorized.render());
    }
}
