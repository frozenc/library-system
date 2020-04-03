package com.cc.library.service.impl;

import com.cc.library.mapper.UserMapper;
import com.cc.library.pojo.User;
import com.cc.library.service.UserService;
import com.cc.library.utils.Util;
import org.apache.ibatis.jdbc.Null;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserMapper userMapper;

    @Override
    public User login(User user) {
        User u = userMapper.selByName(user.getUsername());
        if (u != null) {
            if (u.getPassword().equals(Util.encrypt(user.getPassword()))) {
                return u;
            } else {
                return null;
            }
        } else {
            return null;
        }

    }

    @Override
    public int register(User user) {
        //判断用户是否已存在
        User u = userMapper.selByName(user.getUsername());
        if (u != null) {
            return -1;
        }
        //对用户密码进行加密
        user.setPassword(Util.encrypt(user.getPassword()));
        return userMapper.insUsers(user);
    }

    @Override
    public int updPwd(String pwd, String username) {
        return userMapper.updUserPwd(pwd, username);
    }
}
