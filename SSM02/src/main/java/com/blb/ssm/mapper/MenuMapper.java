package com.blb.ssm.mapper;

import com.blb.ssm.entity.Menu;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Huahao
 * @since 2020-04-21
 */
public interface MenuMapper extends BaseMapper<Menu> {

    List<Menu> getTreeMenu(String id);

    List<Menu> getMenuByUserName(@Param("username") String username, @Param("id") String id);
}
