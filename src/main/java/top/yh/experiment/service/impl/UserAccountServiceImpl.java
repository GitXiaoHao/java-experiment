package top.yh.experiment.service.impl;

import cn.hutool.crypto.digest.MD5;
import top.yh.database.utils.Md5Util;
import top.yh.database.utils.MyBatisUtil;
import top.yh.email.utils.SendEmailUtil;
import top.yh.experiment.mapper.UserAccountMapper;
import top.yh.experiment.pojo.UserAccount;
import top.yh.experiment.service.UserAccountService;
import top.yh.experiment.utils.Result;

import java.util.UUID;

/**
* @author yuhao
* @description 针对表【user_account(用户表)】的数据库操作Service实现
* @createDate 2023-03-22 16:58:41
*/
public class UserAccountServiceImpl implements UserAccountService{
    private final UserAccountMapper userAccountMapper = MyBatisUtil.SESSION.getMapper(UserAccountMapper.class);
    @Override
    public Result sendEmail(String code, String email) {
        //激活邮件发送
        String content = "注册验证码为：" + code;
        //发送邮件
        Boolean ifSend = SendEmailUtil.sendEmailForQq(email, content, "web激活邮件", "2486245007", "cstclteazgvbeajj");
        return ifSend ? Result.success("发送成功") : Result.error("邮箱错误，发送失败");
    }

    @Override
    public Result saveUserAccount(UserAccount userAccount) {
        //判断是否有相同的用户名
        UserAccount userAccountByUsername = userAccountMapper.getOneByUsername(userAccount.getUsername());
        if (userAccountByUsername != null) {
            //如果有相同的用户名
            return Result.error("用户名重复");
        }
        //如果没有重复
        //md5加密
        userAccount.setPassword(Md5Util.md5(userAccount.getPassword()));
        //uuid
        userAccount.setCode(UUID.randomUUID().toString());
        int result = userAccountMapper.addAll(userAccount);
        if(result == 0){
            //没有加入
            return Result.error("注册失败");
        }
        MyBatisUtil.submitSession();
        return Result.success(userAccount);
    }

    @Override
    public Result getUserAccount(UserAccount userAccount) {
        //md5加密
        userAccount.setPassword(Md5Util.md5(userAccount.getPassword()));
        //获取
        UserAccount account = userAccountMapper.getOneByUsernameAndPassword(userAccount.getUsername(), userAccount.getPassword());
        if(account == null){
            return Result.error("密码或用户名错误");
        }
        return Result.success(account);
    }
}




