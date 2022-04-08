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
    public ArrayList<HashMap<String, Object>> pharCustomerRecordsList(int phar_number) throws Exception {
        return pharmacyDAO.pharCustomerRecordsList(phar_number);
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
        System.out.println(pharmacy);
        Pharmacy phar = pharmacyDAO.PharmacyQueryMember(pharmacy.getPharmacy_email());
        if (phar != null) throw new Exception("이미 있는 이메일입니다.");
        pharmacyDAO.insertPharmacyMember(pharmacy);
        return pharmacy;
    }
}
