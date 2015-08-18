import com.avaje.ebean.Ebean;
import helpers.Config;
import helpers.Security;
import helpers.Security.Authenticated;
import helpers.Security.Authorized;
import helpers.Security.AuthorizedRoles;
import models.Staff;
import play.Application;
import play.GlobalSettings;
import play.libs.F;
import play.mvc.Action;
import play.mvc.Http;
import play.mvc.SimpleResult;

import java.lang.reflect.Method;

public class Global extends GlobalSettings {

    @Override
    public Action onRequest(Http.Request request, Method method) {
        String lastVisitedUrl;

        if (request.uri().toLowerCase().contains("login") || request.uri().toLowerCase().contains("logout"))
            return super.onRequest(request, method);

        lastVisitedUrl = request.uri();

        if (method.isAnnotationPresent(Authenticated.class) ||
                method.isAnnotationPresent(AuthorizedRoles.class) ||
                method.isAnnotationPresent(Authorized.class)) {

            AuthorizedRoles authorizedRoles = method.getAnnotation(AuthorizedRoles.class);
            Authorized[] authorized = new Authorized[] { method.getAnnotation(Authorized.class) };

            final String finalLastVisitedUrl = lastVisitedUrl;
            return new Action.Simple() {
                @Override
                public F.Promise<SimpleResult> call(Http.Context context) throws Throwable {
                    String pageBeforeLogin = context.session().get(Config.LAST_VISITED_URL);
                    context.session().put(Config.PAGE_BEFORE_LOGIN, pageBeforeLogin == null ? "/" : pageBeforeLogin);
                    context.session().put(Config.LAST_VISITED_URL, finalLastVisitedUrl);

                    if (!Security.isAuthenticated(context))
                        return F.Promise.pure(redirect(controllers.routes.Application.login()));

                    if ((authorizedRoles != null && !Security.isAuthorized(context, authorizedRoles.value())) ||
                            (authorized[0] != null && !Security.isAuthorized(context, authorized)))

                        return F.Promise.pure(redirect(controllers.routes.Application.unauthorizedPage()));

                    return delegate.call(context);
                }
            };

        }

        final String finalLastVisitedUrl = lastVisitedUrl;
        return new Action.Simple() {

            @Override
            public F.Promise<SimpleResult> call(Http.Context context) throws Throwable {
                context.session().put(Config.LAST_VISITED_URL, finalLastVisitedUrl);
                return delegate.call(context);
            }
        };
    }

    @Override
    public void onStart(Application application) {
        Ebean.delete(Ebean.find(Staff.class).findList());

        Staff doctor = new Staff();
        doctor.setFirstName("Doctor FirstName");
        doctor.setLastName("Doctor LastName");
        doctor.setEmail("doctor@staff.com");
        doctor.setUsername("doctor");
        doctor.setPassword("doctor");
        doctor.setRole(Config.Roles.DOCTOR);
        Ebean.save(doctor);

        Staff admin = new Staff();
        admin.setFirstName("Admin FirstName");
        admin.setLastName("Admin LastName");
        admin.setEmail("admin@staff.com");
        admin.setUsername("admin");
        admin.setPassword("admin");
        admin.setRole(Config.Roles.ADMINISTRATOR);
        admin.save();

        Staff intern = new Staff();
        intern.setFirstName("Intern FirstName");
        intern.setLastName("Intern LastName");
        intern.setEmail("intern@staff.com");
        intern.setUsername("intern");
        intern.setPassword("intern");
        intern.setRole(Config.Roles.INTERN);
        intern.save();

        Staff supervisor = new Staff();
        supervisor.setFirstName("Supervisor FirstName");
        supervisor.setLastName("Supervisor LastName");
        supervisor.setEmail("supervisor@staff.com");
        supervisor.setUsername("supervisor");
        supervisor.setPassword("supervisor");
        supervisor.setRole(Config.Roles.SHIFT_SUPERVISOR);
        supervisor.save();

        Staff nurse = new Staff();
        nurse.setFirstName("Nurse FirstName");
        nurse.setLastName("Nurse LastName");
        nurse.setEmail("nurse@staff.com");
        nurse.setUsername("nurse");
        nurse.setPassword("nurse");
        nurse.setRole(Config.Roles.NURSE);
        nurse.save();
    }
}
