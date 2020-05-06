package com.blb.ssm.service.impl;

import com.blb.ssm.entity.UserRole;
import com.blb.ssm.mapper.UserRoleMapper;
import com.blb.ssm.service.IUserRoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Huahao
 * @since 2020-04-24
 */
@Service
public class UserRoleServiceImpl extends ServiceImpl<UserRoleMapper, UserRole> implements IUserRoleService {

    @Autowired
    UserRoleMapper userRoleMapper;

    @Override
    public void deleteById(String userId) {
        userRoleMapper.deleteById(userId);
    }

    @Override
    public void deleteByIds(List<String> ids) {
        userRoleMapper.deleteByIds(ids);
    }
}
