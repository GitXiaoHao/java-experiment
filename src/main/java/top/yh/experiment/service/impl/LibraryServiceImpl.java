package top.yh.experiment.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import top.yh.database.utils.MyBatisUtil;
import top.yh.experiment.mapper.LibraryMapper;
import top.yh.experiment.pojo.Library;
import top.yh.experiment.service.LibraryService;
import top.yh.experiment.utils.QueryByPage;
import top.yh.experiment.utils.Result;

import java.util.List;

/**
 * @author yuhao
 * @description 针对表【library(图书表)】的数据库操作Service实现
 * @createDate 2023-04-12 14:26:32
 */
public class LibraryServiceImpl
        implements LibraryService {
    private final LibraryMapper libraryMapper = MyBatisUtil.SESSION.getMapper(LibraryMapper.class);

    @Override
    public PageInfo<Library> selectAllByPageForQuery(QueryByPage queryByPage) {
        PageHelper.startPage(queryByPage.getCurrentPage(), queryByPage.getRows());
        List<Library> libraryList = libraryMapper.selectAllFuzzyQueryByNameAndByPriceAndByCategory(queryByPage.getQueryList());
        return new PageInfo<>(libraryList, queryByPage.getRows());
    }

    @Override
    public Library selectBookForQuery(Library library) {
        return this.libraryMapper.selectOneByAuthorOrCategoryOrNameOrBorrowedOrNot(library);
    }

    @Override
    public boolean addBook(Library library) {
        if(this.libraryMapper.addAll(library) == 1){
            MyBatisUtil.submitSession();
            return true;
        }
        return false;
    }
}




