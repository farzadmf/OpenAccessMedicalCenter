import com.avaje.ebean.Ebean;
import helpers.Config;
import helpers.Security;
import helpers.Security.Authenticated;
import helpers.Security.Authorized;
import helpers.Security.AuthorizedRoles;
import models.current.EmployeeType;
import models.current.EmployeeType.EmployeeTypes;
import play.Application;
import play.GlobalSettings;
import play.libs.F;
import play.mvc.Action;
import play.mvc.Http;
import play.mvc.SimpleResult;

import java.lang.reflect.Method;
import java.math.BigDecimal;

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
//        insertStaff();
        Ebean.delete(Ebean.find(EmployeeType.class).findList());

        EmployeeType employeeType1 = new EmployeeType();
        employeeType1.employeeType = EmployeeTypes.Administrator;
        employeeType1.overtimeRate = new BigDecimal(4);
        employeeType1.rate = new BigDecimal(5);
        employeeType1.seniorityMultiplier = new BigDecimal(6);
        Ebean.save(employeeType1);
    }
}
