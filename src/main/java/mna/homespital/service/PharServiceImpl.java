package mna.homespital.service;

import mna.homespital.dao.PharmacyDAO;
import mna.homespital.dto.Pharmacy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;

@Service
public class PharServiceImpl implements PharService {
    @Autowired
    PharmacyDAO pharmacyDAO;

    //    인성: 약사 이메일로 number 찾기
    @Override
    public int getNumberByEmail(String phar_email) throws Exception {
        return pharmacyDAO.getNumberByEmail(phar_email);
    }

    //환자 진료내역 출력 (인성)
    @Override
    public ArrayList<HashMap<String, Object>> pharMedicalRecords(int pharmacy_number) throws Exception {
        return pharmacyDAO.pharMedicalRecords(pharmacy_number);
    }

    //소연 : 약사(Pharmacy)정보 가져오기
    @Override
    public Pharmacy getPharInfo(int pharmacy_number) throws Exception {
        System.out.println("getPharInfo() join");
        return pharmacyDAO.PharInfo(pharmacy_number);
    }

    //용식: 약사 회원가입
    @Override
    public Pharmacy join(Pharmacy pharmacy) throws Exception {
        Pharmacy phar = pharmacyDAO.PharmacyQueryMember(pharmacy.getPharmacy_email());
        if (phar != null) throw new Exception("이미 있는 이메일입니다.");
        pharmacyDAO.insertPharmacyMember(pharmacy);
        return pharmacy;
    }

    //용식 : 약사 로그인
    @Override
    public boolean pharmacyLogin(String email, String password) throws Exception {
        Pharmacy pharmacy = pharmacyDAO.PharmacyQueryMember(email);
        if (pharmacy == null) throw new Exception("없는 이메일입니다.");
        if (password.equals(pharmacy.getPharmacy_password())) {
            return true;
        } else {
            throw new Exception("비밀번호가 틀립니다.");
        }
    }

    //용식: 약사 회원가입 이메일 중복체크
    @Override
    public boolean emailCheck(String email) throws Exception {
        Pharmacy pharmacy = pharmacyDAO.PharmacyQueryMember(email);
        if (pharmacy == null) return false;
        return true;
    }

    @Override
    public Pharmacy getPharInfo(String pharmacy_email) throws Exception {
        return pharmacyDAO.PharmacyQueryMember(pharmacy_email);
    }

    //  처방접수 및 조제시작(diagnosis_status 3 -> 4) 준근
    @Override
    public void makeMedicine(int diagnosis_number) throws Exception {
        pharmacyDAO.makeMedicine(diagnosis_number);
    }

    //  조제 완료(diagnosis_status 4 -> 5) 준근
    @Override
    public void successMadeMedicine(int diagnosis_number) throws Exception {
        pharmacyDAO.successMadeMedicine(diagnosis_number);
    }

    //용식:이메일중복체크
//    @Override
//    public boolean emailCheck(String email) throws Exception {
//        User user = memberDAO.queryMember(email);
//        if (user == null) return false;
//        return true;
//    }
}
