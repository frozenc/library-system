package com.cc.library.service;

import com.cc.library.pojo.Book;

import java.util.List;

public interface BookService {
    /**
     * 展示所有书籍
     * @return
     */
    public List<Book> show();

    /**
     * 按照书名查找书籍
     * @param name
     * @return
     */
    public List<Book> selBookByName(String name);

    /**
     *
     * 获取书籍详细信息
     * @param id
     * @return
     */
    public Book selBookById(int id);
}
