package top.yh.experiment.web.servlet;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import top.yh.experiment.pojo.Library;
import top.yh.experiment.pojo.UserAccount;
import top.yh.experiment.service.LibraryService;
import top.yh.experiment.service.impl.LibraryServiceImpl;
import top.yh.experiment.utils.Result;
import top.yh.servlet.BaseServlet;
import top.yh.string.StringUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

/**
 * @author yuhao
 * @date 2023/4/3
 **/
@WebServlet("/library/*")
public class LibraryServlet extends BaseServlet {
    private final LibraryService libraryService = new LibraryServiceImpl();
    /**
     * 进入图书馆
     * @param request
     * @param response
     * @throws IOException
     * @throws InvocationTargetException
     * @throws IllegalAccessException
     */
    public void intoLibrary(HttpServletRequest request, HttpServletResponse response) throws IOException, InvocationTargetException, IllegalAccessException, ServletException {
        //设置rows 和 currentPage
        int rows = 5;
        int currentPage = 1;
        //存储
        request.setAttribute("rows",rows);
        request.setAttribute("currentPage",currentPage);
        //转发
        request.getRequestDispatcher("/findLibraryByPage").forward(request,response);
    }
    public void findLibraryByPage(HttpServletRequest request, HttpServletResponse response) throws IOException, InvocationTargetException, IllegalAccessException, ServletException {
        //获取参数
        //当前页码
        String currentPage = request.getParameter("currentPage");
        //每页显示条数
        String rows = request.getParameter("rows");
        if (StringUtil.isEmpty(currentPage)) {
            currentPage = "1";
        }
        if(StringUtil.isEmpty(rows)){
            rows = "5";
        }
        //调用服务层
        PageInfo<Library> page = libraryService.selectAllByPage(Integer.parseInt(currentPage), Integer.parseInt(rows));
        //存入request
        request.setAttribute("pageInfo",page);
        //转发
        request.getRequestDispatcher("/experiment/main.jsp").forward(request,response);
    }
}
