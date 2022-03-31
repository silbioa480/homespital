package mna.homespital.dto;

import java.util.Date;

public class User {
    private int user_number;
    private String user_email;
    private String user_password;
    private String user_name;
    private String user_registration_number;
    private String user_phone;
    private String user_address;
    private String billing_key;
    private Date create_date;
    private Date update_date;

    public User() {
    }

    public User(int user_number, String user_email, String user_password, String user_name, String user_registration_number, String user_phone, String user_address, String billing_key, Date create_date, Date update_date) {
        this.user_number = user_number;
        this.user_email = user_email;
        this.user_password = user_password;
        this.user_name = user_name;
        this.user_registration_number = user_registration_number;
        this.user_phone = user_phone;
        this.user_address = user_address;
        this.billing_key = billing_key;
        this.create_date = create_date;
        this.update_date = update_date;
    }

    public int getUser_number() {
        return user_number;
    }

    public void setUser_number(int user_number) {
        this.user_number = user_number;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public String getUser_password() {
        return user_password;
    }

    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_registration_number() {
        return user_registration_number;
    }

    public void setUser_registration_number(String user_registration_number) {
        this.user_registration_number = user_registration_number;
    }

    public String getUser_phone() {
        return user_phone;
    }

    public void setUser_phone(String user_phone) {
        this.user_phone = user_phone;
    }

    public String getUser_address() {
        return user_address;
    }

    public void setUser_address(String user_address) {
        this.user_address = user_address;
    }

    public String getBilling_key() {
        return billing_key;
    }

    public void setBilling_key(String billing_key) {
        this.billing_key = billing_key;
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

    @Override
    public String toString() {
        return "User{" +
                "user_number=" + user_number +
                ", user_email='" + user_email + '\'' +
                ", user_password='" + user_password + '\'' +
                ", user_name='" + user_name + '\'' +
                ", user_registration_number='" + user_registration_number + '\'' +
                ", user_phone='" + user_phone + '\'' +
                ", user_address='" + user_address + '\'' +
                ", billing_key='" + billing_key + '\'' +
                ", create_date=" + create_date +
                ", update_date=" + update_date +
                '}';
    }
}
