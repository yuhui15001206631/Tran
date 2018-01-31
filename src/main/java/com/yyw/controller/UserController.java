package com.yyw.controller;

import com.yyw.entity.TUser;
import com.yyw.service.TUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2017/12/10.
 */
@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    private TUserService tUserService;
    @RequestMapping(value = "login",method = RequestMethod.POST)
    public String login(TUser tUser, HttpSession session, Model model){
        TUser loginTUser=tUserService.login(tUser);
        if(loginTUser!=null){
            session.setAttribute("LoginUser",loginTUser);
            return "comm/welcome";
        }
        model.addAttribute("message","用户名密码错误");
        return "login";
    }
}
