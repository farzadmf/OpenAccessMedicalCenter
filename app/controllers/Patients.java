package controllers;

import com.avaje.ebean.Ebean;
import com.avaje.ebean.Page;
import helpers.Security.Authorized;
import models.current.EmployeeType.EmployeeTypes;
import models.current.Patient;
import models.current.PatientTreatment;
import play.mvc.Controller;
import play.mvc.Result;
import views.html.patientHistory;
import views.html.patientList;

import java.util.List;

public class Patients extends Controller {

    @Authorized(role = EmployeeTypes.Administrator)
    @Authorized(role = EmployeeTypes.Director)
    public static Result history(int patientId) {
        Patient patient = Ebean.find(Patient.class, patientId);
        List<PatientTreatment> treatments = patient.treatments;
        return ok(patientHistory.render(patient, treatments));
    }

    @Authorized(role = EmployeeTypes.Administrator)
    @Authorized(role = EmployeeTypes.Director)
    public static Result list(int page, int sortBy, String order) {
        String[] sortColumns = {"Patient_ID", "Last_Name", "First_Name", "Phone_Number", "Address", "Medicare_Number"};
        String sortColumn = sortColumns[sortBy - 1];

        Page<Patient> patientPage = Ebean.find(Patient.class)
                .orderBy(sortColumn + " " + order)
                .findPagingList(10)
                .getPage(page);

        return ok(patientList.render(patientPage, sortBy, order));
    }
}
