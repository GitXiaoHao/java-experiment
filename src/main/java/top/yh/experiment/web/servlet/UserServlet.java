package top.yh.experiment.web.servlet; /**
 * @author yuhao
 * @date 2023/3/22
 **/

import cn.hutool.core.util.RandomUtil;
import top.yh.experiment.pojo.UserAccount;
import top.yh.experiment.service.UserAccountService;
import top.yh.experiment.service.impl.UserAccountServiceImpl;
import top.yh.experiment.utils.Common;
import top.yh.experiment.utils.Result;
import top.yh.servlet.BaseServlet;
import top.yh.string.StringUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

@WebServlet("/user/*")
public class UserServlet extends BaseServlet {
    private final UserAccountService userAccountService = new UserAccountServiceImpl();

    /**
     * 注册
     */
    public void register(HttpServletRequest request, HttpServletResponse response) throws IOException, InvocationTargetException, IllegalAccessException {
        //2.将 param 转化为对象
        UserAccount userAccount = this.getParam(request, UserAccount.class);
        //设置激活
        userAccount.setIsStatus(1);
        //进行注册
        Result result = userAccountService.saveUserAccount(userAccount);
        Result userAccountResult;
        if (result.getCode() == 1) {
            //如果成功就将用户返回
            userAccountResult = Result.success(userAccount);
        } else {
            //失败就打印失败信息
            userAccountResult = Result.error(result.getMsg());
        }
        this.writeValueAsGetWrite(response, this.writeValueAsString(userAccountResult));
    }

    public void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        //获取传过来的数据
        UserAccount userAccount = this.getParam(request, UserAccount.class);
        //获取数据库的用户
        //判断用户名和密码是否输入
        if (StringUtil.isEmpty(userAccount.getUsername()) && StringUtil.isEmpty(userAccount.getPassword())) {
            //如果等于空
            this.writeValueAsGetWrite(response, this.writeValueAsString(Result.error("用户名或密码错误")));
            return;
        }
        Result result = userAccountService.getUserAccount(userAccount);
        if(result.getCode() == 1){
            //存入request
            request.getSession().setAttribute(Common.USER_NAME,userAccount);
            this.writeValueAsGetWrite(response,this.writeValueAsString(Result.success(result.getData())));
        }else{
            this.writeValueAsGetWrite(response,this.writeValueAsString(Result.error(result.getMsg())));
        }
    }

    /**
     * 获取验证码
     */
    public void getCode(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        //获取
        String email = this.getParam(request, UserAccount.class).getEmail();
        //获取四位的验证码
        String randomNumbers = RandomUtil.randomNumbers(4);
        //发送验证码
        Result result = userAccountService.sendEmail(randomNumbers, email);
        if (result.getCode() == 1) {
            //如果成功
            this.writeValueAsGetWrite(response, this.writeValueAsString(Result.success(randomNumbers)));
        } else {
            this.writeValueAsGetWrite(response, this.writeValueAsString(Result.error(result.getMsg())));
        }
    }
}
