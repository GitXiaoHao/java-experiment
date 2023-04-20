package top.yh.experiment.service;

import top.yh.experiment.pojo.BookCategory;
import top.yh.experiment.pojo.Library;

import java.util.List;

/**
 * @author yuhao
 * @description 针对表【book_category(图书类别表)】的数据库操作Service
 * @createDate 2023-04-14 08:21:09
 */
public interface BookCategoryService {
    /**
     * 获取所有图书分类
     *
     * @return
     */
    List<BookCategory> getAllCategory();

    /**
     * 根据名字查询
     * @param name
     * @return
     */
    BookCategory getOneByName(String name);

    /**
     * 添加
     * @param bookCategory
     * @return
     */
    int save(BookCategory bookCategory);
}
