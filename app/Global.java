import com.avaje.ebean.Ebean;
import helpers.Security;
import helpers.Security.Authenticated;
import helpers.Security.Authorized;
import helpers.Security.AuthorizedRoles;
import helpers.Security.Roles;
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

        if (method.isAnnotationPresent(Authenticated.class) ||
                method.isAnnotationPresent(AuthorizedRoles.class) ||
                method.isAnnotationPresent(Authorized.class)) {

            AuthorizedRoles authorizedRoles = method.getAnnotation(AuthorizedRoles.class);
            Authorized[] authorized = new Authorized[] { method.getAnnotation(Authorized.class) };
            String originalUrl = request.uri();

            return new Action.Simple() {
                @Override
                public F.Promise<SimpleResult> call(Http.Context context) throws Throwable {
                    context.session().put("originalUrl", originalUrl);

                    if (!Security.isAuthenticated(context))
                        return F.Promise.pure(redirect(controllers.routes.Application.login()));

                    if ((authorizedRoles != null && !Security.isAuthorized(context, authorizedRoles.value())) ||
                            (authorized[0] != null && !Security.isAuthorized(context, authorized)))

                        return F.Promise.pure(redirect(controllers.routes.Application.unauthorizedPage()));

                    return delegate.call(context);
                }
            };
        }

        return super.onRequest(request, method);
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
        doctor.setRole(Security.Roles.DOCTOR);
        Ebean.save(doctor);

        Staff admin = new Staff();
        admin.setFirstName("Admin FirstName");
        admin.setLastName("Admin LastName");
        admin.setEmail("admin@staff.com");
        admin.setUsername("admin");
        admin.setPassword("admin");
        admin.setRole(Roles.ADMINISTRATOR);
        admin.save();

        Staff intern = new Staff();
        intern.setFirstName("Intern FirstName");
        intern.setLastName("Intern LastName");
        intern.setEmail("intern@staff.com");
        intern.setUsername("intern");
        intern.setPassword("intern");
        intern.setRole(Roles.INTERN);
        intern.save();

        Staff supervisor = new Staff();
        supervisor.setFirstName("Supervisor FirstName");
        supervisor.setLastName("Supervisor LastName");
        supervisor.setEmail("supervisor@staff.com");
        supervisor.setUsername("supervisor");
        supervisor.setPassword("supervisor");
        supervisor.setRole(Roles.SHIFT_SUPERVISOR);
        supervisor.save();

        Staff nurse = new Staff();
        nurse.setFirstName("Nurse FirstName");
        nurse.setLastName("Nurse LastName");
        nurse.setEmail("nurse@staff.com");
        nurse.setUsername("nurse");
        nurse.setPassword("nurse");
        nurse.setRole(Roles.NURSE);
        nurse.save();
    }
}
