package service;

import java.sql.Connection;
import java.sql.ResultSet;

import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.user;
import util.dbConnection;


public class userServices {



	//Insert Data Function
	public static boolean userRegister(String name , String email , String phone ,String address, String username , String password) {
	    
		 boolean isSuccess = false;
		 
		try {
            dbConnection db = new dbConnection();
			
			Statement stmt = db.getConnection().createStatement();

	        
	        //SQL QUERY
	        String sql = "INSERT INTO user VALUES('"+username+"','"+name+"','"+email+"','"+phone+"','"+address+"','"+password+"')";
	        int rs = stmt.executeUpdate(sql);
	        System.out.println("data inserted");
	        
	        if (rs > 0) {
	            isSuccess = true;
	        } else {
	            isSuccess = false;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
		return isSuccess;
	}
	
	
	
	public static List<user> loginValidate(String username, String password) {
		
		ArrayList<user> usr = new ArrayList<user>();
		
		try {
            dbConnection db = new dbConnection();
			
			Statement stmt = db.getConnection().createStatement();

	        
	        //SQL QUERY
	        String sql =  "SELECT * FROM user WHERE username = '"+username+"' AND password='"+password+"'";
	        ResultSet rs = stmt.executeQuery(sql);
	        
	        if (rs.next()) {
	            
	            String uname = rs.getString(1); //data table column index
				String name = rs.getString(2);
				String email = rs.getString(3);
				String phone = rs.getString(4);
				String add = rs.getString(5);
				String pass =  rs.getString(6);
				
	            user us = new user(name,email,phone,add,uname,pass);
				usr.add(us);
	            
	        } else {
	            
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
        return usr;
	}
	
	
	public static List <user> getDetails(String username) {
		
		ArrayList<user> user = new ArrayList<user>();
		try {
			
            dbConnection db = new dbConnection();
            
			Statement stmt = db.getConnection().createStatement();

	        
	        //SQL QUERY
	        String sql =  "SELECT * FROM user WHERE username = '"+username+"'";
	        ResultSet rs = stmt.executeQuery(sql);
	        
	        if (rs.next()) {
	            
	            String uname = rs.getString(1); //data table column index
				String name = rs.getString(2);
				String email = rs.getString(3);
				String phone = rs.getString(4);
				String add = rs.getString(5);
				String pass =  rs.getString(6);
				
	            user us = new user(name,email,phone,add,uname,pass);
	            user.add(us);
				
	        } 
	        
	    } catch (Exception e) {
	       
	    	e.printStackTrace();
	    }
		
		return user;
	}
	
	//user profile update
	
	public static boolean updateUser(String name , String email , String phone ,String address, String username) {
		
		boolean isSuccess=false;	
		
		try {
            dbConnection db = new dbConnection();
			
			Statement stmt = db.getConnection().createStatement();

	        
	        //SQL QUERY
	        String sql =  "UPDATE user set name='"+name+"',email='"+email+"',phone='"+phone+"',address='"+address+"' " 
	        + "WHERE username='"+username+"'";
	        
	        int rs = stmt.executeUpdate(sql);
	        
	        if (rs > 0) {
	            
	           isSuccess = true;
	            
	        } else {
	            
	        	isSuccess = false;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
		
		return isSuccess;	
	}
	
	public static boolean deleteUser(String username) {
		
           boolean isSuccess=false;	
		
		try {
            dbConnection db = new dbConnection();
			
			Statement stmt = db.getConnection().createStatement();

	        
	        //SQL QUERY
	        String sql = "DELETE FROM user WHERE username='"+username+"'";
	        
	        int rs = stmt.executeUpdate(sql);
	        
	        if (rs > 0) {
	            
	           isSuccess = true;
	            
	        } else {
	            
	        	isSuccess = false;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
		
		return isSuccess;
				
	}
	
	public static String checkPassword(String username) {
	    String pass = null;

	    try {
	        dbConnection db = new dbConnection();
	        Statement stmt = db.getConnection().createStatement();

	        String sql = "SELECT password FROM user WHERE username='" + username + "'";
	        ResultSet rs = stmt.executeQuery(sql);

	        if (rs.next()) {
	            pass = rs.getString("password");
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return pass;
	}
	
public static boolean updatePassword(String username, String password) {
		
		boolean isSuccess=false;	
		
		try {
            dbConnection db = new dbConnection();
			
			Statement stmt = db.getConnection().createStatement();

	        
	        //SQL QUERY
			String sql = "UPDATE user set password='" + password + "' "  
		             + "WHERE username='" + username + "'";
	        
	        int rs = stmt.executeUpdate(sql);
	        
	        if (rs > 0) {
	            
	           isSuccess = true;
	            
	        } else {
	            
	        	isSuccess = false;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
		
		return isSuccess;	
	}


	
}
