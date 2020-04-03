package com.cc.library.controller;

import com.cc.library.pojo.Book;
import com.cc.library.pojo.Lend;
import com.cc.library.pojo.User;
import com.cc.library.service.LendService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class LendController {
    @Resource
    private LendService lendServiceImpl;

    @RequestMapping("returnBook")
    public ModelAndView returnBook(HttpServletRequest request) {
        int lend_id = Integer.parseInt(request.getParameter("id").toString());
        int index = lendServiceImpl.returnBook(lend_id);
        ModelAndView mav = new ModelAndView("redirect: /showUserLendList");
        if(index > 0) {
            mav.addObject("msg","成功还书");
        } else {
            mav.addObject("msg","还书失败");
        }
        return mav;
    }

    @RequestMapping("lendBook")
    public ModelAndView lendBook(HttpServletRequest request){
        Lend lend = new Lend();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        lend.setBook_id(Integer.parseInt(request.getParameter("b_no").toString()));
        lend.setUser_id(user.getId());
        lend.setLend_date(new Date());
        lend.setState(0);
        int index = lendServiceImpl.insLendList(lend);
        ModelAndView mav = new ModelAndView("redirect: /showUserLendList");
        if (index < 0) {
            mav.setViewName("redirect:/showBooks");
            session.setAttribute("msg", "error");
        }
        return mav;
    }

    @RequestMapping("showLendList")
    public ModelAndView showAllLendList(HttpServletRequest request){
        List<Lend> lends = lendServiceImpl.showLendList();
        ModelAndView mav = new ModelAndView("all_lend_list");
        mav.addObject("lendList", lends);
        return mav;
    }

    @RequestMapping("showBookLendList")
    public ModelAndView showBookLendList(HttpServletRequest request){
        Book book = new Book();
        book.setId(Integer.parseInt(request.getParameter("b_no").toString()));
        List<Lend> lends = lendServiceImpl.showBookLendList(book);
        ModelAndView mav = new ModelAndView("forward:/all_lend_list");
        mav.addObject("lendList", lends);
        return mav;
    }

    @RequestMapping("showUserLendList")
    public ModelAndView showUserLendList(HttpSession session){
        User user = (User) session.getAttribute("user");
        System.out.println(user);
        List<Lend> lends = lendServiceImpl.showUserLendList(user);
        ModelAndView mav = new ModelAndView("forward:/lend_list");
        mav.addObject("lendList", lends);
        return mav;
    }
}
