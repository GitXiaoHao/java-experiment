package top.yh.experiment.service.impl;

import top.yh.database.utils.dao.BasicDao;
import top.yh.experiment.dao.StudentDao;
import top.yh.experiment.pojo.Student;
import top.yh.experiment.service.StudentService;

import java.sql.SQLException;

/**
 * @author yuhao
 * @date 2023/4/26
 **/
public class StudentServiceImpl implements StudentService {
    private final BasicDao<Student> studentBasicDao = new StudentDao();

    @Override
    public Student getStudentByNameAndPassword(Student student)  {
        String sql = "select * from experiment.student where name = ? and  password = md5(?);";
        try {
            return studentBasicDao.querySingle(sql, Student.class, student.getName(), student.getPassword());
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public int addStudent(Student student) {
        String sql = "insert into (id,name,password)experiment.student (null,?,md5(?);";
        try {
            return studentBasicDao.update(sql,student.getName(),student.getPassword());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
}
