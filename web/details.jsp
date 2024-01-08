<%@page import="com.connect.DBConnect"%>
<%@page import="com.dao.userDao"%>
<%@page import="java.util.List"%>
<%@page import="com.bean.userBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Details Page</title>
        <%@include file="includes/head.jsp" %> 
    </head>
    <body>
        <%@include file="includes/navbar.jsp" %>
                           
            <div class="container text-center">
                <!-- Code below will show message when user has not been found-->
                <!-- Getting attribute (auth-failed message) from the authenticationServlet. -->
                <%
                    String InvalidMsg = (String)session.getAttribute("auth-failed");

                    if(InvalidMsg != null) 
                    {%>    
                        <div class="alert alert-danger" role="alert"><%= InvalidMsg %></div>
                    <%     
                        session.removeAttribute("auth-failed");
                    }
                %>   
                <form action="authenticationServlet" method="post">
                    <div class="form-group">
                        <h3>Search for User</h3>
                        <input style="width: 300px; text-align: center" type="number" name="id" placeholder='Enter ID Number' required='required'>
                        <button type="submit" class="btn btn-primary">Search</button>
                    </div>                  
                </form>   
            </div>  
          
<br><br>

                        <%
                            userBean UB = (userBean)session.getAttribute("userB");
                            if(UB != null) 
                            {%>       
                            <div class="card mt-auto">
                                <div class="card-body p-4">                            
                                    <p>
                                        <b class="text-center">Name: <%=UB.getName() %> </b> 
                                    </p>

                                    <p>
                                        <b class="text-center">Surname: <%=UB.getSurname() %> </b> 
                                    </p>

                                    <p>
                                        <b class="text-center">Middle Name: <%=UB.getMiddleName() %> </b> 
                                    </p>
                                    
                                    <p>
                                        <b class="text-center">Date of Birth: <%=UB.getBirthDate() %> </b> 
                                    </p>

                                    <p>
                                        <b class="text-center">Tel No: <%=UB.getTel() %> </b>
                                    </p>

                                    <p>
                                        <b class="text-center">Home Address: <%=UB.getAddress() %> </b> 
                                    </p>

                                    <p>
                                        <b class="text-center">Email: <%=UB.getEmail() %> </b> 
                                    </p>

                                    <p>
                                        <b class="text-center">Ethnicity: <%=UB.getEthnicity() %> </b> 
                                    </p>

                                    <p>
                                        <b class="text-center">Gender: <%=UB.getGender() %> </b> 
                                    </p> 
                                                
                                    <p>
                                        <b class="text-center">ID Number: <%=UB.getId() %> </b> 
                                    </p>

                                    <p>
                                        <b class="text-center">ID Photo: <!--%=UB.getIdPhoto() %--> <br> <img alt="" src="images/img1.jpg" class="img-fluid mx-auto" style="max-width: 100px;"> </b> 
                                    </p>
                                </div>
                            </div>                                       
                            <%}
                        %>    



    </body>
</html>
