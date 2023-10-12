package servlet;

import com.alibaba.fastjson2.JSONObject;
import entity.vo.MessageModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.UserService;

import java.io.IOException;

@WebServlet("/User")
public class UserServlet extends HttpServlet {
    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //获取请求参数
        String event = request.getParameter("event");

        switch (event){
            case "update":
                updata(request,response);
                break;
            default:
                break;
        }
    }

    private void updata(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        String user = request.getSession().getAttribute("User").toString();

        //将String字符转为Json对象
        JSONObject jsonObject = JSONObject.parseObject(user);
        int id = Integer.parseInt(jsonObject.getString("id"));

        MessageModel messageModel = userService.userUpdate(id,username,password,email,phone);

        if (messageModel.getCode() == 0) {
            //将信息模型中的用户信息设置到session作用域中，请求转发跳转
            request.getSession().setAttribute("User",messageModel.getObject());
            response.sendRedirect("index.jsp");
        }else {
            //将信息模型对象设置到request作用域中，请求转发跳转
            request.setAttribute("messageModel",messageModel);
            request
                    .getRequestDispatcher("login.jsp")
                    .forward(request,response);
        }
    }
}
