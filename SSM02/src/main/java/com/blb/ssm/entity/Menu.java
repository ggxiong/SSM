package com.blb.ssm.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import java.io.Serializable;
import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author Huahao
 * @since 2020-04-21
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("t_menu")
public class Menu extends Model<Menu> {

    private static final long serialVersionUID=1L;

    private String id;

    private String pid;

    private String menuName;

    private String permission;

    private String type;

    private String icon;

    private String url;

    @TableField(exist = false)//默认
    private List<Menu> children;


    @Override
    protected Serializable pkVal() {
        return this.id;
    }

}
