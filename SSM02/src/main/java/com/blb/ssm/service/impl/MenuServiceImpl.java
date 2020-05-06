package com.blb.ssm.service.impl;

import com.blb.ssm.entity.Menu;
import com.blb.ssm.mapper.MenuMapper;
import com.blb.ssm.service.IMenuService;
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
 * @since 2020-04-21
 */
@Service
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu> implements IMenuService {

    @Autowired
    MenuMapper menuMapper;

    @Override
    public List<Menu> getTreeMenu(String id) {
        return menuMapper.getTreeMenu(id);
    }

    @Override
    public List<Menu> getMenuByUserName(String username, String id) {
        return menuMapper.getMenuByUserName(username,id);
    }
}
