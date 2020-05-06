package com.blb.ssm.service.impl;

import com.blb.ssm.entity.User;
import com.blb.ssm.entity.UserRole;
import com.blb.ssm.mapper.UserMapper;
import com.blb.ssm.service.IUserRoleService;
import com.blb.ssm.service.IUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Huahao
 * @since 2020-04-21
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

    @Autowired
    UserMapper userMapper;

    @Autowired
    IUserRoleService iUserRoleService;

    @Override
    public void save(User user, String roles) {
        userMapper.insert(user);
        String[] rolesList = roles.split(",");
        List<UserRole> userRoles = new ArrayList<>();
        for (String role:rolesList){
            UserRole userRole = new UserRole();
            userRole.setRoleId(role);
            userRole.setUserId(user.getId());
            userRoles.add(userRole);
        }
        iUserRoleService.saveBatch(userRoles);

    }

    @Override
    public Set<String> getRoles(String username) {
        return userMapper.getRoles(username);
    }

    @Override
    public Set<String> getPermision(Set<String> roles) {
        return userMapper.getPermision(roles);
    }


}
