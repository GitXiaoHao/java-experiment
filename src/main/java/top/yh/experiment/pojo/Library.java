package top.yh.experiment.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * @TableName library
 */
@Data
public class Library implements Serializable {
    private Integer id;
    private String name;
    private Integer price;
    private String category;
    private String author;
    private String lImage;
    private String introduce;
    private Integer borrowedOrNot;
    private Integer whetherToPurchased;
    private Integer sales;
    private Integer borrowedQuantity;
    private Integer stock;
    private String remarks;
    private String lCode;
}