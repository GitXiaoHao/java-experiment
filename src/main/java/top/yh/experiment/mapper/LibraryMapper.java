package top.yh.experiment.mapper;

import top.yh.experiment.pojo.Library;

import java.util.List;

/**
* @author yuhao
* @description 针对表【library(图书表)】的数据库操作Mapper
* @createDate 2023-04-03 16:45:09
* @Entity top.yh.experiment.pojo.Library
*/
public interface LibraryMapper {
    /**
     * 查询所有的数据
     * @return
     */
    List<Library> selectAll();
}




