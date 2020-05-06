package com.blb.ssm.controller;


import com.blb.ssm.entity.User;
import com.blb.ssm.msg.MyMsg;
import com.blb.ssm.service.IUserService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Collections;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author Huahao
 * @since 2020-04-17
 */
@Controller
@RequestMapping("user")
public class UserController {

    @Autowired
    private IUserService userService;

    @ResponseBody
    @GetMapping("user_list")
    public MyMsg list(){

        List<User> list = userService.list();

        return MyMsg.success(list).add(list);
    }

    @ResponseBody
    @GetMapping("add")
    @RequiresPermissions("aaa:add")
    public String addUser(){
        return "add";
    }
}

