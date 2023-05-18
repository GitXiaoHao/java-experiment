package top.yh.experiment.dao;

import top.yh.experiment.pojo.Student;
import top.yh.string.StringUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @author yuhao
 * @date 2023/5/12
 **/
public class StuDao {
    private static final Connection connection ;
    static {
        try {
            connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/experiment?allowPublicKeyRetrieval=true&useSSL=false&characterEncoding=utf-8&serverTimezone=UTC",
                    "root",
                    "yu123456");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Student> selectStuList(String stuName) throws SQLException {
        String sql;
        PreparedStatement statement;
        if (StringUtil.isNotEmpty(stuName)) {
            sql = "select * from student where name like concat('%',?,'%');";
            statement = connection.prepareStatement(sql);
            statement.setString(1,stuName);
        }else{
            sql = "select * from student;";
            statement = connection.prepareStatement(sql);
        }
        ResultSet resultSet = statement.executeQuery();
        List<Student> list = new ArrayList<>();
        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String no = resultSet.getString("no");
            String name = resultSet.getString("name");
            String sex = resultSet.getString("sex");
            list.add(new Student(id,no,name,sex,"111"));
        }
        return list;
    }
    public void addStu(Student student) throws SQLException {
        connection.setAutoCommit(false);
        String sql = "insert into experiment.student (id, no, name, sex,password) value (null,?,?,?,md5(?));";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1,student.getNo());
        preparedStatement.setString(2,student.getName());
        preparedStatement.setString(3,student.getSex());
        preparedStatement.setString(4,student.getPassword());
        preparedStatement.addBatch();
        preparedStatement.executeBatch();
        connection.commit();
    }
    public Student getStudentByNameAndPassword(Student student) throws SQLException {

        String sql = "select * from experiment.student where name = ? and  password = md5(?);";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1,student.getName());
        preparedStatement.setString(2,student.getPassword());
        ResultSet resultSet = preparedStatement.executeQuery();
        return getStu(resultSet);
    }

    public void deleteByName(String name) throws SQLException {
        connection.setAutoCommit(false);
        String sql = "delete from student where name = (?);";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1,name);
        int i = preparedStatement.executeUpdate();
        if (i == 1) {
            connection.commit();
        }
    }

    public Student selectStudentByName(String name) throws SQLException {
        String sql = "select * from student where name = ?";
        PreparedStatement s = connection.prepareStatement(sql);
        s.setString(1,name);
        ResultSet resultSet = s.executeQuery();
        return getStu(resultSet);
    }
    private static Student getStu(ResultSet resultSet) throws SQLException {
        Student studentNow = null;
        while (resultSet.next()) {
            int id = resultSet.getInt("id");
            String no = resultSet.getString("no");
            String name = resultSet.getString("name");
            String sex = resultSet.getString("sex");
            String password = resultSet.getString("password");
            studentNow = new Student(id,no,name,sex,password);
        }
        return studentNow;
    }
}
