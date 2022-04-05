package mna.homespital.service;


import mna.homespital.dto.AllMedical;

import java.util.List;

public interface AllMedicalListService {
  //모든진료항목 출력 태영
  public List<AllMedical> allMedicalList() throws Exception;
}
