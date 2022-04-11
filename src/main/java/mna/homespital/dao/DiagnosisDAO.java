package mna.homespital.dao;

import mna.homespital.dto.Diagnosis;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

@Mapper
@Repository
public interface DiagnosisDAO {
    public void insertDiag(Diagnosis diag) throws Exception;

    // 소연 : diagnosis_number로 해당진료내역 가져오기
    public Diagnosis getDiagnosisNo(int diagnosis_number);

    //  진료차트폼 ( 인성 )
    void insertDiagnosis(Diagnosis diagnosis) throws Exception;

    // 훈 : diagnosis_number로 해당진료 상세내역 가져오기
    public HashMap<String, Object> diagnosisDetail(int diagnosis_number) throws Exception;

    // 훈 : 의사 소견 적기
    public void writeDoctorOpinion(Map<String, Object> params) throws Exception;
}
