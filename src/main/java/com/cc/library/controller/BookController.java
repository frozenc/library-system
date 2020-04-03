package com.cc.library.controller;

import com.cc.library.pojo.Book;
import com.cc.library.service.BookService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class BookController {
    @Resource
    private BookService bookServiceImpl;

    @RequestMapping("showBooks")
    public String showBooks(HttpServletRequest request) {
        List<Book> list = bookServiceImpl.show();
        request.setAttribute("bookList", list);
        return "main";
    }

    @RequestMapping("searchBook")
    public ModelAndView searchBook(HttpServletRequest request) {
        String b_name = request.getParameter("b_name").toString();
        List<Book> books = bookServiceImpl.selBookByName(b_name);
        ModelAndView mav = new ModelAndView("main");
        if (books != null) {
            mav.addObject("bookList",books);
        } else {
            mav.addObject("s_msg","找不到书籍信息");
        }
        return mav;
    }

    @RequestMapping("getBookInfo")
    public ModelAndView getBookInfo(HttpServletRequest request) {
        String b_id = request.getParameter("b_id").toString();
        Book book = bookServiceImpl.selBookById(Integer.parseInt(b_id));
        ModelAndView mav = new ModelAndView("book_info");
        if (book != null) {
            mav.addObject("book",book);
        } else {
            mav.addObject("s_msg","找不到书籍信息");
        }
        return mav;
    }

}
