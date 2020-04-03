package com.cc.library.service;

import com.cc.library.pojo.User;

public interface UserService {
    /**
     * 登录功能
     * @param user
     * @return
     */
    public User login(User user);

    /**
     * 账户注册功能
     * @param user
     * @return
     */
    public int register(User user);

    /**
     * 修改密码功能
     * @param user
     * @return
     */
    public int updPwd(String pwd, String username);
}
