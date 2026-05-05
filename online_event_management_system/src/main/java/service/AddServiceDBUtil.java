package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import util.dbConnection;

public class AddServiceDBUtil {

	//user add service 
	public static boolean insertAddService(int itemId, String username, int supId) {
	    boolean isSuccess = false;

	    Connection con = null;
	    Statement stmt = null;

	    try {
	        // Create DB connection
	        con = dbConnection.getConnection();
	        stmt = con.createStatement();

	        String sql = "INSERT INTO addservice (itemId, userId, supId) " +
	                     "VALUES ('" + itemId + "', '" + username + "', '" + supId + "')";

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
	
	//get supplier pending order list
	public static List<Map<String, String>> getSupplierPendingOrders(int supId) {
		List<Map<String, String>> pendingList = new ArrayList<>();
		
		//create DB connection
		try {
			Connection con = dbConnection.getConnection();
	        PreparedStatement pstmt = con.prepareStatement("SELECT * FROM addservice WHERE supId = ? AND status = 'Pending'");
	        
	        pstmt.setInt(1, supId);
	        ResultSet rs = pstmt.executeQuery();
	
	        while (rs.next()) {
	            Map<String, String> list = new HashMap<>();
	            list.put("addserviceId", rs.getString("addserviceId"));
	            list.put("itemId", rs.getString("itemId"));
	            list.put("userId", rs.getString("userId"));
	            list.put("dateTime", rs.getString("dateTime"));
	            list.put("supId", rs.getString("supId"));
	            list.put("status", rs.getString("status"));
	            
	            pendingList.add(list);
	            
	        } 
	        
	        rs.close();
	        
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return pendingList;
		
	}
	
	//Get Item title
	public static String getItemTitle(int itemId) {
	    String title = null;

	    try (
	        Connection con = dbConnection.getConnection();
	        PreparedStatement pstmt = con.prepareStatement("SELECT title FROM addon WHERE addOnID = ?");
	    ) {
	        pstmt.setInt(1, itemId);
	        ResultSet rs = pstmt.executeQuery();

	        if (rs.next()) {
	            title = rs.getString("title");
	        }

	        rs.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return title;
	}

	//get user details
	public static Map<String, String> getUserDetails(String username) {
	    Map<String, String> userDetails = new HashMap<>();

	    try (
	        Connection con = dbConnection.getConnection();
	        PreparedStatement pstmt = con.prepareStatement(
	            "SELECT name, email, phone FROM user WHERE username = ?"
	        );
	    ) {
	        pstmt.setString(1, username);
	        ResultSet rs = pstmt.executeQuery();

	        if (rs.next()) {
	            userDetails.put("name", rs.getString("name"));
	            userDetails.put("email", rs.getString("email"));
	            userDetails.put("phone", rs.getString("phone"));
	        }

	        rs.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return userDetails;
	}

	
}

