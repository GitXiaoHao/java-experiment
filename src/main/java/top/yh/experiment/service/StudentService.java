package top.yh.experiment.service;

import top.yh.experiment.pojo.Student;

import java.sql.SQLException;

/**
 * @author yuhao
 * @date 2023/4/26
 **/
public interface StudentService {
    /**
     * 通过名字和密码获取学生信息
     * @param student 学生对象
     * @return 如果查到了就返回对象 没有就返回null
     */
    Student getStudentByNameAndPassword(Student student) ;

    /**
     * 加入信息
     * @param student
     */
    int addStudent(Student student);
}
