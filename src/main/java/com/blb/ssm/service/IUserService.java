package com.blb.ssm.service;

import com.blb.ssm.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;
import java.util.Set;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Huahao
 * @since 2020-04-17
 */
public interface IUserService extends IService<User> {

    /**
     * 根据用户名查询角色
     * @param username
     * @return
     */
    Set<String> getRoles(String username);

    /**
     * 根据角色查询权限列表
     * @param roles
     * @return
     */
    Set<String> getPermision(Set<String> roles);
}
