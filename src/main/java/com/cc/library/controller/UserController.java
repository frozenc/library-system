package com.cc.library.controller;

import com.cc.library.pojo.User;
import com.cc.library.service.UserService;
import com.cc.library.utils.Util;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class UserController {
    @Resource
    private UserService userServiceImpl;

    @RequestMapping("{page}")
    public String main(@PathVariable String page) {
        return page;
    }

    @RequestMapping("updPwd")
    public ModelAndView updPwd(String newPwd, String oldPwd, HttpSession session) {
        System.out.println("update password!");
        User user = (User) session.getAttribute("user");
        String oldPassword = Util.encrypt(oldPwd);
        String newPassword = Util.encrypt(newPwd);
        //检验旧密码是否正确
        if (!oldPassword.equals(user.getPassword())) {
            System.out.println(1);
            ModelAndView mav = new ModelAndView("user_info");
            mav.addObject("msg", "旧密码不对");
            return mav;
        }
        System.out.println(newPassword + user.getUsername());
        int index = userServiceImpl.updPwd(newPassword, user.getUsername());
        if (index > 0) {
            System.out.println(2);
            user.setPassword(newPassword);
            session.setAttribute("user", user);
            ModelAndView mav = new ModelAndView("user_info");
            mav.addObject("msg", "成功修改密码");
            return mav;
        } else {
            System.out.println(3);
            ModelAndView mav = new ModelAndView("user_info");
            mav.addObject("msg", "修改密码失败");
            return mav;
        }
    }

    @RequestMapping("login")
    public ModelAndView login(User users, HttpSession session) {
//        users.setPassword(Util.encrypt(users.getPassword()));
        User user = userServiceImpl.login(users);
        if (user != null) {
            ModelAndView mav = new ModelAndView("redirect:/showBooks");
            session.setAttribute("user", user);
            System.out.println(user);
            return mav;
        } else {
            ModelAndView mav = new ModelAndView("forward:/index.jsp");
            mav.addObject("mav", "账号不存在或账号密码不对！");
            return mav;
        }
    }

    @RequestMapping("logout")
    public String register(User user, HttpSession session) {
        //将session设置为失效，浏览器自动创建新的session
        session.invalidate();
        return "redirect:/index.jsp";
    }

    @RequestMapping("register")
    public ModelAndView register(User user, HttpServletRequest req) {
//        user.setPassword(Util.encrypt(user.getPassword()));
        int index = userServiceImpl.register(user);
        ModelAndView mav = new ModelAndView("forward:/index.jsp");
        if (index > 0) {
            mav.addObject("r_msg", "注册成功");
        } else {
            mav.addObject("r_msg", "注册失败,用户名已存在");
        }
        return mav;
    }
}
