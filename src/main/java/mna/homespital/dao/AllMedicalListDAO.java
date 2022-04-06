package mna.homespital.dao;



import mna.homespital.dto.AllMedical;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface AllMedicalListDAO {
    //모든진료항목,진료과 검색 태영
    public List<AllMedical> allMedicalList() throws Exception;
    public List<AllMedical> searchMedical(String keyward) throws Exception;
 }
