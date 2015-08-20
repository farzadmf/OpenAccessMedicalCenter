package controllers;

import com.avaje.ebean.Ebean;
import helpers.Security.Authorized;
import models.current.Employee;
import models.current.EmployeeType.EmployeeTypes;
import models.current.Patient;
import models.current.PatientTreatment;
import models.current.Treatment;
import play.data.Form;
import play.mvc.Controller;
import play.mvc.Result;
import views.html.patientList;
import views.html.treatmentSchedule;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

public class Treatments extends Controller {
    private static List<Patient> patients = Ebean.find(Patient.class).findList();
    private static List<Employee> employees = Ebean.find(Employee.class).findList();
    private static List<Treatment> treatments = Ebean.find(Treatment.class).findList();

    @Authorized(role = EmployeeTypes.Administrator)
    public static Result create() {
        Form<Object> surgeryForm = Form.form(Object.class);
        surgeryForm.data().put("patientTreatmentId", "0");
        surgeryForm.data().put("patientId", "0");
        surgeryForm.data().put("employeeId", "0");
        surgeryForm.data().put("treatmentId", "0");
        return ok(treatmentSchedule.render(surgeryForm, patients, employees, treatments));
    }

    public static Result save() {
        Form<Object> surgeryForm = Form.form(Object.class).bindFromRequest();
        int patientTreatmentId = Integer.parseInt(surgeryForm.data().get("treatmentId"));
        int patientId = Integer.parseInt(surgeryForm.data().get("patient"));
        int employeeId = Integer.parseInt(surgeryForm.data().get("employee"));
        int treatmentId = Integer.parseInt(surgeryForm.data().get("treatment"));
        String date = surgeryForm.data().get("date");

        Patient patient = Ebean.find(Patient.class, patientId);
        Employee employee = Ebean.find(Employee.class, employeeId);
        Treatment treatment = Ebean.find(Treatment.class, treatmentId);

        PatientTreatment patientTreatment;

        if (patientTreatmentId == 0)
            patientTreatment = new PatientTreatment();
        else
            patientTreatment = Ebean.find(PatientTreatment.class, patientTreatmentId);

        patientTreatment.patient = patient;
        patientTreatment.employee = employee;
        patientTreatment.treatment = treatment;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        simpleDateFormat.setLenient(false);
        try {
            patientTreatment.date = (Date) simpleDateFormat.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        Ebean.save(patientTreatment);
        flash("success", "Saved Treatment with ID " + patientTreatment.patientTreatmentId);
        return redirect(routes.Patients.list(0, 1, "asc"));
    }

    @Authorized(role = EmployeeTypes.Administrator)
    public static Result edit(int id) {
        Form<Object> surgeryForm = Form.form(Object.class);
        PatientTreatment treatment = Ebean.find(PatientTreatment.class, id);
        surgeryForm.data().put("patientTreatmentId", treatment.patientTreatmentId.toString());
        surgeryForm.data().put("patientId", treatment.patient.patientId.toString());
        surgeryForm.data().put("employeeId", treatment.employee.employeeId.toString());
        surgeryForm.data().put("treatmentId", treatment.treatment.treatmentId.toString());
        surgeryForm.data().put("date", treatment.date.toString());
        return ok(treatmentSchedule.render(surgeryForm, patients, employees, treatments));
    }
}
