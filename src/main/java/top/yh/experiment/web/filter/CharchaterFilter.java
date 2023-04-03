package top.yh.experiment.web.filter;


import top.yh.database.utils.MyBatisUtil;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author yu<p>
 */
@WebFilter(value = "/*", dispatcherTypes = DispatcherType.REQUEST)
public class CharchaterFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {

    }

    public void destroy() {
        MyBatisUtil.closeSession();
        //RedisUtil.closeJedis();
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException
            ,
            IOException {
        //将父接口转为子接口
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletResponse httpServletResponse = (HttpServletResponse) response;
        //获取请求方法
        String method = httpServletRequest.getMethod();
        //解决中文乱码问题
        if ("post".equalsIgnoreCase(method)) {
            httpServletRequest.setCharacterEncoding("utf-8");
        }
        //处理响应乱码
        httpServletResponse.setContentType("text/html;charset=utf-8");
        chain.doFilter(httpServletRequest, httpServletResponse);
    }
}
