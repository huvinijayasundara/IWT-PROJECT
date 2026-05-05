package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Statement;


import model.Admin;
import util.dbConnection;

public class AdminDBUtil {
	 
	private static Connection con = null;
    private static Statement stmt = null;
    
	
    
	public static List<Admin> validate (String username , String password, String role){
			
		ArrayList<Admin> admin = new ArrayList<>();
			
		try {
				con = dbConnection.getConnection();
				stmt = (Statement) con.createStatement();
			
					
				String sql = "SELECT * FROM administrators WHERE userName = '" + username + "' AND password = '" + password + "' AND role = '" + role + "'";

					
				ResultSet rs  = stmt.executeQuery(sql);
					
				if(rs.next()) {
					int id =rs.getInt(1);
					String name = rs.getString(2);
					String address = rs.getString(3);
					String phone = rs.getString(4);
					String email = rs.getString(5);
					String userU = rs.getString(6);
					String passU = rs.getString(7);
					String role1 = rs.getString(8);
						
					Admin a = new Admin(id, name, address,phone,email,userU, passU, role1);
					admin.add(a);
					
				}
				
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			return admin;	
		}
	
	//Method to get supplier Details
	public static List<Admin> getSupplierDetailsById(int supplierId) {
		
	    List<Admin> supplierList = new ArrayList<>();
	    
	    try {
	        Connection con = dbConnection.getConnection();
	        String sql = "SELECT * FROM administrators WHERE adminId = ?";
	        
	        PreparedStatement pstmt = con.prepareStatement(sql);
	        pstmt.setInt(1, supplierId);

	        ResultSet rs = pstmt.executeQuery();
	        while (rs.next()) {
	            int id = rs.getInt("adminId");
	            String name = rs.getString("adName");
	            String address = rs.getString("adAddress");
	            String phone = rs.getString("adPhone");
	            String email = rs.getString("adEmail");
	            String username = rs.getString("userName");
	            String password = rs.getString("password");
	            String role = rs.getString("role");

	            Admin supplier = new Admin(id, name, address, phone, email, username, password, role);
	            supplierList.add(supplier);
	        }

	        rs.close();
	        pstmt.close();
	        con.close();
	        
	    } catch (Exception e) {
	    	
	        e.printStackTrace();
	    }
	    
	    return supplierList;
	}	

}