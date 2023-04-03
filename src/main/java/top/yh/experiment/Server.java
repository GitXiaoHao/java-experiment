package top.yh.experiment;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;

/**
 * @user yuhao
 * @date
 */
public class Server {
    public static void main(String[] args) throws IOException {
        ServerSocket serverSocket = new ServerSocket(9999);
        while (true) {
            //接收信息
            System.out.println("等待客户端发来的信息");
            Socket accept = serverSocket.accept();
            System.out.println("建立连接成功");
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(accept.getInputStream()));
            //读取
            String line = bufferedReader.readLine();
            System.out.println("客户端发送的信息是：" + line);
            //向客户端发送信息
            PrintWriter printWriter = new PrintWriter(new BufferedWriter(new OutputStreamWriter(accept.getOutputStream())), true);
            printWriter.write("hello i'm server");
            printWriter.close();
            bufferedReader.close();
            accept.close();
        }
    }
}
