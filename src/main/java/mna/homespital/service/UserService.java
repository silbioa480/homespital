package mna.homespital.service;

import mna.homespital.dto.User;


public interface UserService {

    //user_number로 유저(환자)에 대한 정보 찾기 (준근)
    User getUserInfo(int user_number) throws Exception;
}
