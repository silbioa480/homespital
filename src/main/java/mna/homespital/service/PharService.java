package mna.homespital.service;

import mna.homespital.dto.Pharmacy;

import java.util.ArrayList;
import java.util.HashMap;


public interface PharService {
    //    인성: 약사 이메일로 number 찾기
    int getNumberByEmail(String phar_email) throws Exception;

    //나의 진료내역 리스트 출력 (준근)
    ArrayList<HashMap<String, Object>> pharMedicalRecords(int pharmacy_number) throws Exception;

    //소연 : 약사(Pharmacy)정보 가져오기
    Pharmacy getPharInfo(int pharmacy_number) throws Exception;

    //용식 : 약사 회원가입
    Pharmacy join(Pharmacy pharmacy) throws Exception;

    // 용식 : 약사 로그인
    boolean pharmacyLogin(String email, String password) throws Exception;

    //용식 :약사 회원가입 이메일 중복체크
    boolean emailCheck(String email) throws Exception;

    Pharmacy getPharInfo(String pharmacy_email) throws Exception;

    //  처방접수 및 조제시작(diagnosis_status 3 -> 4) 준근
    void makeMedicine(int diagnosis_number, int prescription_money) throws Exception;

    //  조제 완료(diagnosis_status 4 -> 5) 준근
    void successMadeMedicine(int diagnosis_number) throws Exception;

    // 훈 - 유저 예약 폼에서 약국번호 잡아주기
    Integer getPharmacyNumberByName(String pharmacy_name, String pharmacy_address, String pharmacy_phone) throws Exception;
}
