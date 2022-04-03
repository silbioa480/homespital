package mna.homespital.service;

import mna.homespital.dao.DoctorDAO;
import mna.homespital.dto.Doctor;
import mna.homespital.dto.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DoctorServiceImpl implements DoctorService {
    @Autowired
    DoctorDAO doctorDAO;

    @Override
    public List<Doctor> getDocList(int page, PageInfo pageInfo) throws Exception {

        //List<Doctor> list = doctorDAO.queryDoctor(0);
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
        return doctorDAO.queryDoctor(startrow);
        //return list;
    }
}
