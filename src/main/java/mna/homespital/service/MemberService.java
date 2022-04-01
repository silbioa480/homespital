package mna.homespital.service;

import mna.homespital.dto.User;

public interface MemberService {

    boolean login(String user_email, String user_password) throws Exception;
}
