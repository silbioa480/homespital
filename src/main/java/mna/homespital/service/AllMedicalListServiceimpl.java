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

<<<<<<< HEAD
    @Override
    public List<AllMedical> searchMed(String keyward) throws Exception {
        return allmdDAO.searchMedical(keyward);
    }
=======
>>>>>>> 2dfa99d49553e26f7ca30b4268d8839824508159
}
