package com.blb.ssm.controller;

import com.blb.ssm.entity.Menu;
import com.blb.ssm.service.IMenuService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Map;

@Controller
public class LoginController {


    @Autowired
    IMenuService iMenuService;


    /**
     * 登录
     * @param username
     * @param password
     * @param map
     * @return
     */
    @PostMapping("login")
    public String login(String username, String password,Map<String ,Object> map){
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken usernamePasswordToken = new UsernamePasswordToken(username, password);
        subject.login(usernamePasswordToken);
        map.put("username",username);
        List<Menu> menus = iMenuService.getMenuByUserName(username, "0");
        map.put("menus",menus);
        System.out.println(menus);
        return "index";
    }
}
