package mna.homespital.service;


import mna.homespital.dao.AllMedicalListDAO;
import mna.homespital.dto.AllMedical;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AllMedicalListServiceimpl implements AllMedicalListService {

  @Autowired
  AllMedicalListDAO allmdDAO;

  //모든진료항목 출력 태영

  @Override
  public List<AllMedical> allMedList() throws Exception {
    return allmdDAO.allMedicalList();
  }


    @Override
    public List<AllMedical> searchMed(String keyward) throws Exception {
        return allmdDAO.searchMedical(keyward);
    }


}
