package mna.homespital.dao;

import mna.homespital.dto.Diagnosis;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface DiagnosisDAO {
    public void insertDiag(Diagnosis diag) throws Exception;

    // 소연 : 나의진료내역(User) 볼때, 환자 진료 내역 diagnosis_number 가져오는 것.
    public Diagnosis getDiagnosisNo(int diagnosis_number);


}
