package top.yh.experiment.service.impl;


import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import top.yh.database.utils.MyBatisUtil;
import top.yh.experiment.mapper.LibraryMapper;
import top.yh.experiment.pojo.Library;
import top.yh.experiment.service.LibraryService;

import java.util.List;


/**
 * @author yuhao
 * @description 针对表【library(图书表)】的数据库操作Service实现
 * @createDate 2023-04-03 16:45:09
 */

public class LibraryServiceImpl
        implements LibraryService {
    private final LibraryMapper libraryMapper = MyBatisUtil.SESSION.getMapper(LibraryMapper.class);
    @Override
    public PageInfo<Library> selectAllByPage(int currentPage, int rows) {
        PageHelper.startPage(currentPage,rows);
        List<Library> libraryList = libraryMapper.selectAll();
        return new PageInfo<>(libraryList,rows);
    }
}




