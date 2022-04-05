package mna.homespital.dao;


import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;

@Mapper
@Repository("diagnosis")
public interface MedicalListDAO {
    //나의 진료내역 리스트 출력 (준근)
//    List<Diagnosis> medicalRecordsList(int user_number) throws Exception;
    ArrayList<HashMap<String, Object>> medicalRecordsList(int user_number) throws Exception;

    //진료 예약 취소(삭제) (준근)
    void deleteMedicalRecord(int diagnosis_number) throws Exception;

    //유저이메일로 유저넘버 가져오기(세션에 이메일만 저장되어있어서 db를 통해 가져와야함)(준근)
    int searchId(String user_email) throws Exception;
}
