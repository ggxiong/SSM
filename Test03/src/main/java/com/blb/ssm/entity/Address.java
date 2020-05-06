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
@TableName("t_address")
public class Address extends Model<Address> {

    private static final long serialVersionUID=1L;

    private Integer id;

    private String province;

    private String city;

    private String county;

    private String hospital;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
