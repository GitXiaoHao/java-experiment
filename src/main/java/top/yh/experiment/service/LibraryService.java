package top.yh.experiment.service;

import com.github.pagehelper.PageInfo;
import top.yh.experiment.pojo.Library;
import top.yh.experiment.utils.QueryByPage;

/**
 * @author yuhao
 * @description 针对表【library(图书表)】的数据库操作Service
 * @createDate 2023-04-12 14:26:32
 */
public interface LibraryService {
    /**
     * 分页模糊
     * @param queryByPage 分页模糊查询对象
     * @return pageInfo对象
     */
    PageInfo<Library> selectAllByPageForQuery(QueryByPage queryByPage);

    /**
     * 根据参数查询图书
     * @param library
     * @return
     */
    Library selectBookForQuery(Library library);

    /**
     * 添加图书
     * @param library
     * @return
     */
    boolean addBook(Library library);
}
