package mna.homespital.service;

import mna.homespital.dto.User;

public interface MemberService {

    //가영: 로그인
    boolean login(String user_email, String user_password) throws Exception;
}
