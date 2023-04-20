package top.yh.experiment.pojo;

import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * @TableName book_category
 */

@Data
public class BookCategory implements Serializable {
    private Integer bId;
    private String name;
}