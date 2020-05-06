package com.blb.ssm.controller;


import com.blb.ssm.entity.Menu;
import com.blb.ssm.service.IMenuService;
import com.blb.ssm.utils.Response;
import com.blb.ssm.utils.UUIDUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author Huahao
 * @since 2020-04-21
 */
@Controller
@RequestMapping("menu")
public class MenuController {

    @Autowired
    IMenuService iMenuService;

    @ResponseBody
    @RequestMapping("menu_list")
    public List<Menu> list(){
    return iMenuService.list();
    }

    @RequiresPermissions(value = {"menu:delete"})
    @ResponseBody
    @RequestMapping("deleteOne")
    public Response deleteOne(@RequestBody String id){
        iMenuService.removeById(id);
        return Response.success();
    }


    @RequestMapping("one")
    public String getOne(@RequestParam("id")String id , Map<String,Object> map){
        Menu menu = iMenuService.getById(id);
        map.put("menu",menu);
        return "menu/menuset";
    }

    @RequiresPermissions(value = {"menu:update"})
    @ResponseBody
    @RequestMapping("set")
    public Response set(@RequestBody Menu menu){
        iMenuService.updateById(menu);
        return Response.success();
    }

    @RequiresPermissions(value = {"menu:add"})
    @ResponseBody
    @RequestMapping("add")
    public Response add(@RequestBody Menu menu){
        iMenuService.save(menu);
        return Response.success();
    }

    @RequiresPermissions(value = {"menu:add"})
    @RequestMapping("addone")
    public String addone(@RequestParam("id")String id , Map<String,Object> map){
        map.put("id",id);
        return "menu/menuaddone";
    }


    @ResponseBody
    @RequestMapping("getTreeMenu")
    public List<Menu> getTreeMenu(String id){
        List<Menu> treeMenu = iMenuService.getTreeMenu(id);
        return treeMenu;
    }


}

