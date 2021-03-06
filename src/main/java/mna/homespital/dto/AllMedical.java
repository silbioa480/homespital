package mna.homespital.dto;

//모든 진료항목 dto 태영

public class AllMedical {
    int medical_code;
    String medical_name;
    String medical_image;

    public AllMedical(){}

    public AllMedical(int medical_code, String medical_name, String medical_image) {
        this.medical_code = medical_code;
        this.medical_name = medical_name;
        this.medical_image = medical_image;
    }

    public int getMedical_code() {
        return medical_code;
    }

    public void setMedical_code(int medical_code) {
        this.medical_code = medical_code;
    }

    public String getMedical_name() {
        return medical_name;
    }

    public void setMedical_name(String medical_name) {
        this.medical_name = medical_name;
    }

    public String getMedical_image() {
        return medical_image;
    }

    public void setMedical_image(String medical_image) {
        this.medical_image = medical_image;
    }
}
