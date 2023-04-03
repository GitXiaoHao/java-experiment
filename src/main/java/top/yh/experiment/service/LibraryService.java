package top.yh.experiment.service;

import com.github.pagehelper.PageInfo;
import top.yh.experiment.pojo.Library;

/**
* @author yuhao
* @description 针对表【library(图书表)】的数据库操作Service
* @createDate 2023-04-03 16:45:09
*/
public interface LibraryService {
    /**
     * 分页查询
     * @param currentPage 当前页面
     * @param rows 一页有多少行
     * @return pageInfo的数据
     */
    PageInfo<Library> selectAllByPage(int currentPage, int rows);
}
