package mna.homespital.dao;


import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;

@Mapper
@Repository("diagnosis")
public interface MedicalListDAO {
    //나의 진료내역 리스트 출력
//    List<Diagnosis> medicalRecordsList(int user_number) throws Exception;
    ArrayList<HashMap<String, Object>> medicalRecordsList(int user_number) throws Exception;
}