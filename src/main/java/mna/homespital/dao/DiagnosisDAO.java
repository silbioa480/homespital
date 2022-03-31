package mna.homespital.dao;

import mna.homespital.dto.Diagnosis;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface DiagnosisDAO {
  public void insertDiag(Diagnosis diag) throws Exception;
}
