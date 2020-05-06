package com.blb.ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class WelComeController {

    @GetMapping("")
    public String welcome(){
        return "login";
    }

    /**
     * 通用跳转
     * @param m
     * @param p
     * @return
     */
    @GetMapping("{m}/{p}Page")
    public String page(@PathVariable String m, @PathVariable String p){
        return m + "/" + p;
    }

    /*@PostMapping("index")
    public String index(){
        return "index";
    }*/
}
