package com.blb.ssm.service.impl;

import com.blb.ssm.entity.Role;
import com.blb.ssm.entity.RoleMenu;
import com.blb.ssm.mapper.RoleMapper;
import com.blb.ssm.service.IRoleMenuService;
import com.blb.ssm.service.IRoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Huahao
 * @since 2020-04-21
 */
@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements IRoleService {

    @Autowired
    RoleMapper roleMapper;

    @Autowired
    IRoleMenuService iRoleMenuService;

    @Override
    public void save(Role role, String menus) {
        roleMapper.insert(role);
        List<RoleMenu> userRoles = new ArrayList<>();
        if(menus != null){
            String[] menuList = menus.split(",");
            for(String menu:menuList){
                RoleMenu roleMenu = new RoleMenu();
                roleMenu.setMenuId(menu);
                roleMenu.setRoleId(role.getId());
                userRoles.add(roleMenu);
            }

        }

        iRoleMenuService.saveBatch(userRoles);

    }
}
