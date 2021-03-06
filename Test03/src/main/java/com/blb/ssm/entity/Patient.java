package com.blb.ssm.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author xiaoXiong
 * @since 2020-04-27
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("t_patient")
public class Patient extends Model<Patient> {

    private static final long serialVersionUID=1L;

    private Integer id;

    private String name;

    private String age;

    private String type;

    private String symptom;

    private String pid;

    private Address address;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
