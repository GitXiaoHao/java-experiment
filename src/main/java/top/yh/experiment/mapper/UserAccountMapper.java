package top.yh.experiment.mapper;
import java.util.List;
import org.apache.ibatis.annotations.Param;

import top.yh.experiment.pojo.UserAccount;

/**
* @author yuhao
* @description 针对表【user_account(用户表)】的数据库操作Mapper
* @createDate 2023-03-22 16:58:41
* @Entity top.yh.experiment.pojo.UserAccount
*/
public interface UserAccountMapper {
    /**
     *
     * 通过用户名进行查找
     * @param username 用户名
     * @return 返回一个用户
     */
    UserAccount getOneByUsername(@Param("username") String username);

    /**
     * 加入用户
     * @param userAccount 用户
     * @return 执行的行数
     */
    int addAll(UserAccount userAccount);

    /**
     * 根据用户名和密码获取用户信息
     * @param username 用户名
     * @param password 密码
     * @return 返回用户信息
     */

    UserAccount getOneByUsernameAndPassword(@Param("username") String username, @Param("password") String password);
}




