package com.blb.ssm.service;

import com.blb.ssm.entity.Role;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Huahao
 * @since 2020-04-21
 */
public interface IRoleService extends IService<Role> {

    void save(Role role,String menus);

}
