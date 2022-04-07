package mna.homespital.dto;

public class Pharmacy {
    //소연 : 약국 dto 생성
    private Integer pharmacy_number;
    private String pharmacy_email;
    private String pharmacy_password;
    private String pharmacy_mobile;
    private String pharmacy_business;
    private String pharmacy_name;
    private String pharmacy_institution;
    private String pharmacy_phone;
    private String zip_code;
    private String street_address;
    private String detail_address;

    public Pharmacy() {
    }

    public Pharmacy(Integer pharmacy_number, String pharmacy_email, String pharmacy_password, String pharmacy_mobile, String pharmacy_business, String pharmacy_name, String pharmacy_institution, String pharmacy_phone, String zip_code, String street_address, String detail_address) {
        this.pharmacy_number = pharmacy_number;
        this.pharmacy_email = pharmacy_email;
        this.pharmacy_password = pharmacy_password;
        this.pharmacy_mobile = pharmacy_mobile;
        this.pharmacy_business = pharmacy_business;
        this.pharmacy_name = pharmacy_name;
        this.pharmacy_institution = pharmacy_institution;
        this.pharmacy_phone = pharmacy_phone;
        this.zip_code = zip_code;
        this.street_address = street_address;
        this.detail_address = detail_address;
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

    public String getPharmacy_mobile() {
        return pharmacy_mobile;
    }

    public void setPharmacy_mobile(String pharmacy_mobile) {
        this.pharmacy_mobile = pharmacy_mobile;
    }

    public String getPharmacy_business() {
        return pharmacy_business;
    }

    public void setPharmacy_business(String pharmacy_business) {
        this.pharmacy_business = pharmacy_business;
    }

    public String getPharmacy_name() {
        return pharmacy_name;
    }

    public void setPharmacy_name(String pharmacy_name) {
        this.pharmacy_name = pharmacy_name;
    }

    public String getPharmacy_institution() {
        return pharmacy_institution;
    }

    public void setPharmacy_institution(String pharmacy_institution) {
        this.pharmacy_institution = pharmacy_institution;
    }

    public String getPharmacy_phone() {
        return pharmacy_phone;
    }

    public void setPharmacy_phone(String pharmacy_phone) {
        this.pharmacy_phone = pharmacy_phone;
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

    @Override
    public String toString() {
        return "Pharmacy{" +
                "pharmacy_number=" + pharmacy_number +
                ", pharmacy_email='" + pharmacy_email + '\'' +
                ", pharmacy_password='" + pharmacy_password + '\'' +
                ", pharmacy_mobile='" + pharmacy_mobile + '\'' +
                ", pharmacy_business='" + pharmacy_business + '\'' +
                ", pharmacy_name='" + pharmacy_name + '\'' +
                ", pharmacy_institution='" + pharmacy_institution + '\'' +
                ", pharmacy_phone='" + pharmacy_phone + '\'' +
                ", zip_code='" + zip_code + '\'' +
                ", street_address='" + street_address + '\'' +
                ", detail_address='" + detail_address + '\'' +
                '}';
    }
}
