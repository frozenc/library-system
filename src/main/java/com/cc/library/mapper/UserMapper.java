package com.cc.library.mapper;

import com.cc.library.pojo.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface UserMapper {
    @Select("select * from users where username=#{username} and password=#{password}")
    User selByNamePwd(User user);

    @Select("select * from users where username=#{username}")
    User selByName(@Param("username") String name);

    @Insert("insert into users values(default, #{username}, #{password})")
    int insUsers(User user);

    @Update("update users set password=#{password} where username=#{username}")
    int updUserPwd(@Param("password") String password, @Param("username") String username);
}
