package mna.homespital.service;

import mna.homespital.dto.Diagnosis;
import org.springframework.web.multipart.MultipartFile;


public interface DiagnosisService {

//  진료차트폼 ( 인성 )
    void insertDiagnosis(Diagnosis diagnosis) throws Exception;
}
