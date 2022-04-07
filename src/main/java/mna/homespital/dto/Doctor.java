package mna.homespital.dto;

import java.util.Date;

//소연 : Doctor dto
public class Doctor {
    private int doctor_number;
    private String doctor_email;
    private String doctor_password;
    private String doctor_phone;
    private String doctor_name;
    private String doctor_valid_number;
    private String doctor_profile_image_name;
    private String hospital_name;
    private String hospital_telephone;
    private String hospital_business_number;
    private String doctor_introduction;
    private String hospital_file_name;
    private String doctor_diagnosis_type;
    private String working_time;
    private String lunch_time;
    private String holiday;
    private String zip_code;
    private String street_address;
    private String detail_address;
    private String hospital_fax;
    private String hospital_url;
    private Date create_date;
    private Date update_date;

    public Doctor() {
    }

    public Doctor(int doctor_number, String doctor_email, String doctor_password, String doctor_phone, String doctor_name, String doctor_valid_number, String doctor_profile_image_name, String hospital_name, String hospital_telephone, String hospital_business_number, String doctor_introduction, String hospital_file_name, String doctor_diagnosis_type, String working_time, String lunch_time, String holiday, String zip_code, String street_address, String detail_address, String hospital_fax, String hospital_url, Date create_date, Date update_date) {
        this.doctor_number = doctor_number;
        this.doctor_email = doctor_email;
        this.doctor_password = doctor_password;
        this.doctor_phone = doctor_phone;
        this.doctor_name = doctor_name;
        this.doctor_valid_number = doctor_valid_number;
        this.doctor_profile_image_name = doctor_profile_image_name;
        this.hospital_name = hospital_name;
        this.hospital_telephone = hospital_telephone;
        this.hospital_business_number = hospital_business_number;
        this.doctor_introduction = doctor_introduction;
        this.hospital_file_name = hospital_file_name;
        this.doctor_diagnosis_type = doctor_diagnosis_type;
        this.working_time = working_time;
        this.lunch_time = lunch_time;
        this.holiday = holiday;
        this.zip_code = zip_code;
        this.street_address = street_address;
        this.detail_address = detail_address;
        this.hospital_fax = hospital_fax;
        this.hospital_url = hospital_url;
        this.create_date = create_date;
        this.update_date = update_date;
    }

    public Doctor(int doctor_number, String doctor_email, String doctor_password, String doctor_phone, String doctor_name, String doctor_valid_number, String doctor_profile_image_name, String hospital_name, String hospital_telephone, String hospital_business_number, String doctor_introduction, String hospital_file_name, String doctor_diagnosis_type, String working_time, String lunch_time, String holiday, String zip_code, String street_address, String detail_address, String hospital_fax, String hospital_url) {
        this.doctor_number = doctor_number;
        this.doctor_email = doctor_email;
        this.doctor_password = doctor_password;
        this.doctor_phone = doctor_phone;
        this.doctor_name = doctor_name;
        this.doctor_valid_number = doctor_valid_number;
        this.doctor_profile_image_name = doctor_profile_image_name;
        this.hospital_name = hospital_name;
        this.hospital_telephone = hospital_telephone;
        this.hospital_business_number = hospital_business_number;
        this.doctor_introduction = doctor_introduction;
        this.hospital_file_name = hospital_file_name;
        this.doctor_diagnosis_type = doctor_diagnosis_type;
        this.working_time = working_time;
        this.lunch_time = lunch_time;
        this.holiday = holiday;
        this.zip_code = zip_code;
        this.street_address = street_address;
        this.detail_address = detail_address;
        this.hospital_fax = hospital_fax;
        this.hospital_url = hospital_url;
    }

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

    public String getDoctor_phone() {
        return doctor_phone;
    }

    public void setDoctor_phone(String doctor_phone) {
        this.doctor_phone = doctor_phone;
    }

    public String getDoctor_name() {
        return doctor_name;
    }

    public void setDoctor_name(String doctor_name) {
        this.doctor_name = doctor_name;
    }

    public String getDoctor_valid_number() {
        return doctor_valid_number;
    }

    public void setDoctor_valid_number(String doctor_valid_number) {
        this.doctor_valid_number = doctor_valid_number;
    }

    public String getDoctor_profile_image_name() {
        return doctor_profile_image_name;
    }

    public void setDoctor_profile_image_name(String doctor_profile_image_name) {
        this.doctor_profile_image_name = doctor_profile_image_name;
    }

    public String getHospital_name() {
        return hospital_name;
    }

    public void setHospital_name(String hospital_name) {
        this.hospital_name = hospital_name;
    }

    public String getHospital_telephone() {
        return hospital_telephone;
    }

    public void setHospital_telephone(String hospital_telephone) {
        this.hospital_telephone = hospital_telephone;
    }

    public String getHospital_business_number() {
        return hospital_business_number;
    }

    public void setHospital_business_number(String hospital_business_number) {
        this.hospital_business_number = hospital_business_number;
    }

    public String getDoctor_introduction() {
        return doctor_introduction;
    }

    public void setDoctor_introduction(String doctor_introduction) {
        this.doctor_introduction = doctor_introduction;
    }

    public String getHospital_file_name() {
        return hospital_file_name;
    }

    public void setHospital_file_name(String hospital_file_name) {
        this.hospital_file_name = hospital_file_name;
    }

    public String getDoctor_diagnosis_type() {
        return doctor_diagnosis_type;
    }

    public void setDoctor_diagnosis_type(String doctor_diagnosis_type) {
        this.doctor_diagnosis_type = doctor_diagnosis_type;
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

    public String getZip_code() {
        return zip_code;
    }

    public void setZip_code(String zip_code) {
        this.zip_code = zip_code;
    }

    public String getStreet_address() {
        return street_address;
    }

    public void setStreet_address(String street_address) {
        this.street_address = street_address;
    }

    public String getDetail_address() {
        return detail_address;
    }

    public void setDetail_address(String detail_address) {
        this.detail_address = detail_address;
    }

    public String getHospital_fax() {
        return hospital_fax;
    }

    public void setHospital_fax(String hospital_fax) {
        this.hospital_fax = hospital_fax;
    }

    public String getHospital_url() {
        return hospital_url;
    }

    public void setHospital_url(String hospital_url) {
        this.hospital_url = hospital_url;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    public Date getUpdate_date() {
        return update_date;
    }

    public void setUpdate_date(Date update_date) {
        this.update_date = update_date;
    }
}
