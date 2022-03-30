package mna.homespital.service;

import java.util.ArrayList;
import java.util.HashMap;

public interface MedicalListService {
    //나의 진료내역 리스트 출력
//    List<Diagnosis> medicalRecordsList(int user_number) throws Exception;
    ArrayList<HashMap<String, Object>> medicalRecordsList(int user_number) throws Exception;
}
