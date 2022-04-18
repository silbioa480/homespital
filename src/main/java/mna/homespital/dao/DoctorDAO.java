package mna.homespital.dao;

import mna.homespital.dto.Diagnosis;
import mna.homespital.dto.Doctor;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface DoctorDAO {

    //가영: 이메일로 의사 정보 가져오기
    Doctor DoctorQueryMember(String email) throws Exception;

    //가영: 의사 정보 넣기
    void insertDoctorMember(Doctor doctor) throws Exception;

    // 의료진 찾기 - 의료진 목록 보기 (훈)
    List<Doctor> queryDoctor(Map<String, Object> param) throws Exception;

    Integer doctorAmount() throws Exception;

    //    소연 : 의사 정보 1개 가져오기
    Doctor docInfo(int doctor_number) throws Exception;

    // 의사명 및 병원명 검색 태영
    List<Doctor> searchDoh(String keyword) throws Exception;

    //의사 스케쥴에 대한 정보 가져오기 (준근)
    ArrayList<HashMap<String, Object>> getDocScheduleInfo(int doctor_number) throws Exception;


    // 의사이메일로 의사 가져오기(준근)
    Doctor searchDocId(String doctor_email) throws Exception;

    // 의사 진료내역 리스트 출력(준근)
    ArrayList<HashMap<String, Object>> docMedicalRecords(int doctor_number) throws Exception;

    // 의사 로그인에 필요한 정보 가져오기
    Doctor docLoginQuery(String doctor_email) throws Exception;

    // 진료시작하기(준근)
    void startDiagnosis(int diagnosis_number) throws Exception;

    // 진료 완료하기(준근)
    void finishDiagnosis(int diagnosis_number) throws Exception;

    // 진료영수증 업로드(준근)
    void uploadReceipt(Map<String, Object> param) throws Exception;

    // 처방전 업로드(준근)
    void uploadPrescription(Map<String, Object> param) throws Exception;

    //의사번호를 통해서 환자 전화번호 갖고오기 태영
    String getUserPhone(int doctor_number) throws Exception;

    //진료영수증 업로드 된지 확인(준근)
    Diagnosis checkDiagnosisUpload(int diagnosis_number) throws Exception;

    //처방전 없이 진료완료 시 is_prescription_upload 3(처방전없음)으로 변경 (준근)
    void changePrescription(int diagnosis_number) throws Exception;

    int doctorAmountByType(String doctor_diagnosis_type) throws Exception;

    // 거리순 검색 알고리즘
    // 현재 주소를 어떻게든 가져와. 이거는 geolocation = html5 https
    // 이 주소를 기반으로 현재 위치로부터 가까운 병원 순으로 카카오맵에서 병원 리스트를 가져옴
    // 해당 병원이랑 주소가 맞는 의사들 리스트를 가져옴
    // 거리순으로 정렬

    // 실시간 검색 알고리즘
    // 의사들의 스케줄을 확인한다 = 가장 모호하고 난잡함
    // 의사들의 일하는 시간은 10#11#12#13#14 이런식으로 VARCHAR(String) 형태로 DB에 담길거다.
    // 담기는거는 이렇게 하고 컨트롤러에서 읽고 쓸 때에 처리를 해줘야 함
    // 컨트롤러에서 Map<String, Object> 형태로 해서 String[]형태로 보내줘야 함
    //
    // 정렬

}
