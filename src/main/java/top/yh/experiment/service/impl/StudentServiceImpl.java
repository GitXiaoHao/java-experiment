package top.yh.experiment.service.impl;

import top.yh.database.utils.dao.BasicDao;
import top.yh.experiment.dao.StuDao;
import top.yh.experiment.dao.StudentDao;
import top.yh.experiment.pojo.Student;
import top.yh.experiment.service.StudentService;
import top.yh.string.StringUtil;

import java.sql.SQLException;
import java.util.List;

/**
 * @author yuhao
 * @date 2023/4/26
 **/
public class StudentServiceImpl implements StudentService {
    private final BasicDao<Student> studentBasicDao = new StudentDao();
    private final StuDao stuDao = new StuDao();


    @Override
    public Student getStudentByNameAndPassword(Student student)  {
        if (student == null) {
            return null;
        }
        try {
            return stuDao.getStudentByNameAndPassword(student);
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public int addStudent(Student student) {
        //String sql = "insert into experiment.student (id, name, password) value (null,?,md5(?));";
        //try {
        //    return studentBasicDao.update(sql,student.getName(),student.getPassword());
        //} catch (SQLException e) {
        //    e.printStackTrace();
        //}
        try {
            stuDao.addStu(student);
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
        return 1;
    }

    @Override
    public List<Student> getStuList(String name) {
        try {
            if(StringUtil.isEmpty(name)){
                name = "";
            }
            return this.stuDao.selectStuList(name);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void delByName(String name) {
        if (name == null) {
            return;
        }
        try {
            this.stuDao.deleteByName(name);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Student getStuByName(String name) {
        if(name != null){
            try {
                return this.stuDao.selectStudentByName(name);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }
}
