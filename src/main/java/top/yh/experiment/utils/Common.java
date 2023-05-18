package top.yh.experiment.utils;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

/**
 * @author yuhao
 * @date 2023/4/19
 * 公共资源
 **/
public class Common {
    public static final String USER_NAME = "user";
    public static void getCode(HttpServletRequest request, HttpServletResponse response, String type) throws IOException {
        //服务器通知浏览器不要缓存
        response.setHeader("pragma", "no-cache");
        response.setHeader("cache-control", "no-cache");
        response.setHeader("expires", "0");
        //创建对象 在内存中画图(验证码图片对象)
        int width = 90;
        int height = 30;
        BufferedImage bufferedImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        //美化图片
        Graphics graphics = bufferedImage.getGraphics();
        //设置颜色
        graphics.setColor(Color.GRAY);
        //背景色
        graphics.fillRect(0, 0, width, height);
        //画边框
        graphics.drawRect(0, 0, width - 1, height - 1);
        //写验证码
        char ch = 'A';
        //生成随机
        Random random = new Random();
        char[] chars = new char[4];
        StringBuilder builder = new StringBuilder(chars.length);
        for (int i = 0; i < chars.length; i++) {
            //122 - 65 = 57
            int anInt = random.nextInt(58);
            while (anInt + 65 >= 91 && anInt + 65 <= 96) {
                anInt = random.nextInt(58);
            }
            chars[i] = (char) (ch + (char) anInt);
            //将验证码存放到builder里
            builder.append(chars[i]);
        }
        //将验证码存放到session里
        request.getSession().setAttribute("checkCode" + type, builder.toString());
        graphics.setColor(Color.YELLOW);
        graphics.setFont(new Font("微软雅黑", Font.BOLD, 24));
        graphics.drawString(String.valueOf(chars[0]), 10, 20);
        graphics.drawString(String.valueOf(chars[1]), 30, 25);
        graphics.drawString(String.valueOf(chars[2]), 50, 20);
        graphics.drawString(String.valueOf(chars[3]), 70, 25);
        //输出页面
        ImageIO.write(bufferedImage, "jpg", response.getOutputStream());
    }
}

