package top.yh.experiment.utils;

import lombok.Getter;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 * @author yuhao
 * @date 2023/3/22
 **/
@Getter
public class Result <T> implements Serializable {

    /**编码：1成功，0和其它数字为失败*/
    private Integer code;
    /**错误信息*/
    private String msg;
    /**数据*/
    private T data;
    /**动态数据*/
    private Map<Object,Object> map = new HashMap<>();

    public static <T> Result<T> success(T object) {
        Result<T> r = new Result<>();
        r.data = object;
        r.code = 1;
        return r;
    }

    public static <T> Result<T> error(String msg) {
        Result r = new Result();
        r.msg = msg;
        r.code = 0;
        return r;
    }

    public Result<T> add(String key, Object value) {
        this.map.put(key, value);
        return this;
    }
}
