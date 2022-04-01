package mna.homespital.service;

import lombok.RequiredArgsConstructor;
import mna.homespital.dao.MemberDAO;
import mna.homespital.dto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {
    @Autowired
    MemberDAO memberDAO;

    //가영: 로그인
    @Override
    public boolean login(String user_email, String user_password) throws Exception {
        try {
            User mem = memberDAO.queryMember(user_email);
            if (mem == null) throw new Exception();
            if (user_password.equals(mem.getUser_password())) {
                return true;
            } else {
                throw new Exception();
            }
        } catch (Exception e) {
            throw new Exception("로그인 오류");
        }
    }
}
