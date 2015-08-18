package helpers;

public class Config {
    public static final String PAGE_BEFORE_LOGIN = "pageBeforeLogin";
    public static final String LAST_VISITED_URL = "lastVisitedUrl";

    public enum SalaryType {
        PER_HOUR,
        YEARLY
    }

    /**
     * Roles available in the application
     */
    public enum Roles {
        ADMINISTRATOR,
        DOCTOR,
        INTERN,
        SHIFT_SUPERVISOR,
        NURSE;
    }
}
