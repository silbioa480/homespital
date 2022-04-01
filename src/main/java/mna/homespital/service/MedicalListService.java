package mna.homespital.service;

import mna.homespital.dto.Diagnosis;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;

public interface MedicalListService {
    //나의 진료내역 리스트 출력 (준근)
//    List<Diagnosis> medicalRecordsList(int user_number) throws Exception;
    ArrayList<HashMap<String, Object>> medicalRecordsList(int user_number) throws Exception;

    //진료 예약 취소(삭제) (준근)
    void deleteMedicalRecord(int diagnosis_number) throws Exception;



}
