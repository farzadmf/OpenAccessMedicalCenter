package controllers;

import com.avaje.ebean.Ebean;
import helpers.Security.Authorized;
import models.current.*;
import models.current.EmployeeType.EmployeeTypes;
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
    private static List<Location> locations = Ebean.find(Location.class).findList();

    public static Result create() {
        Form<Object> surgeryForm = Form.form(Object.class);
        surgeryForm.data().put("patientTreatmentId", "0");
        surgeryForm.data().put("patientId", "0");
        surgeryForm.data().put("employeeId", "0");
        surgeryForm.data().put("treatmentId", "0");
        surgeryForm.data().put("locationId", "0");
        return ok(treatmentSchedule.render(surgeryForm, patients, employees, treatments, locations));
    }

    public static Result save() {
        Form<Object> surgeryForm = Form.form(Object.class).bindFromRequest();
        int patientTreatmentId = Integer.parseInt(surgeryForm.data().get("treatmentId"));
        int patientId = Integer.parseInt(surgeryForm.data().get("patient"));
        int employeeId = Integer.parseInt(surgeryForm.data().get("employee"));
        int treatmentId = Integer.parseInt(surgeryForm.data().get("treatment"));
        int locationId = Integer.parseInt(surgeryForm.data().get("location"));
//        String date = surgeryForm.data().get("date");

        Patient patient = Ebean.find(Patient.class, patientId);
        Employee employee = Ebean.find(Employee.class, employeeId);
        Treatment treatment = Ebean.find(Treatment.class, treatmentId);
        Location location = Ebean.find(Location.class, locationId);

        PatientTreatment patientTreatment;

        if (patientTreatmentId == 0)
            patientTreatment = new PatientTreatment();
        else
            patientTreatment = Ebean.find(PatientTreatment.class, patientTreatmentId);

        patientTreatment.patient = patient;
        patientTreatment.employee = employee;
        patientTreatment.treatment = treatment;
        patientTreatment.location = location;
//        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
//        simpleDateFormat.setLenient(false);
//        try {
//            Date newDate = new Date(simpleDateFormat.parse(date).getDate());
//            patientTreatment.date = newDate;
//        } catch (ParseException e) {
//            e.printStackTrace();
//        }

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
        surgeryForm.data().put("locationId", treatment.location.locationId.toString());
//        surgeryForm.data().put("date", treatment.date.toString());
        return ok(treatmentSchedule.render(surgeryForm, patients, employees, treatments, locations));
    }
}
