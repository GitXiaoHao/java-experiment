package top.yh.experiment.web.servlet;

import com.github.pagehelper.PageInfo;
import top.yh.experiment.pojo.BookCategory;
import top.yh.experiment.pojo.Library;
import top.yh.experiment.pojo.UserAccount;
import top.yh.experiment.service.BookCategoryService;
import top.yh.experiment.service.LibraryService;
import top.yh.experiment.service.impl.BookCategoryServiceImpl;
import top.yh.experiment.service.impl.LibraryServiceImpl;
import top.yh.experiment.utils.Common;
import top.yh.experiment.utils.QueryByPage;
import top.yh.experiment.utils.Result;
import top.yh.servlet.BaseServlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

/**
 * @author yuhao
 * @date 2023/4/3
 **/
@WebServlet("/library/*")
public class LibraryServlet extends BaseServlet {
    private final LibraryService libraryService = new LibraryServiceImpl();
    private final BookCategoryService bookCategoryService = new BookCategoryServiceImpl();

    /**
     * 进入图书馆
     *
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
        request.setAttribute("rows", rows);
        request.setAttribute("currentPage", currentPage);
        //转发
        request.getRequestDispatcher("/findLibraryByPage").forward(request, response);
    }

    /**
     * 分页找图书
     *
     * @param request
     * @param response
     * @throws IOException
     * @throws InvocationTargetException
     * @throws IllegalAccessException
     * @throws ServletException
     */
    public void findLibraryByPage(HttpServletRequest request, HttpServletResponse response) throws IOException, InvocationTargetException, IllegalAccessException, ServletException {
        //获取参数
        QueryByPage queryByPage = this.getParam(request, QueryByPage.class);
        if (queryByPage.getCurrentPage() <= 0) {
            queryByPage.setCurrentPage(1);
        }
        if (queryByPage.getRows() <= 0) {
            queryByPage.setRows(5);
        }
        //调用服务层
        PageInfo<Library> page = libraryService.selectAllByPageForQuery(queryByPage);
        //存入request
        request.setAttribute("pageInfo", page);
        //转发
        this.writeValue(response, Result.success(page));
        //转发
        request.getRequestDispatcher("/experiment3/main.jsp").forward(request,response);
    }

    /**
     * 寻找图书分类
     *
     * @param request
     * @param response
     */
    public void findLibraryCategory(HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<BookCategory> allCategory = bookCategoryService.getAllCategory();
        if (allCategory.isEmpty()) {
            this.writeValue(response, Result.error("类别为空"));
        } else {
            this.writeValue(response, (Result.success(allCategory)));
        }
    }

    /**
     * 添加分类
     * @param request
     * @param response
     */
    public void addBookCategory(HttpServletRequest request,HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        //先查询
        BookCategory oneByName = this.bookCategoryService.getOneByName(name);
        if (oneByName != null) {
            this.writeValue(response, Result.error("已有此图书分类"));
        }else{
            BookCategory bookCategory = new BookCategory();
            bookCategory.setName(name);
            if(this.bookCategoryService.save(bookCategory) == 1){
                this.writeValue(response,Result.success(bookCategory));
            }else{
                this.writeValue(response,Result.error("添加失败"));
            }
        }
    }
    /**
     * 添加图书
     *
     * @param request
     * @param response
     */
    public void addBook(HttpServletRequest request, HttpServletResponse response) throws IOException {
        //获取
        Library library = this.getParam(request, Library.class);
        //判断是否有同一本书
        Library bookByQuery = this.getBookByQuery(library);
        if (bookByQuery != null) {
            this.writeValue(response, Result.error("已有此书"));
        } else {
            //已借数量
            library.setBorrowedOrNot(0);
            library.setWhetherToPurchased(0);
            library.setSales(0);
            library.setBorrowedQuantity(0);
            //code
            library.setLCode(UUID.randomUUID().toString().substring(0, 32));
            //添加图书
            if (this.libraryService.addBook(library)) {
                this.writeValue(response, Result.success(library));
            } else {
                this.writeValue(response, Result.error("添加失败"));
            }
        }
    }

    public Library getBookByQuery(Library library) {
        return this.libraryService.selectBookForQuery(library);
    }
}
