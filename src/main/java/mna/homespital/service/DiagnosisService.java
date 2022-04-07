package mna.homespital.service;

import mna.homespital.dto.Diagnosis;


public interface DiagnosisService {

    //  진료차트폼 ( 인성 )
    void insertDiagnosis(Diagnosis diagnosis) throws Exception;

    //소연 : 진료차트(diagnosis)정보 가져오기
    public Diagnosis getDiaInfo(int diagnosis_number) throws Exception;

}
