package top.yh.experiment.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 学生表
 *
 * @TableName student
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Student implements Serializable {

    /**
     * 主键
     */
    private Integer id;
    private String no;
    /**
     * 姓名
     */
    private String name;
    private String sex;
    /**
     * 密码
     */
    private String password;

}
