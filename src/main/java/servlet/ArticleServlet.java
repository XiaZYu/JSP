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
        findAll(request,response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private void findAll(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        MessageModel messageModel;
        String id = request.getParameter("id");
        if (id==null){
            messageModel = articleService.articleFindAll();
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
        }else {
            messageModel = articleService.articleFindById(id);
            if(messageModel.getCode() == 0){
                request.getSession().setAttribute("ArticleById",messageModel.getObject());
                System.out.println(messageModel.getObject());
                response.sendRedirect("pdf-reader.jsp");
            }else {
                request.setAttribute("message",messageModel.getMsg());
                request
                        .getRequestDispatcher("error.jsp")
                        .forward(request,response);
            }
        }
    }
}
