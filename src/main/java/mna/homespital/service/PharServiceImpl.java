package mna.homespital.service;

import mna.homespital.dao.PharmacyDAO;
import mna.homespital.dto.Pharmacy;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PharServiceImpl implements PharService {
    @Autowired
    PharmacyDAO pharmacyDAO;

    //소연 : 약사(Pharmacy)정보 가져오기
    @Override
    public Pharmacy getPharInfo(int pharmacy_number) throws Exception {
        System.out.println("getPharInfo() join");
        return pharmacyDAO.PharInfo(pharmacy_number);
    }
}
