package com.blb.ssm.controller;



import com.blb.ssm.entity.Num;
import com.blb.ssm.entity.Patient;
import com.blb.ssm.service.IAddressService;
import com.blb.ssm.service.IPatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;


import java.util.ArrayList;
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
@RequestMapping("/patient")
public class PatientController {

    @Autowired
    IPatientService iPatientService;

    @Autowired
    IAddressService iAddressService;


   @RequestMapping("index")
    public String getIndex(Map<String,Object> map){

       List<Num> numList =new ArrayList<>();

       List<String> province = iAddressService.getProvince();
       for (int i = 0; i <province.size() ; i++) {
           Integer num = iPatientService.getNum("疑是", province.get(i));
           Integer num1 = iPatientService.getNum("感染", province.get(i));
           Num num2 = new Num();
           num2.setProvinceName(province.get(i));
           num2.setDoubtNum(num.toString());
           num2.setIllNum(num1.toString());
           numList.add(num2);
       }

       map.put("numList",numList);


       return "index";
    }


    @RequestMapping("patientByProvince")
    public  String getPatient1(String quiz1,Map<String,Object> map){
        List<Patient> patientByProvince = iPatientService.getPatientByProvince(quiz1);
        map.put("patientByProvince",patientByProvince);
        return "patient1";
    }

    @RequestMapping("patientByCity")
    public  String getPatient2(String quiz1,Map<String,Object> map){
        List<Patient> patientByCity = iPatientService.getPatientByCity(quiz1);
        map.put("patientByCity",patientByCity);
        return "patient2";
    }


    @RequestMapping("patientByCounty")
    public  String getPatient3(String quiz1,Map<String,Object> map){
        List<Patient> patientByCounty = iPatientService.getPatientByCounty(quiz1);
        map.put("patientByCounty",patientByCounty);
        return "patient3";
    }


    @RequestMapping("patientByHospital")
    public  String getPatient4(String quiz1,Map<String,Object> map){
        List<Patient> patientByHospital = iPatientService.getPatientByHospital(quiz1);
        map.put("patientByHospital",patientByHospital);
        return "patient4";
    }

    @RequestMapping("add")
    public String getAdd(Patient patient,String quiz1){
        patient.setPid(quiz1);
        System.out.println(patient);
        iPatientService.save(patient);
       return "index";
    }


}

