package com.cc.library.service.impl;

import com.cc.library.mapper.BookMapper;
import com.cc.library.pojo.Book;
import com.cc.library.service.BookService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class BookServiceImpl implements BookService {
    @Resource
    private BookMapper bookMapper;

    @Override
    public List<Book> show() {
        return bookMapper.selAllBooks();
    }

    @Override
    public List<Book> selBookByName(String name) {
        //数据库模糊查询
        name = "%" + name + "%";
        return bookMapper.selBookByName(name);
    }

    @Override
    public Book selBookById(int id) {
        return bookMapper.selBookById(id);
    }


}
