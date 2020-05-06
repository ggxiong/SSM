package com.blb.ssm.service.impl;

import com.blb.ssm.entity.RoleMenu;
import com.blb.ssm.mapper.RoleMenuMapper;
import com.blb.ssm.service.IRoleMenuService;
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
public class RoleMenuServiceImpl extends ServiceImpl<RoleMenuMapper, RoleMenu> implements IRoleMenuService {

    @Autowired
    RoleMenuMapper roleMenuMapper;

    @Override
    public void deleteById(String roleId) {

        roleMenuMapper.deleteById(roleId);
    }

    @Override
    public void deleteByIds(List<String> ids) {
        roleMenuMapper.deleteByIds(ids);
    }
}
