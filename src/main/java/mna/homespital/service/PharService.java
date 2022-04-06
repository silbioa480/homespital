package mna.homespital.service;

import mna.homespital.dto.Pharmacy;


public interface PharService {

    //소연 : 약사(Pharmacy)정보 가져오기
    Pharmacy getPharInfo(int pharmacy_number) throws Exception;
}
