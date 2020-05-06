package com.blb.ssm.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.blb.ssm.entity.Role;
import com.blb.ssm.service.IRoleMenuService;
import com.blb.ssm.service.IRoleService;
import com.blb.ssm.utils.Response;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
@RequestMapping("role")
public class RoleController {

    @Autowired
    IRoleService roleService;

    @Autowired
    IRoleMenuService iRoleMenuService;

    @ResponseBody
    @RequestMapping("roleList")
    public List<Role> getList(){
        return roleService.list();
    }


    @ResponseBody
    @RequestMapping("role_list")
    public Page<Role> list(int page, int limit){
        Page<Role> rolePage = new Page<>(page,limit);
        return roleService.page(rolePage);
    }

    @RequiresPermissions(value = {"role:add"})
    @ResponseBody
    @RequestMapping("add")
    public Response add( Role role ,String menus){
        roleService.save(role,menus);
        return Response.success();
    }

    @RequiresPermissions(value = {"role:delete"})
    @ResponseBody
    @RequestMapping("delete")
    public Response delete(@RequestBody List<String> ids){
        iRoleMenuService.deleteByIds(ids);
        roleService.removeByIds(ids);
        return Response.success();
    }

    @RequiresPermissions(value = {"role:delete"})
    @ResponseBody
    @RequestMapping("deleteOne")
    public Response deleteOne(@RequestBody String id){
        iRoleMenuService.deleteById(id);
        roleService.removeById(id);
        return Response.success();
    }

    @RequestMapping("one")
    public String getOne(@RequestParam("id")String id , Map<String,Object> map){
        Role role = roleService.getById(id);
        map.put("role",role);
        return "role/roleset";
    }

    @RequiresPermissions(value = {"role:update"})
    @ResponseBody
    @RequestMapping("set")
    public Response set(@RequestBody Role role){
        roleService.updateById(role);
        return Response.success();
    }

}

