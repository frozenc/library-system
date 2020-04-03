package com.cc.library.mapper;

import com.cc.library.pojo.Book;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface BookMapper {
    @Select("select * from books")
    List<Book> selAllBooks();

    @Select("select * from books where name like #{name}")
    List<Book> selBookByName(@Param("name") String name);

    @Select("select * from books where id = #{id}")
    Book selBookById(@Param("id") int id);

    @Update("update books set state=#{state} where id = #{book_id}")
    int updBookState(@Param("state") int state, @Param("book_id") int book_id);
}
