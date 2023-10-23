package servlet;

import entity.vo.MessageModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.ArticleService;

import java.io.IOException;

@WebServlet("/Article")
public class ArticleServlet extends HttpServlet {
   private ArticleService articleService = new ArticleService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        super.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //获取请求参数
        String event = request.getParameter("event");
//        switch (event){
//            case "find":
                findAll(request,response);
//                break;
//            default:
//                break;
//        }
    }

    private void findAll(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{

        MessageModel messageModel = articleService.articleFindAll();

        if(messageModel.getCode() == 0){
            request.getSession().setAttribute("Article",messageModel.getObject());
            System.out.println(messageModel.getObject());
            response.sendRedirect("index.jsp");
        }else {
            request.setAttribute("message",messageModel.getMsg());
            request
                    .getRequestDispatcher("error.jsp")
                    .forward(request,response);
        }
    }
}
