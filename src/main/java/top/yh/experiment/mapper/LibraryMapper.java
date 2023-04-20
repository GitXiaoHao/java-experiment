package top.yh.experiment.mapper;
import org.apache.ibatis.annotations.Param;

import top.yh.experiment.pojo.Library;
import top.yh.experiment.utils.QueryByPage;

import java.util.List;

/**
 * @author yuhao
 * @description 针对表【library(图书表)】的数据库操作Mapper
 * @createDate 2023-04-12 14:26:32
 * @Entity top.yh.experiment.pojo.Library
 */
public interface LibraryMapper {
    /**
     * 查找所有数据
     *
     * @return 返回list集合
     */
    List<Library> selectAll();

    /**
     * 根据 图书名 价格 类别 模糊查询
     * @param queryList 模糊对象
     * @return
     */
    List<Library> selectAllFuzzyQueryByNameAndByPriceAndByCategory(QueryByPage.QueryList queryList);

    /**
     * 模糊查询
     * @param library
     * @return
     */
    Library selectOneByAuthorOrCategoryOrNameOrBorrowedOrNot(Library library);

    /**
     * 添加图书
     * @param library
     * @return
     */
    int addAll(Library library);
}




