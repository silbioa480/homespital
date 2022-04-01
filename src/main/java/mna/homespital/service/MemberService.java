package mna.homespital.service;

import mna.homespital.dto.Doctor;
import mna.homespital.dto.Pharmacy;
import mna.homespital.dto.User;

public interface MemberService {

    boolean login(String user_email, String user_password) throws Exception;

    User join(User user) throws Exception;
    
    //소연 : 환자(User)정보 가져오기
    User getUserDetail(int user_number) throws Exception;

    //소연 : 의사(Doctor)정보 가져오기
    Doctor getDoctorDetail(int doctor_number) throws Exception;

    //소연 : 약사(Pharmacy)정보 가져오기
    Pharmacy getPharDetail(int pharmacy_number) throws Exception;


}
