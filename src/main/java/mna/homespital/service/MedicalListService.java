package mna.homespital.service;

import mna.homespital.dto.Diagnosis;

import java.util.ArrayList;
import java.util.HashMap;

public interface MedicalListService {
    //나의 진료내역 리스트 출력 (준근)
//    List<Diagnosis> medicalRecordsList(int user_number) throws Exception;
    ArrayList<HashMap<String, Object>> medicalRecordsList(int user_number) throws Exception;

    //진료 예약 취소(삭제) (준근)
    void deleteMedicalRecord(int diagnosis_number) throws Exception;

    // 소연 : 나의진료내역(User) 볼때, 환자 진료 내역 diagnosis_number 가져오는 것.
    Diagnosis getDiagnosisNo(int diagnosis_number) throws Exception;
}
