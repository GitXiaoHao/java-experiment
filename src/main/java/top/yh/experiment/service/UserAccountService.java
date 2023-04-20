package top.yh.experiment.service;

import top.yh.experiment.pojo.UserAccount;
import top.yh.experiment.utils.Result;

/**
* @author yuhao
* @description 针对表【user_account(用户表)】的数据库操作Service
* @createDate 2023-03-22 16:58:41
*/
public interface UserAccountService {
    /**
     * 发送邮箱
     * @param code 发送的验证码
     * @param email 要发送给的邮箱
     * @return 发送成功返回true
     */
    Result sendEmail(String code, String email);

    /**
     * 注册用户
     * @param userAccount 用户的对象
     * @return 注册成功就返回code 1
     */
    Result saveUserAccount(UserAccount userAccount);

    /**
     * 查找所有用户信息
     * @return
     */
    Result getAllUserAccount();

    /**
     * 获取用户
     * @param userAccount 指定的用户
     * @return 如果有就 code 1
     */
    Result getUserAccount(UserAccount userAccount);
}
