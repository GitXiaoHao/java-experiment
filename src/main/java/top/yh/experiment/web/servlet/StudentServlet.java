package top.yh.experiment.web.servlet;

import top.yh.experiment.pojo.Student;
import top.yh.experiment.service.StudentService;
import top.yh.experiment.service.impl.StudentServiceImpl;
import top.yh.servlet.BaseServlet;
import top.yh.string.StringUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * @author yuhao
 * @date 2023/4/21
 **/
@WebServlet("/student/*")
public class StudentServlet extends BaseServlet {
    private final StudentService studentService = new StudentServiceImpl();

    private Student getStudent(HttpServletRequest request) {
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        Student student = null;
        //连接数据库
        //判断是否为空
        if (StringUtil.isNotEmpty(name) && StringUtil.isNotEmpty(password)) {
            //不为空
            //调用service 查询数据
            student = new Student(1, name, password);
        }
        return student;
    }

    public void login(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        Student student = getStudent(request);
        student = studentService.getStudentByNameAndPassword(student);
        if (student == null) {
            request.setAttribute("msg", "没有该用户");
            //转发
            request.getRequestDispatcher("/experiment4/main.jsp").forward(request, response);
        } else {
            //存入request
            request.getSession().setAttribute("student", student);
            //转发
            request.getRequestDispatcher("/experiment4/success.jsp").forward(request, response);
        }
    }


    public void register(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        Student student = getStudent(request);
        if (studentService.getStudentByNameAndPassword(student) == null) {
            //注册
            studentService.addStudent(student);
            request.setAttribute("msg", "没有该用户");
            //转发
            request.getRequestDispatcher("/experiment4/main.jsp").forward(request, response);
        } else {
            request.setAttribute("msg", "该用户已存在");
            //转发
            request.getRequestDispatcher("/experiment4/register.jsp").forward(request, response);
        }
    }
}
