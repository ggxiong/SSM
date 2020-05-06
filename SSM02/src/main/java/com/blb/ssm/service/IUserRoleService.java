package com.blb.ssm.service;

import com.blb.ssm.entity.UserRole;
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
public interface IUserRoleService extends IService<UserRole> {

    void deleteById(String userId);

    void deleteByIds(List<String> ids);

}
