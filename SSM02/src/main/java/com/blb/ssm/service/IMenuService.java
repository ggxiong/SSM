package com.blb.ssm.service;

import com.blb.ssm.entity.Menu;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Huahao
 * @since 2020-04-21
 */
public interface IMenuService extends IService<Menu> {

    List<Menu> getTreeMenu(String id);

    List<Menu> getMenuByUserName(String username, String id);

}
