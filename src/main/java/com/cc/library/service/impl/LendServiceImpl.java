package com.cc.library.service.impl;

import com.cc.library.mapper.BookMapper;
import com.cc.library.mapper.LendMapper;
import com.cc.library.pojo.Book;
import com.cc.library.pojo.Lend;
import com.cc.library.pojo.User;
import com.cc.library.service.LendService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class LendServiceImpl implements LendService {
    @Resource
    private LendMapper lendMapper;
    @Resource
    private BookMapper bookMapper;

    @Override
    public List<Lend> showLendList() {
        return lendMapper.showAllLendList();
    }

    @Override
    public List<Lend> showUserLendList(User user) {
        return lendMapper.showUserLendList(user);
    }

    @Override
    public List<Lend> showBookLendList(Book book) {
        return lendMapper.showBookLendList(book);
    }

    @Override
    public int insLendList(Lend lend) {
        int index = lendMapper.insLendList(lend);
        if (index > 0) {
            //更新书籍状态，0为在馆，1为借出
            int i = bookMapper.updBookState(2, lend.getBook_id());
            if (i > 0) {
                return index;
            }
        }
        return -1;
    }

    @Override
    public int returnBook(int lend_id) {
        Lend lend = lendMapper.selById(lend_id);
        //判断书籍是否已归还,(1 , "未还"), (2 , "已还"), (3 , "逾期")
        if (lend.getState() == 2) {
            return 1;
        }
        //更新书籍状态，1为在馆，2为借出
        bookMapper.updBookState(1, lend.getBook_id());
        Date backDate = new Date();
        return lendMapper.updBackDate(backDate, 1, lend_id);
    }
}
