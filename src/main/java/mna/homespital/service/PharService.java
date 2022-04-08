package mna.homespital.service;

import mna.homespital.dto.Pharmacy;


public interface PharService {

    //소연 : 약사(Pharmacy)정보 가져오기
    Pharmacy getPharInfo(int pharmacy_number) throws Exception;

    //용식 : 약사 회원가입
    Pharmacy join(Pharmacy pharmacy) throws Exception;

    //용식: 약사 로그인
    boolean login(String email, String password) throws Exception;
}
