package top.yh.experiment.service.impl;

import top.yh.database.utils.mybatis.MyBatisUtil;
import top.yh.experiment.mapper.BookCategoryMapper;
import top.yh.experiment.pojo.BookCategory;
import top.yh.experiment.pojo.Library;
import top.yh.experiment.service.BookCategoryService;

import java.util.List;

/**
 * @author yuhao
 * @description 针对表【book_category(图书类别表)】的数据库操作Service实现
 * @createDate 2023-04-14 08:21:09
 */

public class BookCategoryServiceImpl
        implements BookCategoryService {
    private final BookCategoryMapper bookCategoryMapper = MyBatisUtil.SESSION.getMapper(BookCategoryMapper.class);
    @Override
    public List<BookCategory> getAllCategory() {
        return bookCategoryMapper.selectAll();
    }

    @Override
    public BookCategory getOneByName(String name) {
        return this.bookCategoryMapper.selectOneByName(name);
    }

    @Override
    public int save(BookCategory bookCategory) {
        if (this.bookCategoryMapper.insertAll(bookCategory) == 1){
            MyBatisUtil.submitSession();
            return 1;
        }
        return 0;
    }
}




