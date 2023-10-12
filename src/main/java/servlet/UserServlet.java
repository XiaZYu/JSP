package servlet;

import com.alibaba.fastjson2.JSONObject;
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
            case "queryAll":
                queryAll(request,response);
                break;
            case "update":
                updata(request,response);
                break;
            default:
                break;
        }
    }
    private void queryAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
       String user = request.getSession().getAttribute("User").toString();
        System.out.println(user);
        //将String字符转为Json对象
        JSONObject jsonObject = JSONObject.parseObject(user);
        System.out.println(jsonObject.getString("id"));
//        userService.findById(id);
    }

    private void updata(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
