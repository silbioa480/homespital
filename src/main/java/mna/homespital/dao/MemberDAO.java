package mna.homespital.dao;


import mna.homespital.dto.Doctor;
import mna.homespital.dto.Pharmacy;
import mna.homespital.dto.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Mapper
public interface MemberDAO {
    void insertMember(User user) throws Exception;


    public User queryMember(String user_email) throws Exception;

    //소연 : 환자(User)정보 가져오기
    User selectUserDetail(int user_number) throws Exception;

    //소연 : 의사(Doctor)정보 가져오기
    Doctor selectDoctorDetail(int doctor_number) throws Exception;

    //소연 : 약사(Pharmacy)정보 가져오기
    Pharmacy selectPharmacyDetail(int pharmacy_number) throws Exception;

//    //가영: 회원정보 수정
//    void updateMember(User user) throws Exception;
    
    //가영: 회원탈퇴
    public void deleteMember(String user_email)throws Exception;

    //가영: 비밀번호수정
    public String pwCheck(String user_email)throws Exception;

    public void pwUpdate(String user_email, String user_password)throws Exception;
}
