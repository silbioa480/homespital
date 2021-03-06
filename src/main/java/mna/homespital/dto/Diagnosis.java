package mna.homespital.dto;

import java.util.Date;

public class Diagnosis {
    private int diagnosis_number;
    private int user_number;
    private int doctor_number;
    private int pharmacy_number;
    private String diagnosis_type;
    private int diagnosis_time;
    private int diagnosis_wait_number;
    private String diagnosis_content;
    private String diagnosis_image_name;
    private int diagnosis_status;
    private int is_diagnosis_upload;
    private int is_prescription_upload;
    private String diagnosis_file_name;
    private String prescription_file_name;
    private int diagnosis_money;
    private int prescription_money;
    private int is_delivery;
    private String billing_key;
    private String doctor_opinion;

    private String pharmacy_name; //4/8추가 by 소연
    private String pharmacy_address; //4/8추가 by 소연
    private String pharmacy_phone; //4/8추가 by 소연
    private String user_address; //4/7추가. appointmentForm에 is delievry==1 (배송)의 경우 주소 API이용하여 받는 사람 주소를 넣는데, 그때 DB에 저장하는 주소

    private Date create_date;
    private Date update_date;

    public Diagnosis() {
    }

    public Diagnosis(int diagnosis_number, int user_number, int doctor_number, int pharmacy_number, String diagnosis_type, int diagnosis_time, int diagnosis_wait_number, String diagnosis_content, String diagnosis_image_name, int diagnosis_status, int is_diagnosis_upload, int is_prescription_upload, String diagnosis_file_name, String prescription_file_name, int diagnosis_money, int prescription_money, int is_delivery, String billing_key, String doctor_opinion, String pharmacy_name, String pharmacy_address, String pharmacy_phone, String user_address, Date create_date, Date update_date) {
        this.diagnosis_number = diagnosis_number;
        this.user_number = user_number;
        this.doctor_number = doctor_number;
        this.pharmacy_number = pharmacy_number;
        this.diagnosis_type = diagnosis_type;
        this.diagnosis_time = diagnosis_time;
        this.diagnosis_wait_number = diagnosis_wait_number;
        this.diagnosis_content = diagnosis_content;
        this.diagnosis_image_name = diagnosis_image_name;
        this.diagnosis_status = diagnosis_status;
        this.is_diagnosis_upload = is_diagnosis_upload;
        this.is_prescription_upload = is_prescription_upload;
        this.diagnosis_file_name = diagnosis_file_name;
        this.prescription_file_name = prescription_file_name;
        this.diagnosis_money = diagnosis_money;
        this.prescription_money = prescription_money;
        this.is_delivery = is_delivery;
        this.billing_key = billing_key;
        this.doctor_opinion = doctor_opinion;
        this.pharmacy_name = pharmacy_name;
        this.pharmacy_address = pharmacy_address;
        this.pharmacy_phone = pharmacy_phone;
        this.user_address = user_address;
        this.create_date = create_date;
        this.update_date = update_date;
    }

    public int getDiagnosis_number() {
        return diagnosis_number;
    }

    public void setDiagnosis_number(int diagnosis_number) {
        this.diagnosis_number = diagnosis_number;
    }

    public int getUser_number() {
        return user_number;
    }

    public void setUser_number(int user_number) {
        this.user_number = user_number;
    }

    public int getDoctor_number() {
        return doctor_number;
    }

    public void setDoctor_number(int doctor_number) {
        this.doctor_number = doctor_number;
    }

    public int getPharmacy_number() {
        return pharmacy_number;
    }

    public void setPharmacy_number(int pharmacy_number) {
        this.pharmacy_number = pharmacy_number;
    }

    public String getDiagnosis_type() {
        return diagnosis_type;
    }

    public void setDiagnosis_type(String diagnosis_type) {
        this.diagnosis_type = diagnosis_type;
    }

    public int getDiagnosis_time() {
        return diagnosis_time;
    }

    public void setDiagnosis_time(int diagnosis_time) {
        this.diagnosis_time = diagnosis_time;
    }

    public int getDiagnosis_wait_number() {
        return diagnosis_wait_number;
    }

    public void setDiagnosis_wait_number(int diagnosis_wait_number) {
        this.diagnosis_wait_number = diagnosis_wait_number;
    }

    public String getDiagnosis_content() {
        return diagnosis_content;
    }

    public void setDiagnosis_content(String diagnosis_content) {
        this.diagnosis_content = diagnosis_content;
    }

    public String getDiagnosis_image_name() {
        return diagnosis_image_name;
    }

    public void setDiagnosis_image_name(String diagnosis_image_name) {
        this.diagnosis_image_name = diagnosis_image_name;
    }

    public int getDiagnosis_status() {
        return diagnosis_status;
    }

    public void setDiagnosis_status(int diagnosis_status) {
        this.diagnosis_status = diagnosis_status;
    }

    public int getIs_diagnosis_upload() {
        return is_diagnosis_upload;
    }

    public void setIs_diagnosis_upload(int is_diagnosis_upload) {
        this.is_diagnosis_upload = is_diagnosis_upload;
    }

    public int getIs_prescription_upload() {
        return is_prescription_upload;
    }

    public void setIs_prescription_upload(int is_prescription_upload) {
        this.is_prescription_upload = is_prescription_upload;
    }

    public String getDiagnosis_file_name() {
        return diagnosis_file_name;
    }

    public void setDiagnosis_file_name(String diagnosis_file_name) {
        this.diagnosis_file_name = diagnosis_file_name;
    }

    public String getPrescription_file_name() {
        return prescription_file_name;
    }

    public void setPrescription_file_name(String prescription_file_name) {
        this.prescription_file_name = prescription_file_name;
    }

    public int getDiagnosis_money() {
        return diagnosis_money;
    }

    public void setDiagnosis_money(int diagnosis_money) {
        this.diagnosis_money = diagnosis_money;
    }

    public int getPrescription_money() {
        return prescription_money;
    }

    public void setPrescription_money(int prescription_money) {
        this.prescription_money = prescription_money;
    }

    public int getIs_delivery() {
        return is_delivery;
    }

    public void setIs_delivery(int is_delivery) {
        this.is_delivery = is_delivery;
    }

    public String getBilling_key() {
        return billing_key;
    }

    public void setBilling_key(String billing_key) {
        this.billing_key = billing_key;
    }

    public String getDoctor_opinion() {
        return doctor_opinion;
    }

    public void setDoctor_opinion(String doctor_opinion) {
        this.doctor_opinion = doctor_opinion;
    }

    public String getPharmacy_name() {
        return pharmacy_name;
    }

    public void setPharmacy_name(String pharmacy_name) {
        this.pharmacy_name = pharmacy_name;
    }

    public String getPharmacy_address() {
        return pharmacy_address;
    }

    public void setPharmacy_address(String pharmacy_address) {
        this.pharmacy_address = pharmacy_address;
    }

    public String getPharmacy_phone() {
        return pharmacy_phone;
    }

    public void setPharmacy_phone(String pharmacy_phone) {
        this.pharmacy_phone = pharmacy_phone;
    }

    public String getUser_address() {
        return user_address;
    }

    public void setUser_address(String user_address) {
        this.user_address = user_address;
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