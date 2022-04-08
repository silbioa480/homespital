package mna.homespital.service;

import mna.homespital.dto.Pharmacy;

import java.util.ArrayList;
import java.util.HashMap;


public interface PharService {
//    인성: 약사 이메일로 number 찾기
    int getNumberByEmail(String phar_email) throws Exception;

    //나의 진료내역 리스트 출력 (준근)
    ArrayList<HashMap<String, Object>> pharCustomerRecordsList(int phar_number) throws Exception;

    //소연 : 약사(Pharmacy)정보 가져오기
    Pharmacy getPharInfo(int pharmacy_number) throws Exception;

    //용식 : 약사 회원가입
    Pharmacy join(Pharmacy pharmacy) throws Exception;
}
