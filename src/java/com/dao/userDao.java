package com.dao;

import com.bean.userBean;
import com.connect.DBConnect;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class userDao {   
    private Connection conn;
    
    public userDao(Connection conn) {
        super();
        this.conn = conn;
    }
    
    public boolean addUser(userBean UB) // Creating method addCustomer, which will be used to add a customer into registration database table. Will be used in registerServlet
    {
        boolean f = false;
        
        try {
            String query = "insert into registration(name, surname, middleName, birthDate, tel, address, email, ethnicity, gender, idPhoto) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, UB.getName());
            ps.setString(2, UB.getSurname());
            ps.setString(3, UB.getMiddleName());
            ps.setString(4, UB.getBirthDate());
            ps.setString(5, UB.getTel());
            ps.setString(6, UB.getAddress());
            ps.setString(7, UB.getEmail());
            ps.setString(8, UB.getEthnicity());
            ps.setString(9, UB.getGender());
            ps.setString(10, UB.getIdPhoto());
            
            int i = ps.executeUpdate();
            if(i==1)
            {
                f=true;
            }    
        } catch(Exception e) {
            e.printStackTrace();
        }
        return f;
    } 
    
    public userBean authenticateUser(userBean UB) // This method will show the user's details once ID Number has been entered
    {                                             // Use same method as login, by entering ID number, then if ID Number is != null must show details below
        userBean user = null;                      // Declaring the userBean
        try {
            String query = "select * from registration where id=?";
            
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, UB.getId());
            ResultSet rs = ps.executeQuery();
            
            if(rs.next())
            {
                user = new userBean();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setSurname(rs.getString("surname"));
                user.setMiddleName(rs.getString("middleName"));
                user.setBirthDate(rs.getString("birthDate"));
                user.setTel(rs.getString("tel"));
                user.setAddress(rs.getString("address"));
                user.setEmail(rs.getString("email"));
                user.setEthnicity("ethnicity");
                user.setGender("gender");
                user.setIdPhoto("idPhoto");
            }    
        }catch(Exception e) {
            e.printStackTrace();       
        }
        return user;
    }
    
        public List<userBean> getData(String idNumber) // The method getData() is created to get all the info from the database table (registration)
    {
        List<userBean> list = new ArrayList<>(); //Declaring the ArrayList 
        userBean po = new userBean(); // Declaring the bean class
              
        try {
            
            String query = "select * from registration where id = ?"; // selecting all data from the registration table from database, by the id (primary key).  
                                                                    // This method getData will be used to show the data in details.jsp
            PreparedStatement ps = conn.prepareStatement(query);
            //ps.setInt(1, id);
            
            ResultSet rs = ps.executeQuery();
            while(rs.next())
            {
                po.setId(rs.getInt(1));
                po.setName(rs.getString(2));
                po.setSurname(rs.getString(3));
                po.setMiddleName(rs.getString(4)); 
                po.setTel(rs.getString(5));
                po.setAddress(rs.getString(6));
                po.setEmail(rs.getString(7));
                po.setEthnicity(rs.getString(8));
                po.setGender(rs.getString(9));
                po.setIdPhoto(rs.getString(10));

                list.add(po);
            }    
        } catch (Exception e) {            
        }
        return list;
    }  
    
}