package mna.homespital.dao;

import mna.homespital.dto.Doctor;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface DoctorDAO {
    List<Doctor> queryDoctor(int startrow) throws Exception;

    Integer doctorAmount() throws Exception;

    //    소연 : 의사 정보 1개 가져오기
    Doctor docInfo(int doctor_number) throws Exception;

}
