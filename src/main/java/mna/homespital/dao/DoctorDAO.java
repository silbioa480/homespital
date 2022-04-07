package mna.homespital.dao;

import mna.homespital.dto.Doctor;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Mapper
@Repository
public interface DoctorDAO {

    List<Doctor> queryDoctor(int startrow) throws Exception;

    Integer doctorAmount() throws Exception;

    //    소연 : 의사 정보 1개 가져오기
    Doctor docInfo(int doctor_number) throws Exception;


    //의사 스케쥴에 대한 정보 가져오기 (준근)
    ArrayList<HashMap<String, Object>> getDocScheduleInfo(int doctor_number) throws Exception;

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
