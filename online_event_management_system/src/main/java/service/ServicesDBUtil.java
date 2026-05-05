package service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.Services;
import util.dbConnection;

public class ServicesDBUtil {
    
    private static Connection con = null;
    private static Statement stmt = null;
    private static ResultSet rs = null;
    
    
    public static boolean insertService(String title, String category ,Double price, String description, int supId) {
        
        boolean isSuccess = false;
        
        try {
            //create DB connection
            con = dbConnection.getConnection();
            stmt = con.createStatement();
            
            String sql = "insert into addon values (0, '"+ title +"', '"+ category +"', '"+ price +"', '"+ description +"', '"+ supId +"')";
            int rs = stmt.executeUpdate(sql);
            
            if(rs > 0) {
                isSuccess = true;
            } else {
                isSuccess = false;
            } 
        
        } catch(Exception e){
            e.printStackTrace();
        }
        
        return isSuccess;
    }

    
    public static List<Services> getServiceDetails(String category) {
        List<Services> serve = new ArrayList<>();

        try {
            con = dbConnection.getConnection();
            String sql = "SELECT * FROM addon WHERE LOWER(category) = LOWER(?)";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, category);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("addOnID");
                String title = rs.getString("title");
                String cat = rs.getString("category");
                double price = rs.getDouble("price");
                String description = rs.getString("description");

                Services s = new Services(id, title, cat, price, description);
                serve.add(s);
            }

            rs.close();
            pstmt.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return serve;
    }
    
    
    public static List<Map<String, String>> getServiceById(int serviceId){
    	
    	List<Map<String,String>> serviceList = new ArrayList<>();
    	
    	try {
    		con = dbConnection.getConnection();
    		String sql = "Select * from addon where addOnID = ?";
    		
    		PreparedStatement ps= con.prepareStatement(sql);
    		ps.setInt(1, serviceId);
    		rs = ps.executeQuery();
    		
    		while(rs.next()) {
    			Map<String, String> service = new HashMap<>();
    			
    			service.put("id", String.valueOf(rs.getInt("addOnID")));
    			service.put("title", rs.getString("title"));
    			service.put("category", rs.getString("category"));
                service.put("price", String.valueOf(rs.getDouble("price")));
                service.put("description", rs.getString("description"));
                
                serviceList.add(service);
    		}
    		
    		rs.close();
    		ps.close();
    		con.close();
    		
    	} catch(Exception e) {
    		e.printStackTrace();
    	}
    	
		return serviceList;	
    }
    
    
    public static boolean updateServices(int id, String title, String category, double price, String description) {
        boolean isSuccess = false;
        
        try {
            // Create DB connection
            con = dbConnection.getConnection();
            
            
            String sql = "UPDATE addon SET title = ?, category = ?, price = ?, description = ? WHERE addOnID = ?";
            
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, title);
            pstmt.setString(2, category);
            pstmt.setDouble(3, price);
            pstmt.setString(4, description);
            pstmt.setInt(5, id);

            int rs = pstmt.executeUpdate();
            
            if(rs > 0) {
                isSuccess = true;
            }
            
            // Close resources
            pstmt.close();
            con.close();
            
        } catch(Exception e) {
        	
            e.printStackTrace();
        }
        
        return isSuccess;
    }

    
    
    
    public static boolean deleteService(int id) {
    	
    	boolean isSuccess = false;
    	
    	try {
    		con = dbConnection.getConnection();
    		stmt = con.createStatement();
    		
    		String sql = "Delete from addon Where addOnID = '"+ id +"'";
    		
    		int rs = stmt.executeUpdate(sql); //can be 0 or 1
    		
    		if(rs > 0) {
    			isSuccess = true;
    		}
    		else {
    			isSuccess = false;
    		}
    	} catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	return isSuccess;
    }
    
	public static int getSupplier(int itemId) {
	    	
	    	int supId = 0;
	    	
	    	try {
	    		con = dbConnection.getConnection();
	    		String sql = "SELECT supId FROM addon WHERE addOnID = ?";
	    		
	            PreparedStatement pstmt = con.prepareStatement(sql);
	            pstmt.setInt(1, itemId);
	            rs = pstmt.executeQuery();
	            
	            if(rs.next()) {
	            	supId = rs.getInt("supId");
	            }
	            
	            //close resources
	            rs.close();
	            pstmt.close();
	            con.close();
	            
	    	} catch (Exception e) {
	    		e.printStackTrace();
	    	}
	    	
	    	return supId;
	    	
	    }
    
}
