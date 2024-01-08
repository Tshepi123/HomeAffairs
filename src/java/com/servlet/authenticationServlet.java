package com.servlet;

import com.bean.userBean;
import com.connect.DBConnect;
import com.dao.userDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "authenticationServlet", urlPatterns = {"/authenticationServlet"})
public class authenticationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        
        int idNumber = Integer.parseInt(request.getParameter("id")); 
        
        userBean UB = new userBean();
        UB.setId(idNumber);
        
        userDao dao = new userDao(DBConnect.getConn());
        userBean user = dao.authenticateUser(UB); //Calling method (loginUser) from userDao
        
        if(user != null) 
        {
            HttpSession session = request.getSession();
            session.setAttribute("userB", user);   //userB (short for userBean) Pass on to navbar and details.jsp
            response.sendRedirect("details.jsp");
        }
        else {
            HttpSession session = request.getSession();
            session.setAttribute("auth-failed", "Invalid ID Number, Please re-enter");
            response.sendRedirect("details.jsp");
        }
    }
}
