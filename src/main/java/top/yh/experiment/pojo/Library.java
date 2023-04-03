package top.yh.experiment.pojo;


import java.io.Serializable;
import lombok.Data;

/**
 * 图书表
 * @TableName library
 */
@Data
public class Library implements Serializable {
    /**
     * 主键
     */
    private Integer id;

    /**
     * 图书名
     */
    private String name;

    /**
     * 价格
     */
    private Integer price;

    /**
     * 类别
     */
    private String category;

    /**
     * 作者
     */
    private String author;

    /**
     * 是否被借阅 1:被借阅 0:无借阅
     */
    private Integer borrowedOrNot;

    /**
     * 是否被购买 1:被购买 0:没有被购买
     */
    private Integer whetherToPurchased;

    /**
     * 备注
     */
    private String remarks;
}