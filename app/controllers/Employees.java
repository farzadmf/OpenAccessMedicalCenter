package controllers;

import com.avaje.ebean.Ebean;
import com.avaje.ebean.Page;
import com.avaje.ebean.PagingList;
import helpers.Security.Authorized;
import models.current.Employee;
import models.current.EmployeeType.EmployeeTypes;
import play.mvc.Controller;
import play.mvc.Result;
import views.html.employeeEdit;
import views.html.employeeList;

public class Employees extends Controller {

    @Authorized(role = EmployeeTypes.Administrator)
    @Authorized(role = EmployeeTypes.Director)
    public static Result list(int pageNumber, int sortBy) {
        String sortColumn = null;

        if (sortBy != -1) {
            String[] sortColumns = {"Employee_ID", "Last_Name", "First_Name", "Hire_Date", "Years_Experience"};
            sortColumn = sortColumns[sortBy - 1];
        }

        Page<Employee> employeePage = Ebean.find(Employee.class)
                .orderBy(sortColumn)
                .findPagingList(10)
                .getPage(pageNumber);
        return ok(employeeList.render(employeePage));
    }

    public static Result edit(int id) {
        return ok(employeeEdit.render(id));
    }

    public static Result save() {
        return TODO;
    }
}
