package top.yh.experiment.web.servlet;

import com.mysql.jdbc.Driver;
import top.yh.experiment.pojo.Student;
import top.yh.servlet.BaseServlet;
import top.yh.string.StringUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ResourceBundle;

/**
 * @author yuhao
 * @date 2023/4/21
 **/
@WebServlet("/student/*")
public class StudentServlet extends BaseServlet {
    public void login(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        //连接数据库
        //判断是否为空
        if (StringUtil.isNotEmpty(name) && StringUtil.isNotEmpty(password)) {
            String sql = "select * from experiment.student where name = ? and  password = ?;";
            //不为空
            Driver driver = new Driver();
            DriverManager.deregisterDriver(driver);
            ResourceBundle bundle = ResourceBundle.getBundle("jdbc.properties");
            Connection connection = DriverManager.getConnection(bundle.getString("url"), bundle.getString("username"), bundle.getString("password"));
            PreparedStatement preparedStatement = connection.prepareStatement(sql, new String[]{name, password});
            ResultSet resultSet = preparedStatement.executeQuery();
            Student student = null;
            while (resultSet.next()) {
                int id = resultSet.getInt(1);
                name = resultSet.getString(2);
                password = resultSet.getString(3);
                student = new Student(id, name, password);
                //存入request
                request.getSession().setAttribute("student",student);
                //转发
                request.getRequestDispatcher("/experiment4/success.jsp").forward(request,response);
            }
            //转发
            request.getRequestDispatcher("/experiment4/error.jsp").forward(request,response);
        }
    }
}
