package mna.homespital.service;

import mna.homespital.dao.MedicalListDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;

@Service
public class MedicalListServiceImpl implements MedicalListService {

    @Autowired
    MedicalListDAO medicalListDAO;


//    @Override
//    public List<Diagnosis> medicalRecordsList(int user_number) throws Exception {
//        return medicalListDAO.medicalRecordsList(user_number);
//    }

    @Override
    public ArrayList<HashMap<String, Object>> medicalRecordsList(int user_number) throws Exception {
        return medicalListDAO.medicalRecordsList(user_number);
    }
}
