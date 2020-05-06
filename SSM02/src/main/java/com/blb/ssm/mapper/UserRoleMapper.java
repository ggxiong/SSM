package com.blb.ssm.mapper;

import com.blb.ssm.entity.UserRole;
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
public interface UserRoleMapper extends BaseMapper<UserRole> {

    void deleteById(String userId);

    void deleteByIds(List<String> ids);
}
