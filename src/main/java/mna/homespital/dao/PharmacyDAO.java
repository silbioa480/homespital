package mna.homespital.dao;


import mna.homespital.dto.Pharmacy;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface PharmacyDAO {

    //소연 : 약사(Pharmacy)정보 가져오기
    Pharmacy PharInfo(int pharmacy_number) throws Exception;

}