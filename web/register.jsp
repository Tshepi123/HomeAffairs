<%@page import="com.bean.userBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
    <head>       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
        <%@include file="includes/head.jsp" %>        
    </head>
    <body>
        <%@include file="includes/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card mt-4">
                        <div class="card-header text-center">
                            <i class="fa fa-user-plus fa-3x" aria-hidden="true"></i>
                            <h4>Registration Form</h4>
                        </div>
                        
                        <!-- Code below will show message when customer has successfully registered-->
                        <%
                            String SuccessRegMsg = (String)session.getAttribute("reg-success");
                            userBean UB = (userBean)session.getAttribute("userB");
                            if(SuccessRegMsg != null) 
                            {%>    
                            <div class="alert alert-success" role="alert"><%=SuccessRegMsg%> <br> <a href="details.jsp">Click Here To View Your Details</a> </div>  
                            <%   
                                session.removeAttribute("reg-success");
                            }
                        %>    
   
                        <!-- Code below will show message when customer has not registered successfully-->
                        <%
                            String FailedRegMsg = (String)session.getAttribute("failed-msg");
                            
                            if(FailedRegMsg != null) 
                            {%>    
                                <div class="alert alert-danger" role="alert"><%= FailedRegMsg %></div>
                            <%     
                                session.removeAttribute("failed-msg");
                            }
                        %>                          
                            
                        <div class="card-body">
                            <form action="registerServlet" method="post"> <!-- The action is the url pattern of the registerServlet -->
                                
                                <div class="form-group">
                                    <label>Name:</label>
                                    <input type="text" class="form-control" name="name" placeholder='Enter Your First Name' required='required'>
                                </div>
                                <div class="form-group">
                                    <label>Surname:</label>
                                    <input type="text" class="form-control" name="surname" placeholder='Enter Your Surname' required='required'>
                                </div>
                                <div class="form-group">
                                    <label>Middle Name:</label>
                                    <input type="text" class="form-control" name="middleName" placeholder='Enter Your Middle Name' required='required'>
                                </div>
                                <div class="form-group">
                                    <label>Date of Birth:</label>
                                    <input type="date" class="form-control" name="birthDate" required='required'>
                                </div>
                                <div class="form-group">
                                    <label>Telephone No:</label>
                                    <input type="number" class="form-control" name="tel" placeholder='Enter Phone Number' required='required'>
                                </div>                                
                                <div class="form-group">
                                    <label>Home Address:</label>
                                    <input type="text" class="form-control" name="address" placeholder='Enter Home Address' required='required'>
                                </div> 
                                <div class="form-group">
                                    <label>Email:</label>
                                    <input type="email" class="form-control" name="email" placeholder='email@gmail.com' required='required'>
                                </div> 
                                <div class="form-group">
                                    <label>Ethnicity:</label>
                                    <div id="radio_button">
                                        <input type="radio" name="ethnicity" value="Black">
                                        <label>Black</label>
                                        <input type="radio" name="ethnicity" value="White">
                                        <label>White</label> 
                                        <input type="radio" name="ethnicity" value="Mixed">
                                        <label>Mixed</label> 
                                        <input type="radio" name="ethnicity" value="Asian">
                                        <label>Asian</label> 
                                        <input type="radio" name="ethnicity" value="Indian">
                                        <label>Indian</label> 
                                    </div> 
                                </div>    
                                
                                <div class="form-group">
                                    <label>Gender:</label>
                                    <div id="radio_button">                                        
                                        <input type="radio" name="gender" value="Female">
                                        <label>Female</label>
                                        &nbsp;&nbsp;
                                        <input type="radio" name="gender" value="Male">
                                        <label>Male</label> 
                                    </div> 
                                </div>
                                <div class="form-group">
                                    <label>Insert ID Photo:</label> 
                                    <input type="file" name="idPhoto">
                                </div>                                                               
                                <br>
                                <div class="form-group text-center">
                                    <button type="submit" class="btn btn-primary">Register</button>
                                </div>
                                
                            </form>
                        </div>        
                    </div>
                </div>
            </div>
        </div>
                    
    </body>    
</html>
