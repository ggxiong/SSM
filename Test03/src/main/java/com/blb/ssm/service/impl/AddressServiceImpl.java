package com.blb.ssm.service.impl;

import com.blb.ssm.entity.Address;
import com.blb.ssm.mapper.AddressMapper;
import com.blb.ssm.service.IAddressService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author xiaoXiong
 * @since 2020-04-27
 */
@Service
public class AddressServiceImpl extends ServiceImpl<AddressMapper, Address> implements IAddressService {

    @Autowired
    AddressMapper addressMapper;


    @Override
    public List<String> getProvince() {
        return addressMapper.getProvince();
    }

    @Override
    public List<String> getCity() {
        return addressMapper.getCity();
    }

    @Override
    public List<String> getCounty() {
        return addressMapper.getCounty();
    }

    @Override
    public List<String> getHospital() {
        return addressMapper.getHospital();
    }
}
