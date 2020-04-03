package com.cc.library.service;

import com.cc.library.pojo.Book;
import com.cc.library.pojo.Lend;
import com.cc.library.pojo.User;

import java.util.List;

public interface LendService {
    /**
     * 展示借还列表
     * @return
     */
    public List<Lend> showLendList();

    /**
     * 展示用户借还列表
     * @param user
     * @return
     */
    public List<Lend> showUserLendList(User user);

    /**
     * 展示书籍借还历史
     * @param book
     * @return
     */
    public List<Lend> showBookLendList(Book book);

    /**
     *添加借还记录
     * @param lend
     * @return
     */
    public int insLendList(Lend lend);

    /**
     * 还书，修改还书记录中的还书日期
     * @param lend
     * @return
     */
    public int returnBook(int lend_id);
}
