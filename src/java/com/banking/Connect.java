/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.banking;
import java.sql.*;



/**
 *
 * @author KHALIQ
 */
public class Connect {
    String user;
    String pass;
    String url;
    String query;
    Connection con;
    Statement st;
    ResultSet rs;
    
    /**
     *
     * @param user
     * @param pass
     * @param url
     */
    public Connect(String user,String pass,String url)
    {
        url="jdbc:mysql://localhost:3306/"+url;
        this.user =user;
        this.pass=pass;
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection(url,user,"rohit");
            

            //example
            //st=con.createStatement();
            //rs=st.executeQuery(url);
            //int i=st.executeUpdate(query);  this returns number of rows affected
            
            //prepared Statement
            //query = insert into student values(?,?,?);
            //PreparedStatement st=con.prepareStatement(query);
            //st.setInt(1,values);
            //int c=st.sxecuteUpdate();
        }
        catch(ClassNotFoundException | SQLException e)
        {
            System.out.println(e.getMessage());
        }
            
        
        
    }
    public boolean verifylogin(String uname,String pass) throws SQLException
    {
        String q= "select pass from customer_data where uname = '"+uname+"';";
        
        st=con.createStatement();
        rs=st.executeQuery(q);
        rs.next();
        String a_pass=rs.getString(1);
        return(a_pass.equals(pass));
    }
    public int update_query(String q) throws SQLException
    {
        int rows;
        st=con.createStatement();
        rows=st.executeUpdate(q);
        return(rows);
    }
    public ResultSet execute_query(String q) throws SQLException
    {
        st=con.createStatement();
        rs=st.executeQuery(q);
        return(rs);
    }

    /**
     *
     * @param from
     * @param to
     * @param amount
     * @return
     * @throws SQLException
     */
    public boolean sendMoney(String from,String to,int amount) throws SQLException
    {   
    	try
    	{       
                //FROM  dao
    		String fromq="select balance from customer_data where uname = '"+from +"';";
    		System.out.println(fromq);
                st=con.createStatement();
        	rs=st.executeQuery(fromq);
        	rs.next();
        	int fbal =rs.getInt(1);
                
                // To dao
        	String toq="select balance from customer_data where uname = '"+to +"';";
        	rs=st.executeQuery(toq);
        	rs.next();
                int tbal =rs.getInt(1);
        	System.out.println("ToBalance = "+fbal);
        	if(fbal>=amount)
        	{
        		fbal=fbal-amount;
        		tbal=tbal+amount;
        		System.out.println(fbal+" "+tbal+" "+amount);
        		fromq="update customer_data set balance ="+ fbal+" where uname='"+from+"';";
        		int i=st.executeUpdate(fromq);
        		toq="update customer_data set balance ="+ tbal+" where uname='"+to+"';";
        		System.out.println(fromq);
        		System.out.println(toq);
        		i=st.executeUpdate(toq);
        		String sql8 = "insert into transactions values ('"+from+"','"+to+"',"+amount+",current_timestamp);";
        		st.executeUpdate(sql8);
                        return(true);
        		
        	}
        	else {
        		
        		          return(false);
        	}
        	
        	
        	
    	}
        catch(SQLException e) 
        {
            System.out.println(e.getMessage());
            return false;
        }
        
            
    }
    
}

