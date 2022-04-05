package mna.homespital.dao;

import mna.homespital.dto.Doctor;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface DoctorDAO {
    Doctor selectDoctorByNumber(int doctor_number)  throws Exception;

    List<Doctor> queryDoctor(int startrow) throws Exception;

    Integer doctorAmount() throws Exception;
}
