package mna.homespital.service;

import mna.homespital.dto.Diagnosis;

import java.util.HashMap;


public interface DiagnosisService {

    //  진료차트폼 ( 인성 )
    void insertDiagnosis(Diagnosis diagnosis) throws Exception;

    //소연 : 진료차트(diagnosis)정보 가져오기
    public Diagnosis getDiaInfo(int diagnosis_number) throws Exception;

    //훈 : 진료차트 상세내역 가져오기
    public HashMap<String, Object> getDiagnosisDetail(int diagnosis_number) throws Exception;

    //훈 : 진료차트 의사 소견 작성하기
    public void writeDoctorOpinion(int diagnosis_number, String doctor_opinion) throws Exception;
    
}
