package mna.homespital.service;

import mna.homespital.dao.DoctorDAO;
import mna.homespital.dto.Doctor;
import mna.homespital.dto.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DoctorServiceImpl implements DoctorService {
    @Autowired
    DoctorDAO doctorDAO;

    @Override
    public List<Doctor> getDocList(String doctor_diagnosis_type, int page, PageInfo pageInfo) throws Exception {

        // 의료진 찾기 - 의료진 목록 보기 (훈)

//        List<Doctor> list = doctorDAO.queryDoctor(param);
        int listCount = doctorDAO.doctorAmount();

        // 총 페이지 수. 올림처리
        int maxPage = (int) Math.ceil((double) listCount / 10);

        // 현재 페이지에 보여줄 시작 페이지 수
        int startPage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;

        // 현재 페이지에 보여줄 마지막 페이지 수(10,20,30,..)
        int endPage = startPage + 10 - 1;

        if (endPage > maxPage) endPage = maxPage;
        pageInfo.setStartPage(startPage);
        pageInfo.setEndPage(endPage);
        pageInfo.setMaxPage(maxPage);
        pageInfo.setPage(page);
        pageInfo.setListCount(listCount);
        int startrow = (page - 1) * 10 + 1;
//        HashMap<String, Integer> input = new HashMap<>();
//        input.put("startrow", startrow);
        Map<String, Object> param = new HashMap<>();
        param.put("doctor_diagnosis_type", doctor_diagnosis_type);
        param.put("startrow", startrow);
        return doctorDAO.queryDoctor(param);
        //return list;
    }

//    // 소연 : 의료진 list 5개 보여주고, 6개 부터는 다음으로 넘어가는 것.
//    @Override
//    public PageInfo getPageInfo(PageInfo pageInfo) throws Exception {
//        int listCount = DoctorDAO.selectCommBoardCount();
//        System.out.println("리스트카운트 :" + listCount);
//        int maxPage = (int) Math.ceil((double) listCount / 15);
//        // 그 개수를 15으로 나누고 올림처리하여 페이지 수 계산
//        // table에 있는 모든 row 개수
//        double pagenation = pageInfo.getPage(); // ? 새로 추가
//        // 아래에 페이지 이동 버튼도 10개로 구성하고자 하기 위함이다.
//        int startPage = (((int) ((double) pagenation / 10 + 0.9)) - 1) * 10 + 1;
//        // 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21, ...)
//
//        int endPage = startPage + 10 - 1;
//        // 현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30, ...)
//        if (maxPage < endPage) {
//            endPage = maxPage;
//        }
//        pageInfo.setListCount(listCount);
//        pageInfo.setMaxPage(maxPage);
//        pageInfo.setEndPage(endPage);
//        pageInfo.setStartPage(startPage);
//        return pageInfo;
//    }

    // 소연 - 의사정보 가져오기
    @Override
    public Doctor getDocInfo(int doctor_number) throws Exception {
        System.out.println("getDocInfo() join");
        return doctorDAO.docInfo(doctor_number);
    }

    //의사명 및 병원명 검색 (태영)
    @Override
    public List<Doctor> getSearchDoh(String keyword) throws Exception {
        return doctorDAO.searchDoh(keyword);
    }

    // 의사 스케쥴에 대한 정보 가져오기 (준근)
    @Override
    public ArrayList<HashMap<String, Object>> getDocScheduleInfo(int doctor_number) throws Exception {
        return doctorDAO.getDocScheduleInfo(doctor_number);
    }

    // 의사이메일로 의사 가져오기(준근)
    @Override
    public int searchDocId(String doctor_email) throws Exception {
        return doctorDAO.searchDocId(doctor_email);
    }

    @Override
    public ArrayList<HashMap<String, Object>> docMedicalRecords(int doctor_number) throws Exception {
        return doctorDAO.docMedicalRecords(doctor_number);
    }


}
