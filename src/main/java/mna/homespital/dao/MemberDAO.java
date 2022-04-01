package mna.homespital.dao;


import mna.homespital.dto.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface MemberDAO {
    void insertMember(User user) throws Exception;


    public User queryMember(String user_email) throws Exception;

}
