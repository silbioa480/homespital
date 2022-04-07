package mna.homespital.dao;


import mna.homespital.dto.Pharmacy;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface PharmacyDAO {

    //소연 : 약사(Pharmacy)정보 가져오기
    Pharmacy PharInfo(int pharmacy_number) throws Exception;

    //용식: 이메일로 약사 정보 가져오기
    Pharmacy PharmacyQueryMember(String pharmacy_email) throws Exception;

    //용식: 약사 정보 넣기
    void insertPharmacyMember(Pharmacy pharmacy) throws Exception;


}