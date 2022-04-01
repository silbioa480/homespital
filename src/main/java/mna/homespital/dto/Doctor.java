package mna.homespital.dto;

import java.util.Date;

public class Doctor {
    /* doctor_number */
    private Integer doctorNumber;

    /* doctor_email */
    private String doctorEmail;

    /* doctor_password */
    private String doctorPassword;

    /* hospital_name */
    private String hospitalName;

    /* hospital_address */
    private String hospitalAddress;

    /* hospital_url */
    private String hospitalUrl;

    /* doctor_name */
    private String doctorName;

    /* doctor_profile_image_name */
    private String doctorProfileImageName;

    /* doctor_diagnosis_type */
    private String doctorDiagnosisType;

    /* doctor_introduction */
    private String doctorIntroduction;

    /* doctor_education */
    private String doctorEducation;

    /* doctor_thesis */
    private String doctorThesis;

    /* working_time */
    private String workingTime;

    /* lunch_time */
    private String lunchTime;

    /* holiday */
    private String holiday;

    /* create_date */
    private Date createDate;

    /* update_date */
    private Date updateDate;

    public Doctor() {
    }

    public Doctor(String doctorEmail, String doctorPassword, String hospitalName, String hospitalAddress, String hospitalUrl, String doctorName, String doctorProfileImageName, String doctorDiagnosisType, String doctorIntroduction, String doctorEducation, String doctorThesis, String workingTime, String lunchTime, String holiday, Date createDate, Date updateDate) {
        this.doctorEmail = doctorEmail;
        this.doctorPassword = doctorPassword;
        this.hospitalName = hospitalName;
        this.hospitalAddress = hospitalAddress;
        this.hospitalUrl = hospitalUrl;
        this.doctorName = doctorName;
        this.doctorProfileImageName = doctorProfileImageName;
        this.doctorDiagnosisType = doctorDiagnosisType;
        this.doctorIntroduction = doctorIntroduction;
        this.doctorEducation = doctorEducation;
        this.doctorThesis = doctorThesis;
        this.workingTime = workingTime;
        this.lunchTime = lunchTime;
        this.holiday = holiday;
        this.createDate = createDate;
        this.updateDate = updateDate;
    }

    public Doctor(Integer doctorNumber, String doctorEmail, String doctorPassword, String hospitalName, String hospitalAddress, String hospitalUrl, String doctorName, String doctorProfileImageName, String doctorDiagnosisType, String doctorIntroduction, String doctorEducation, String doctorThesis, String workingTime, String lunchTime, String holiday, Date createDate, Date updateDate) {
        this.doctorNumber = doctorNumber;
        this.doctorEmail = doctorEmail;
        this.doctorPassword = doctorPassword;
        this.hospitalName = hospitalName;
        this.hospitalAddress = hospitalAddress;
        this.hospitalUrl = hospitalUrl;
        this.doctorName = doctorName;
        this.doctorProfileImageName = doctorProfileImageName;
        this.doctorDiagnosisType = doctorDiagnosisType;
        this.doctorIntroduction = doctorIntroduction;
        this.doctorEducation = doctorEducation;
        this.doctorThesis = doctorThesis;
        this.workingTime = workingTime;
        this.lunchTime = lunchTime;
        this.holiday = holiday;
        this.createDate = createDate;
        this.updateDate = updateDate;
    }

    public Integer getDoctorNumber() {
        return doctorNumber;
    }

    public void setDoctorNumber(Integer doctorNumber) {
        this.doctorNumber = doctorNumber;
    }

    public String getDoctorEmail() {
        return doctorEmail;
    }

    public void setDoctorEmail(String doctorEmail) {
        this.doctorEmail = doctorEmail;
    }

    public String getDoctorPassword() {
        return doctorPassword;
    }

    public void setDoctorPassword(String doctorPassword) {
        this.doctorPassword = doctorPassword;
    }

    public String getHospitalName() {
        return hospitalName;
    }

    public void setHospitalName(String hospitalName) {
        this.hospitalName = hospitalName;
    }

    public String getHospitalAddress() {
        return hospitalAddress;
    }

    public void setHospitalAddress(String hospitalAddress) {
        this.hospitalAddress = hospitalAddress;
    }

    public String getHospitalUrl() {
        return hospitalUrl;
    }

    public void setHospitalUrl(String hospitalUrl) {
        this.hospitalUrl = hospitalUrl;
    }

    public String getDoctorName() {
        return doctorName;
    }

    public void setDoctorName(String doctorName) {
        this.doctorName = doctorName;
    }

    public String getDoctorProfileImageName() {
        return doctorProfileImageName;
    }

    public void setDoctorProfileImageName(String doctorProfileImageName) {
        this.doctorProfileImageName = doctorProfileImageName;
    }

    public String getDoctorDiagnosisType() {
        return doctorDiagnosisType;
    }

    public void setDoctorDiagnosisType(String doctorDiagnosisType) {
        this.doctorDiagnosisType = doctorDiagnosisType;
    }

    public String getDoctorIntroduction() {
        return doctorIntroduction;
    }

    public void setDoctorIntroduction(String doctorIntroduction) {
        this.doctorIntroduction = doctorIntroduction;
    }

    public String getDoctorEducation() {
        return doctorEducation;
    }

    public void setDoctorEducation(String doctorEducation) {
        this.doctorEducation = doctorEducation;
    }

    public String getDoctorThesis() {
        return doctorThesis;
    }

    public void setDoctorThesis(String doctorThesis) {
        this.doctorThesis = doctorThesis;
    }

    public String getWorkingTime() {
        return workingTime;
    }

    public void setWorkingTime(String workingTime) {
        this.workingTime = workingTime;
    }

    public String getLunchTime() {
        return lunchTime;
    }

    public void setLunchTime(String lunchTime) {
        this.lunchTime = lunchTime;
    }

    public String getHoliday() {
        return holiday;
    }

    public void setHoliday(String holiday) {
        this.holiday = holiday;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }
}
