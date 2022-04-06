package mna.homespital.service;

import lombok.RequiredArgsConstructor;
import mna.homespital.dao.MemberDAO;
import mna.homespital.dto.Doctor;
import mna.homespital.dto.Pharmacy;
import mna.homespital.dto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.internet.MimeMessage;
import java.util.Random;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {
    @Autowired
    MemberDAO memberDAO;

    @Autowired
    private JavaMailSender mailSender;

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

    //용식: 회원가입
    @Override
    public User join(User user) throws Exception {
        User mem = memberDAO.queryMember(user.getUser_email());
        if (mem != null) throw new Exception("이미 있는 이메일입니다.");
        memberDAO.insertMember(user);
        return memberDAO.queryMember(user.getUser_email());
    }

    //용식:비밀번호 수정
    @Override
    public void modifyPassword(String user_email, String user_password) throws Exception {
        memberDAO.updatePassword(user_email, user_password);
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

    //가영: 회원탈퇴
    @Override
    public void deleteMember(String user_email) throws Exception {
        memberDAO.deleteMember(user_email);
    }

    //가영: 회원정보수정
    @Override
    public void modifyMember(String user_email, String user_password, String user_name, String user_registration_number, String user_phone, String user_address) throws Exception {

        memberDAO.updateMember(user_email, user_password, user_name, user_registration_number, user_phone, user_address);
    }


    //용식: 유저정보 가져오기
    @Override
    public User queryMember(String email) throws Exception {
        return memberDAO.queryMember(email);
    }

    //용식:비밀번호찾기: 이메일보내기 
    //return값: 인증번호
    @Override
    public String sendMailForFindPw(String email) throws Exception {
        Random random = new Random();
        int checkNum = random.nextInt(999999);
        String setFrom = "dlsdydtlr@gmail.com";
        String toMail = email;
        String title = ("인증이메일입니다.");
        String content = "<h1>인증번호는" + checkNum + "입니다</h1>";

        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, "utf-8");
        helper.setFrom(setFrom);
        helper.setTo(toMail);
        helper.setSubject(title);
        helper.setText(content, true);
        mailSender.send(message);
        System.out.println("메일보내기성공");

        String num = Integer.toString(checkNum);
        return num;
    }


}
