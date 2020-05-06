package com.blb.ssm.service;

import com.blb.ssm.entity.RoleMenu;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Huahao
 * @since 2020-04-24
 */
public interface IRoleMenuService extends IService<RoleMenu> {

    void deleteById(String roleId);

    void deleteByIds(List<String> ids);

}
