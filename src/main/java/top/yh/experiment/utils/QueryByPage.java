package top.yh.experiment.utils;

import lombok.Data;

import java.io.Serializable;

/**
 * @author yuhao
 * @date 2023/4/14
 * 分页模糊查询的类
 **/
@Data
public class QueryByPage implements Serializable {
    private Integer currentPage;
    private Integer rows;
    private QueryList queryList;
    @Data
    public static class QueryList implements Serializable{
        private String queryName;
        private String queryPrice;
        private String queryCategory;
    }
}
