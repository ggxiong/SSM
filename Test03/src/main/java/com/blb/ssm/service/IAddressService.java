package com.blb.ssm.service;

import com.blb.ssm.entity.Address;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;


/**
 * <p>
 *  服务类
 * </p>
 *
 * @author xiaoXiong
 * @since 2020-04-27
 */
public interface IAddressService extends IService<Address> {

    List<String> getProvince();

    List<String> getCity();

    List<String> getCounty();

    List<String> getHospital();
}
