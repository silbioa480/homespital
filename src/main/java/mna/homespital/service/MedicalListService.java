package mna.homespital.service;

import mna.homespital.dto.Diagnosis;

import java.util.ArrayList;
import java.util.HashMap;

public interface MedicalListService {
    //유저이메일로 유저넘버 가져오기(세션에 이메일만 저장되어있어서 db를 통해 가져와야함)(준근)
    int searchId(String user_email) throws Exception;

    //나의 진료내역 리스트 출력 (준근)
    ArrayList<HashMap<String, Object>> medicalRecordsList(int user_number) throws Exception;

    //진료 예약 취소(삭제) (준근)
    void deleteMedicalRecord(int diagnosis_number) throws Exception;

    // 소연 : diagnosis_number로 해당진료내역 가져오기
    Diagnosis getDiagnosisNo(int diagnosis_number) throws Exception;

}
