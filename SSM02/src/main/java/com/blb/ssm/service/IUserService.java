package com.blb.ssm.service;

import com.blb.ssm.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Set;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Huahao
 * @since 2020-04-21
 */
public interface IUserService extends IService<User> {

    void save(User user,String roles);

    Set<String> getRoles(String username);

    Set<String> getPermision(Set<String> roles);

}
