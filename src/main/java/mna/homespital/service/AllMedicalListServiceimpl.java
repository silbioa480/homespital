package mna.homespital.service;


import mna.homespital.dao.allMedicalListDAO;
import mna.homespital.dto.allMedical;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class allMedicalListServiceimpl implements allMedicalListService{
    @Autowired
    allMedicalListDAO allmdDAO;

    @Override
    public List<allMedical> allMedList() throws Exception {
        return allmdDAO.allMedicalList();
    }
}
