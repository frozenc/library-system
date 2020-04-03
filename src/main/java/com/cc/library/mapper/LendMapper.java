package com.cc.library.mapper;

import com.cc.library.pojo.Book;
import com.cc.library.pojo.Lend;
import com.cc.library.pojo.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.Date;
import java.util.List;

public interface LendMapper {
    @Select("select * from lend_list")
    public List<Lend> showAllLendList();

    @Select("select * from lend_list where id = #{id}")
    public Lend selById(@Param("id") int id);

    @Select("select * from lend_list where user_id = #{id}")
    public List<Lend> showUserLendList(User user);

    @Select("select * from lend_list where book_id = #{id}")
    public List<Lend> showBookLendList(Book book);

    @Insert("insert into lend_list values(default, #{book_id}, #{user_id}, #{lend_date}, #{back_date}, #{state})")
    public int insLendList(Lend lend);

    @Update("update lend_list set back_date = #{back_date},state=#{state} where id = #{id}")
    public int updBackDate(@Param("back_date") Date back_date, @Param("state") int state, @Param("id") int id);

//    @Select("select *  from lend_list where book_id=#{book_id}")
//    public Lend selLendById(@Param("book_id") int id);
}
