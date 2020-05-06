package com.blb.ssm.mapper;

import com.blb.ssm.entity.Patient;
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
public interface PatientMapper extends BaseMapper<Patient> {

    Integer getNum(String type,String province);

    List<Patient> getPatientByProvince(String provinceName);

    List<Patient> getPatientByCity(String cityName);

    List<Patient> getPatientByCounty(String countyName);

    List<Patient> getPatientByHospital(String hospitalName);


}
