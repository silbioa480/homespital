package mna.homespital.service;

import mna.homespital.dao.DiagnosisDAO;
import mna.homespital.dto.Diagnosis;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DiagnosisServiceImpl implements  DiagnosisService {

    @Autowired
    DiagnosisDAO diagnosisDAO;

//    ( 인성 )
    @Override
    public void insertDiagnosis(Diagnosis diagnosis) throws Exception {
        diagnosisDAO.insertDiagnosis(diagnosis);
    }
}
