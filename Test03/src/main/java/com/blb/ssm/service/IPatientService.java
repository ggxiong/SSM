package com.blb.ssm.service;

import com.blb.ssm.entity.Patient;
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
public interface IPatientService extends IService<Patient> {

    Integer getNum(String type,String province);

    List<Patient> getPatientByProvince(String provinceName);

    List<Patient> getPatientByCity(String cityName);

    List<Patient> getPatientByCounty(String countyName);

    List<Patient> getPatientByHospital(String hospitalName);
}
