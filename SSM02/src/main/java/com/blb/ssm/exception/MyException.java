package com.blb.ssm.exception;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@ControllerAdvice
public class MyException {

    @ExceptionHandler(value = UnauthorizedException.class)
    public String UnauthorizedException(UnauthorizedException e){
        return "403";
    }

    @ExceptionHandler(value = UnknownAccountException.class)
    public String UnauthorizedException(UnknownAccountException e, RedirectAttributes model){
        model.addFlashAttribute("msg", "用户名不存在");
        return "redirect:/";
    }

    @ExceptionHandler(value = IncorrectCredentialsException.class)
    public String UnauthorizedException(IncorrectCredentialsException e, RedirectAttributes model){
        model.addFlashAttribute("msg", "密码错误");
        return "redirect:/";
    }

    @ExceptionHandler(value = LockedAccountException.class)
    public String UnauthorizedException(LockedAccountException e, RedirectAttributes model){
        model.addFlashAttribute("msg", "用户被锁定");
        return "redirect:/";
    }

    @ExceptionHandler(value = AuthenticationException.class)
    public String UnauthorizedException(AuthenticationException e, RedirectAttributes model){
        model.addFlashAttribute("msg", "登录失败");
        return "redirect:/";
    }

}
