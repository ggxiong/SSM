package com.blb.ssm.mapper;

import com.blb.ssm.entity.Address;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;


/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author xiaoXiong
 * @since 2020-04-27
 */
public interface AddressMapper extends BaseMapper<Address> {

    List<String> getProvince();

    List<String> getCity();

    List<String> getCounty();

    List<String> getHospital();

}
