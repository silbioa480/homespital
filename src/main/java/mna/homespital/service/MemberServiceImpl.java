package mna.homespital.service;

import lombok.RequiredArgsConstructor;
import mna.homespital.dao.MemberDAO;
import mna.homespital.dto.Doctor;
import mna.homespital.dto.Pharmacy;
import mna.homespital.dto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {
    @Autowired
    MemberDAO memberDAO;

    //가영: 로그인
    @Override
    public boolean login(String user_email, String user_password) throws Exception {
        try {
            User mem = memberDAO.queryMember(user_email);
            if (mem == null) throw new Exception();
            if (user_password.equals(mem.getUser_password())) {
                return true;
            } else {
                throw new Exception();
            }
        } catch (Exception e) {
            throw new Exception("로그인 오류");
        }
    }

    @Override
    public User join(User user) throws Exception {
        User mem = memberDAO.queryMember(user.getUser_email());
        if (mem != null) throw new Exception("이미 있는 이메일입니다.");
        memberDAO.insertMember(user);
        return memberDAO.queryMember(user.getUser_email());
    }

    //소연 : 환자(User)정보 가져오기
    @Override
    public User getUserDetail(int user_number) throws Exception {
        User user = memberDAO.selectUserDetail(user_number);
        user.setUser_password("");
        return user;
    }


    //소연 : 의사(Doctor)정보 가져오기
    @Override
    public Doctor getDoctorDetail(int doctor_number) throws Exception {
        Doctor doctor = memberDAO.selectDoctorDetail(doctor_number);
        doctor.setDoctor_password("");
        return doctor;
    }

    //소연 : 약사(Pharmacy)정보 가져오기
    @Override
    public Pharmacy getPharDetail(int pharmacy_number) throws Exception {
        Pharmacy pharmacy = memberDAO.selectPharmacyDetail(pharmacy_number);
        pharmacy.setPharmacy_password("");
        return pharmacy;
    }
//  이메일로 유저 정보 가져옴 ( 인성 )
    @Override
    public User findByEmail(String email) throws Exception {
        return memberDAO.queryMember(email);
    }

}
