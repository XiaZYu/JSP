import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String i = request.getParameter("i");
        if (i.equals("1")){
            if (isValidUser(username, password)) {
                response.sendRedirect("welcome.jsp");
            } else {
                response.sendRedirect("error.jsp");
            }
        }else {
            System.out.println("注册");
        }

    }
    private boolean isValidUser(String username, String password) {
        return "admin".equals(username) && "1234".equals(password);
    }
}
