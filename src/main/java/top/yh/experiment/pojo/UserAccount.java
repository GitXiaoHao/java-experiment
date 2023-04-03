package top.yh.experiment.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * 用户表
 *
 * @TableName user_account
 */
@Data
public class UserAccount implements Serializable {
    /**
     * 主键
     */

    private Integer id;

    /**
     * 用户名
     */
    private String username;

    /**
     * 密码
     */
    private String password;

    /**
     * 真实用户名
     */
    private String name;

    /**
     * 电话
     */
    private String phone;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 唯一代码
     */
    private String code;

    /**
     * 是否激活 1为激活 0为未激活
     */
    private Integer isStatus;


}