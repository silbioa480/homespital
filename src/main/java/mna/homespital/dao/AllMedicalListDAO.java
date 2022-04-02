package mna.homespital.dao;



import mna.homespital.dto.AllMedical;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface AllMedicalListDAO {
    public List<AllMedical> allMedicalList() throws Exception;
}
