package com.lecheng.servlet;

import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;


/**
 * 定时任务
 * https://blog.csdn.net/mengxianhua/article/details/7844777
 * 在web.xml中加入
 * <servlet>
 * <servlet-name>TimerServlet</servlet-name>
 * <servlet-class>com.lecheng.servlet.TimerServlet</servlet-class>
 * <load-on-startup>2</load-on-startup>
 * </servlet>
 */
public class TimerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public TimerServlet() {
        super();
    }

    public void destroy() {
        super.destroy();
    }

    public void init() throws ServletException {
        System.out.println("启动了定时任务！");
        this.timerTask();
    }

    public static void timerTask() {
        new Timer().schedule(new TimerTask() {
            @Override
            public void run() {
                System.out.println(System.currentTimeMillis() + "执行了定时任务！");
            }
        }, new Date(), 60000);
    }
}  