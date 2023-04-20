package top.yh.experiment.mapper;
import org.apache.ibatis.annotations.Param;

import top.yh.experiment.pojo.BookCategory;

import java.util.List;

/**
 * @author yuhao
 * @description 针对表【book_category(图书类别表)】的数据库操作Mapper
 * @createDate 2023-04-14 08:21:09
 * @Entity top.yh.experiment.pojo.BookCategory
 */
public interface BookCategoryMapper {
    /**
     * 查询全部类型
     * @return
     */
    List<BookCategory> selectAll();

    /**
     * 根据名字查询
     * @param name
     * @return
     */
    BookCategory selectOneByName(@Param("name") String name);

    /**
     * 添加
     * @param bookCategory
     * @return
     */
    int insertAll(BookCategory bookCategory);
}




