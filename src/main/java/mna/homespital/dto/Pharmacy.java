package mna.homespital.dto;

public class Pharmacy {
    //소연 : 약국 dto 생성
    private Integer pharmacy_number;
    private String pharmacy_email;
    private String pharmacy_password;
    private String pharmacy_name;
    private String zip_code;
    private String street_address;
    private String detail_address;
    private String pharmacy_phone;

    public Pharmacy() {
    }

    public Integer getPharmacy_number() {
        return pharmacy_number;
    }

    public void setPharmacy_number(Integer pharmacy_number) {
        this.pharmacy_number = pharmacy_number;
    }

    public String getPharmacy_email() {
        return pharmacy_email;
    }

    public void setPharmacy_email(String pharmacy_email) {
        this.pharmacy_email = pharmacy_email;
    }

    public String getPharmacy_password() {
        return pharmacy_password;
    }

    public void setPharmacy_password(String pharmacy_password) {
        this.pharmacy_password = pharmacy_password;
    }

    public String getPharmacy_name() {
        return pharmacy_name;
    }

    public void setPharmacy_name(String pharmacy_name) {
        this.pharmacy_name = pharmacy_name;
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

    public String getPharmacy_phone() {
        return pharmacy_phone;
    }

    public void setPharmacy_phone(String pharmacy_phone) {
        this.pharmacy_phone = pharmacy_phone;
    }


    public Pharmacy(Integer pharmacy_number, String pharmacy_email, String pharmacy_password, String pharmacy_name, String zip_code, String street_address, String detail_address, String pharmacy_phone) {
        this.pharmacy_number = pharmacy_number;
        this.pharmacy_email = pharmacy_email;
        this.pharmacy_password = pharmacy_password;
        this.pharmacy_name = pharmacy_name;
        this.zip_code = zip_code;
        this.street_address = street_address;
        this.detail_address = detail_address;
        this.pharmacy_phone = pharmacy_phone;
    }
}
