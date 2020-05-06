package com.blb.ssm.mapper;

import com.blb.ssm.entity.RoleMenu;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Huahao
 * @since 2020-04-24
 */
public interface RoleMenuMapper extends BaseMapper<RoleMenu> {

    void deleteById(String roleId);

    void deleteByIds(List<String> ids);

}
