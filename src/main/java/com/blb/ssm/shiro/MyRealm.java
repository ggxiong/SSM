package com.blb.ssm.shiro;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.blb.ssm.entity.User;
import com.blb.ssm.service.IUserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Set;
import java.util.UUID;

public class MyRealm extends AuthorizingRealm {

    @Autowired
    private IUserService userService;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        String username = (String) principalCollection.getPrimaryPrincipal();
        //角色列表
        Set<String> roles = userService.getRoles(username);
        Set<String> permision = userService.getPermision(roles);

        info.setRoles(roles);
        info.setStringPermissions(permision);

        return info;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        String name = (String) authenticationToken.getPrincipal();
        User user = userService.getOne(new QueryWrapper<User>().eq("user_name", name));
        if (user==null) {
            throw new UnknownAccountException();
        }

        ByteSource credentialsSalt = ByteSource.Util.bytes(user.getSalt());
        SimpleAuthenticationInfo simpleAuthenticationInfo =
                new SimpleAuthenticationInfo(name, user.getPassword(), credentialsSalt  , getName());
        return simpleAuthenticationInfo;
    }
}
