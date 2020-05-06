package com.blb.ssm.service.impl;

import com.blb.ssm.entity.Patient;
import com.blb.ssm.mapper.PatientMapper;
import com.blb.ssm.service.IPatientService;
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
public class PatientServiceImpl extends ServiceImpl<PatientMapper, Patient> implements IPatientService {

    @Autowired
    PatientMapper patientMapper;


    @Override
    public Integer getNum(String type, String province) {
        return patientMapper.getNum(type,province);
    }

    @Override
    public List<Patient> getPatientByProvince(String provinceName) {
        return patientMapper.getPatientByProvince(provinceName);
    }

    @Override
    public List<Patient> getPatientByCity(String cityName) {
        return patientMapper.getPatientByCity(cityName);
    }

    @Override
    public List<Patient> getPatientByCounty(String countyName) {
        return patientMapper.getPatientByCounty(countyName);
    }

    @Override
    public List<Patient> getPatientByHospital(String hospitalName) {
        return patientMapper.getPatientByHospital(hospitalName);
    }
}
