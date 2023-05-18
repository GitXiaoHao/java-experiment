package top.yh.experiment.web.servlet;

import top.yh.experiment.pojo.Student;
import top.yh.experiment.service.StudentService;
import top.yh.experiment.service.impl.StudentServiceImpl;
import top.yh.experiment.utils.Common;
import top.yh.experiment.utils.Result;
import top.yh.servlet.BaseServlet;
import top.yh.string.StringUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

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
        String no = request.getParameter("no");
        String gender = request.getParameter("gender");
        Student student = null;
        //连接数据库
        //判断是否为空
        if (StringUtil.isNotEmpty(name)) {
            //不为空
            //调用service 查询数据
            student = new Student(1, Optional.ofNullable(no).orElse("0"), name, Optional.ofNullable(gender).orElse("1"),Optional.ofNullable(password).orElse("123456"));
        }
        if (student != null) {
            student.setSex("男".equalsIgnoreCase(student.getSex()) ? "1" : "0");
        }
        return student;
    }

    public void login(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String code = request.getParameter("code");
        if (StringUtil.isNotEmpty(code)) {
            experimentFive(request, response, "Login");
        } else {
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
    }


    public void register(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String code = request.getParameter("code");
        if (StringUtil.isNotEmpty(code)) {
            experimentFive(request, response, "Register");
        } else {
            Student student = getStudent(request);
            if (studentService.getStudentByNameAndPassword(student) == null) {
                //注册
                studentService.addStudent(student);
                request.setAttribute("msg", "注册成功");
                //转发
                request.getRequestDispatcher("/experiment4/main.jsp").forward(request, response);
            } else {
                request.setAttribute("msg", "该用户已存在");
                //转发
                request.getRequestDispatcher("/experiment4/register.jsp").forward(request, response);
            }
        }
    }

    private void experimentFive(HttpServletRequest request, HttpServletResponse response, String type) throws IOException, ServletException {
        Student student = getStudent(request);
        //如果有值 说明需要验证验证码 ajax验证
        //先验证验证码
        String checkCodeLogin = String.valueOf(request.getSession().getAttribute("checkCode" + type));
        String loginCode = request.getParameter(type + "Code");
        if (checkCodeLogin.equalsIgnoreCase(loginCode)) {
            //相等 则验证码对
            if (studentService.getStudentByNameAndPassword(student) == null) {
                //如果不存在
                //如果是登陆
                if ("login".equalsIgnoreCase(type)) {
                    //登录
                    this.writeValue(response, Result.error("用户不存在，请注册"));
                } else {
                    //注册
                    if (studentService.addStudent(student) == 1) {
                        request.setAttribute("student", student);
                        this.writeValue(response, Result.success("注册成功"));
                    } else {
                        this.writeValue(response, Result.error("注册失败"));
                    }
                }
            } else {
                //如果存在
                //登录
                if ("login".equalsIgnoreCase(type)) {
                    request.setAttribute("student", student);
                    request.getSession().setAttribute("student",student);
                    this.writeValue(response, Result.success("登录成功"));

                } else {
                    this.writeValue(response, Result.error("用户已存在"));
                }
            }
        } else {
            this.writeValue(response, Result.error("验证码错误"));
        }
    }

    public void checkCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String code = request.getParameter("code");
        Common.getCode(request, response, code);
    }

    /**
     * 实验六
     * @param request
     * @param response
     */
    public void getStu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        List<Student> stuList = this.studentService.getStuList(name);
        //存入request
        request.getSession().removeAttribute("stuList");
        request.getSession().setAttribute("stuList",stuList);
        //转发
        request.getRequestDispatcher("../experiment6/main.jsp").forward(request,response);
        //response.sendRedirect("experiment/main.jsp");
    }
    public void delStu(HttpServletRequest request, HttpServletResponse response){
        String name = request.getParameter("name");
        this.studentService.delByName(name);
    }
    public void addStu(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Student student = this.getStudent(request);
        if(this.studentService.getStuByName(student.getName()) == null){
            //说明没有这个人
            if(this.studentService.addStudent(student) == 1){
                response.getWriter().write("添加成功");
            }else{
                response.getWriter().write("添加失败");
            }
        }else{
            response.getWriter().write("姓名重复");
        }
    }
    public void updateStu(HttpServletRequest request, HttpServletResponse response){

    }
}
