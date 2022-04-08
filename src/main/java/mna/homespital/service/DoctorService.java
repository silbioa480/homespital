package mna.homespital.service;

import mna.homespital.dto.Doctor;
import mna.homespital.dto.PageInfo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface DoctorService {

    //가영 : 의사 회원가입
    Doctor join(Doctor doctor) throws Exception;

    // 의료진 찾기 - 의료진 목록 보기 (훈)
    public List<Doctor> getDocList(String doctor_diagnosis_type, int page, PageInfo pageInfo) throws Exception;

//    // 소연 : 의료진 list 5개 보여주고, 6개 부터는 다음으로 넘어가는 것. (무한 스크롤이 2nd.일단 일케 할게요) (DTO와 연결, DAO필요X)
//    PageInfo getPageInfo(PageInfo pageInfo) throws Exception;

    //소연 : 의사(Doctor)정보 가져오기
    public Doctor getDocInfo(int doctor_number) throws Exception;

    //의사명 및 병원명 검색 태영
    public List<Doctor> getSearchDoh(String keyword) throws Exception;

    //의사 스케쥴에 대한 정보 가져오기(준근)
    ArrayList<HashMap<String, Object>> getDocScheduleInfo(int doctor_number) throws Exception;

    //의사 이메일로 의사정보 가져오기 (준근)
    int searchDocId(String doctor_email) throws Exception;

    //의사 진료내역 리스트 출력(준근)
    ArrayList<HashMap<String, Object>> docMedicalRecords(int doctor_number) throws Exception;

    //의사 로그인(준근)
    boolean docLogin(String doctor_email, String doctor_password) throws Exception;

}
