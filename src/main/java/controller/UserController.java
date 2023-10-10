package controller;

import entity.vo.MessageModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.UserService;

import java.io.IOException;
@WebServlet("login")
public class UserController extends HttpServlet {
    //实例化UserService对象
    private UserService UserService = new UserService();

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //获取请求参数
        String username = request.getParameter("username");
        String password = request.getParameter("password");
            //调用UserService的方法,返回信息模型对象
            MessageModel messageModel = UserService.userLogin(username, password);
            //判断信息模型的状态码
            if (messageModel.getCode() == 1) {
                //将信息模型中的用户信息设置到session作用域中，请求转发跳转
                request.getSession().setAttribute("User",messageModel.getObject());
                response.sendRedirect("welcome.jsp");
            }else {
                //将信息模型对象设置到request作用域中，请求转发跳转
                request.setAttribute("messageModel",messageModel);
                request
                        .getRequestDispatcher("login.jsp")
                        .forward(request,response);
            }
    }


}
