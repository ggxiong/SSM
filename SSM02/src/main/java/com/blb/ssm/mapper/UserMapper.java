package com.blb.ssm.mapper;

import com.blb.ssm.entity.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.Set;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Huahao
 * @since 2020-04-21
 */
public interface UserMapper extends BaseMapper<User> {

    Set<String> getRoles(String username);

    Set<String> getPermision(Set<String> roles);

}
