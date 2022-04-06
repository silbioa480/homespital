package mna.homespital.service;

import mna.homespital.dao.MemberDAO;
import mna.homespital.dto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    MemberDAO memberDAO;

    //환자(User)정보 가져오기
    // user_number로 유저(환자)에 대한 정보 찾기 (준근)
    @Override
    public User getUserInfo(int user_number) throws Exception {
        System.out.println("getUserInfo() join");
        return memberDAO.selectUserDetail(user_number);
    }
}
