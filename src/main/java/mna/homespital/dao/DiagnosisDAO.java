package mna.homespital.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface DiagnosisDAO {
    public void insertDiag(DiagnosisDTO diag) throws Exception;
}
