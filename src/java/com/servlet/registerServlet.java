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

@WebServlet(name = "registerServlet", urlPatterns = {"/registerServlet"})
public class registerServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
    {
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String middleName = request.getParameter("middleName");
        String birthDate = request.getParameter("birthDate");
        String tel = request.getParameter("tel");
        String address = request.getParameter("address");
        String email = request.getParameter("email");
        String ethnicity = request.getParameter("ethnicity");
        String gender = request.getParameter("gender");
        String idPhoto = request.getParameter("idPhoto");

        userBean UB = new userBean();
        UB.setName(name);
        UB.setSurname(surname);
        UB.setMiddleName(middleName);
        UB.setBirthDate(birthDate);
        UB.setTel(tel);
        UB.setAddress(address);
        UB.setEmail(email);
        UB.setEthnicity(ethnicity);
        UB.setGender(gender);
        UB.setIdPhoto(idPhoto);
        
        userDao dao = new userDao(DBConnect.getConn());
        boolean f=dao.addUser(UB);  // using method addUser, from userDao 
        PrintWriter out = response.getWriter();
        
        HttpSession session;
        
        if(f)
        {
            session = request.getSession();
            session.setAttribute("reg-success", "Registered Successfully");
            response.sendRedirect("register.jsp"); // Will redirect to same page once successfully registered & message above will show "Registered Successfully" (Will Tell you, your ID Number is ... ) 
        }    
        else {
            session = request.getSession();
            session.setAttribute("failed-msg", "Registration Failed, try again...");
            response.sendRedirect("register.jsp"); // If registration has failed, will stay on registration page and message "Registration Failed, try again..." will show
        }
    }
 
}