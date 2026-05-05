package service;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.suggestions;
import model.userEvent;
import util.dbConnection;

public class suggestionService {

	public static boolean insertSuggestion(String id , String suggestion) {
		
		int convertedID = Integer.parseInt(id);
		boolean isSuccess = false;
		 
			try {
	            dbConnection db = new dbConnection();
				
				Statement stmt = db.getConnection().createStatement();

		        
		        //SQL QUERY
				String sql = "INSERT INTO suggestions VALUES('"+convertedID+"','"+suggestion+"')";
		        int rs = stmt.executeUpdate(sql);
		        System.out.println("data inserted");
		        
		        System.out.println("error3");
		        
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

	   
	
	public static List<suggestions> getSuggestions(String username){
		   
		   ArrayList<suggestions> sug = new ArrayList<>();
		   
		   try {
				
				dbConnection db = new dbConnection();
				Statement stmt = db.getConnection().createStatement();	
				
				
				String sql = "SELECT s.suggestion "
						+ "FROM suggestions s , userevent ue "
						+ " WHERE s.eventID = ue.eventID AND uname = '"+username+"' ";
				
								
				ResultSet rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					
					int eID = rs.getInt(1);
					String suggestion = rs.getString(2);

					suggestions sg = new suggestions(eID,suggestion);
					sug.add(sg);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return sug;
	   }
	
	
	
}
