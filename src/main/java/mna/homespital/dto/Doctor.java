package mna.homespital.dto;

//소연 : Doctor dto
public class Doctor {
    private int doctor_number;
    private String doctor_email;
    private String doctor_password;
    private String doctor_name;
    private String hospital_name;
    private String hospital_address;
    private String hospital_url;
    private String doctor_profile_image_name;
    private String doctor_diagnosis_type;
    private String doctor_introduction;
    private String doctor_education;
    private String doctor_thesis;
    private String working_time;
    private String lunch_time;
    private String holiday;

    public int getDoctor_number() {
        return doctor_number;
    }

    public void setDoctor_number(int doctor_number) {
        this.doctor_number = doctor_number;
    }

    public String getDoctor_email() {
        return doctor_email;
    }

    public void setDoctor_email(String doctor_email) {
        this.doctor_email = doctor_email;
    }

    public String getDoctor_password() {
        return doctor_password;
    }

    public void setDoctor_password(String doctor_password) {
        this.doctor_password = doctor_password;
    }

    public String getDoctor_name() {
        return doctor_name;
    }

    public void setDoctor_name(String doctor_name) {
        this.doctor_name = doctor_name;
    }

    public String getHospital_name() {
        return hospital_name;
    }

    public void setHospital_name(String hospital_name) {
        this.hospital_name = hospital_name;
    }

    public String getHospital_address() {
        return hospital_address;
    }

    public void setHospital_address(String hospital_address) {
        this.hospital_address = hospital_address;
    }

    public String getHospital_url() {
        return hospital_url;
    }

    public void setHospital_url(String hospital_url) {
        this.hospital_url = hospital_url;
    }

    public String getDoctor_profile_image_name() {
        return doctor_profile_image_name;
    }

    public void setDoctor_profile_image_name(String doctor_profile_image_name) {
        this.doctor_profile_image_name = doctor_profile_image_name;
    }

    public String getDoctor_diagnosis_type() {
        return doctor_diagnosis_type;
    }

    public void setDoctor_diagnosis_type(String doctor_diagnosis_type) {
        this.doctor_diagnosis_type = doctor_diagnosis_type;
    }

    public String getDoctor_introduction() {
        return doctor_introduction;
    }

    public void setDoctor_introduction(String doctor_introduction) {
        this.doctor_introduction = doctor_introduction;
    }

    public String getDoctor_education() {
        return doctor_education;
    }

    public void setDoctor_education(String doctor_education) {
        this.doctor_education = doctor_education;
    }

    public String getDoctor_thesis() {
        return doctor_thesis;
    }

    public void setDoctor_thesis(String doctor_thesis) {
        this.doctor_thesis = doctor_thesis;
    }

    public String getWorking_time() {
        return working_time;
    }

    public void setWorking_time(String working_time) {
        this.working_time = working_time;
    }

    public String getLunch_time() {
        return lunch_time;
    }

    public void setLunch_time(String lunch_time) {
        this.lunch_time = lunch_time;
    }

    public String getHoliday() {
        return holiday;
    }

    public void setHoliday(String holiday) {
        this.holiday = holiday;
    }

    public Doctor() {
    }

    public Doctor(int doctor_number, String doctor_email, String doctor_password, String doctor_name, String hospital_name, String hospital_address, String hospital_url, String doctor_profile_image_name, String doctor_diagnosis_type, String doctor_introduction, String doctor_education, String doctor_thesis, String working_time, String lunch_time, String holiday) {
        this.doctor_number = doctor_number;
        this.doctor_email = doctor_email;
        this.doctor_password = doctor_password;
        this.doctor_name = doctor_name;
        this.hospital_name = hospital_name;
        this.hospital_address = hospital_address;
        this.hospital_url = hospital_url;
        this.doctor_profile_image_name = doctor_profile_image_name;
        this.doctor_diagnosis_type = doctor_diagnosis_type;
        this.doctor_introduction = doctor_introduction;
        this.doctor_education = doctor_education;
        this.doctor_thesis = doctor_thesis;
        this.working_time = working_time;
        this.lunch_time = lunch_time;
        this.holiday = holiday;
    }
}
