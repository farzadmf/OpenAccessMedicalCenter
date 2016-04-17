package controllers;

import com.avaje.ebean.Ebean;
import com.avaje.ebean.Page;
import helpers.Security.Authorized;
import models.current.Employee;
import models.current.EmployeeType;
import models.current.EmployeeType.EmployeeTypes;
import play.data.Form;
import play.mvc.Controller;
import play.mvc.Result;
import views.html.employeeEdit;
import views.html.employeeList;

import java.util.List;

public class Employees extends Controller {

    @Authorized(role = EmployeeTypes.Administrator)
    @Authorized(role = EmployeeTypes.Director)
    public static Result list(int pageNumber, int sortBy, String order) {
        String[] sortColumns = {"Employee_ID", "Last_Name", "First_Name", "Hire_Date", "Years_Experience", "employee_type_id"};
        String sortColumn = sortColumns[sortBy - 1];

        Page<Employee> employeePage = Ebean.find(Employee.class)
                .fetch("employeeType")
                .orderBy(sortColumn + " " + order)
                .findPagingList(10)
                .getPage(pageNumber);
        return ok(employeeList.render(employeePage, sortBy, order));
    }

    @Authorized(role = EmployeeTypes.Administrator)
    @Authorized(role = EmployeeTypes.Director)
    public static Result edit(int employeeId) {
        Employee employee = Ebean.find(Employee.class, employeeId);
        Form<Employee> employeeForm = Form.form(Employee.class).fill(employee);

        List<EmployeeType> allEmployeeTypes = Ebean.find(EmployeeType.class).findList();
        return ok(employeeEdit.render(employeeForm, allEmployeeTypes));
    }

    public static Result save() {
        Form<Employee> employeeForm = Form.form(Employee.class).bindFromRequest();
        EmployeeType newEmployeeType = Ebean.find(EmployeeType.class, employeeForm.data().get("EmployeeType"));

        Employee originalEmployee = Ebean.find(Employee.class, employeeForm.data().get("employeeId"));
        originalEmployee.firstName = employeeForm.data().get("FirstName");
        originalEmployee.lastName = employeeForm.data().get("LastName");
        originalEmployee.yearsExperience = Integer.parseInt(employeeForm.data().get("YearsExperience"));
        originalEmployee.employeeType = newEmployeeType;
        Ebean.save(originalEmployee);

        flash("success", "Employee with ID: " + originalEmployee.employeeId + " was updated successfully!");
        return list(0, 1, "asc");
    }
}
