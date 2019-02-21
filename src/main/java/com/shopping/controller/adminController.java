package com.shopping.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.shopping.entity.admin;
import com.shopping.service.adminService;
import com.shopping.utils.Response;
import org.springframework.stereotype.Controller;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;


@Controller
public class adminController {

    @Resource
    adminService adminService;



   
    @RequestMapping(value = "/admin_login")
    public String login() {
        return "admin_login";
    }

    

    @RequestMapping(value = "/admin_doLogin", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> doLogin(String userNameOrEmail, String password, HttpSession httpSession) {
        System.out.println("我接收到了登录请求" + userNameOrEmail + " " + password);
        String result = "fail";
        admin user = adminService.getUser(userNameOrEmail);
        if (user == null)
            result = "unexist";
        else {
            admin adminDetail = adminService.getUser(user.getId());
            if (adminDetail.getPassword().equals(password)) {
                result = "success";
                httpSession.setAttribute("currentUser", user);
            } else
                result = "wrong";
        }
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("result", result);
        return resultMap;
    }


    @RequestMapping(value = "/admin_doLogout")
    public String doLogout(HttpSession httpSession){
    	httpSession.removeAttribute("currentUser");
        return "redirect:admin_login";
    }

    

}
