package mna.homespital.dao;

import mna.homespital.dto.Diagnosis;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface DiagnosisDAO {
    public void insertDiag(Diagnosis diag) throws Exception;

    // 소연 : diagnosis_number로 해당진료내역 가져오기
    public Diagnosis getDiagnosisNo(int diagnosis_number);

    //  진료차트폼 ( 인성 )
    void insertDiagnosis(Diagnosis diagnosis) throws Exception;
}
