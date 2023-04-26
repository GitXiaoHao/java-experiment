package top.yh.experiment.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.io.Serializable;

/**
 * 学生表
 *
 * @TableName student
 */
@Data
@AllArgsConstructor
public class Student implements Serializable {

    /**
     * 主键
     */
    private Integer id;
    /**
     * 姓名
     */
    private String name;
    /**
     * 密码
     */
    private String password;

}
