package mna.homespital.dao;



import mna.homespital.dto.allMedical;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface allMedicalListDAO {
    public List<allMedical> allMedicalList() throws Exception;
}
