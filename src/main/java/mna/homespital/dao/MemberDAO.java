package mna.homespital.dao;


import mna.homespital.dto.Doctor;
import mna.homespital.dto.Pharmacy;
import mna.homespital.dto.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface MemberDAO {


    //가영: 회원정보수정
    void updateMember(String user_email, String user_password, String user_name, String user_phone, String zip_code, String street_address, String detail_address) throws Exception;

    //용식:회원가입 환자(User)정보 insert
    void insertMember(User user) throws Exception;

    //용식: 로그인할떄 필요한 환자(User)정보 가져오기
    User queryMember(String user_email) throws Exception;

    //용식: 비밀번호변경
    void updatePassword(String user_email, String user_password) throws Exception;

    //소연 : 환자(User)정보 가져오기
    User selectUserDetail(int user_number) throws Exception;

    //소연 : 의사(Doctor)정보 가져오기
    Doctor selectDoctorDetail(int doctor_number) throws Exception;

    //소연 : 약사(Pharmacy)정보 가져오기
    Pharmacy selectPharmacyDetail(int pharmacy_number) throws Exception;

    //가영: 회원탈퇴
    void deleteMember(String user_email) throws Exception;

}