package com.blb.ssm.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.blb.ssm.entity.User;
import com.blb.ssm.entity.UserRole;
import com.blb.ssm.msg.MyMsg;
import com.blb.ssm.service.IUserRoleService;
import com.blb.ssm.service.IUserService;
import com.blb.ssm.utils.Response;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import org.springframework.stereotype.Controller;

import java.sql.Wrapper;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author Huahao
 * @since 2020-04-21
 */
@Controller
@RequestMapping("user")
public class UserController {

    @Autowired
    private IUserService userService;

    @Autowired
    private IUserRoleService iUserRoleService;

    /**
     * 分页查询
     * @param page
     * @param limit
     * @return
     */
    @ResponseBody
    @RequestMapping("user_list")
    public Page<User> list(int page, int limit){

        Page<User> userPage = new Page<>(page,limit);

        return userService.page(userPage);
    }


    /**
     * 批量删除
     * @param ids
     * @return
     */
    @RequiresPermissions(value = {"user:delete"})
    @ResponseBody
    @RequestMapping("delete")
    public Response delete(@RequestBody List<String> ids){
        iUserRoleService.deleteByIds(ids);
        userService.removeByIds(ids);
        return Response.success();
    }


    /**
     * 通过id删除
     * @param id
     * @return
     */
    @RequiresPermissions(value = {"user:delete"})
    @ResponseBody
    @RequestMapping("deleteOne")
    public Response deleteOne(@RequestBody String id){
        iUserRoleService.deleteById(id);
        userService.removeById(id);
        return Response.success();
    }


    /**
     * 添加
     * @param user
     * @return
     */
    @RequiresPermissions(value = {"user:add"})
    @ResponseBody
    @RequestMapping("add")
    public Response add(  String roles, User user ){
        System.out.println(roles);
        user.setPassword("123456");
        user.setSalt(user.getUsername());
        userService.save(user,roles);
        return Response.success();
    }

    /**
     * 通过id查询
     * @param id
     * @param map
     * @return
     */
    @RequestMapping("one")
    public String getOne(@RequestParam("id")String id , Map<String,Object> map){
        User user = userService.getById(id);
        map.put("user",user);
        return "user/userset";
    }

    /**
     * 通过id修改
     * @param user
     * @return
     */
    @RequiresPermissions(value = {"user:update"})
    @ResponseBody
    @RequestMapping("set")
    public Response set(@RequestBody User user){
        userService.updateById(user);
        return Response.success();
    }




}

