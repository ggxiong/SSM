package com.blb.ssm.controller;


import com.blb.ssm.entity.Address;
import com.blb.ssm.service.IAddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author xiaoXiong
 * @since 2020-04-27
 */
@Controller
@RequestMapping("/address")
public class AddressController {

    @Autowired
    IAddressService iAddressService;

    @RequestMapping("province")
    public String getProvince( Map<String,Object> map){
        List<String> province = iAddressService.getProvince();
        map.put("province",province);
        return "province";
    }

    @RequestMapping("city")
    public String getCity( Map<String,Object> map){
        List<String> city = iAddressService.getCity();
        map.put("city",city);
        return "city";
    }

    @RequestMapping("county")
    public String getCounty( Map<String,Object> map){
        List<String> county = iAddressService.getCounty();
        map.put("county",county);
        return "county";
    }

    @RequestMapping("hospital")
    public String getHospital( Map<String,Object> map){
        List<String> hospital = iAddressService.getHospital();
        map.put("hospital",hospital);
        return "hospital";
    }


    @RequestMapping("addList")
    public String getAddList(Map<String,Object> map){
        List<Address> list = iAddressService.list();
        map.put("list",list);
        return "add";
    }


}

