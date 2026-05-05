package service;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.user;
import model.userEvent;
import util.dbConnection;

public class userEventServices {

	public static boolean insertEvent(String type, String date, int guests, String location, String theme, String services, String uname) {
		 boolean isSuccess = false;
		 
			try {
	            dbConnection db = new dbConnection();
				
				Statement stmt = db.getConnection().createStatement();

		        
		        //SQL QUERY
				String sql = "INSERT INTO userevent (type, date, guestsNo, location, theme, sevices, uname) " +
	                     "VALUES ('" + type + "','" + date + "'," + guests + ",'" + location + "','" + theme + "','" + services + "','" + uname + "')";
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


	public static List<userEvent> getOneEvent(String Id){
		
		int convertedID = Integer.parseInt(Id);
		
		ArrayList<userEvent> oneEvent = new ArrayList<>();
		
		
		try {
			
			dbConnection db = new dbConnection();
			Statement stmt = db.getConnection().createStatement();	
			
			
			String sql = "SELECT * FROM userevent WHERE eventID ='"+convertedID+"'";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				
				int id = rs.getInt(1);
				String type = rs.getString(2);
				String date = rs.getString(3);
				int guests = rs.getInt(4);
				String location = rs.getString(5);
				String theme = rs.getString(6);
				String services = rs.getString(7);
				String uname = rs.getString(8);

				userEvent ue = new userEvent(id,type,date,guests,location,theme,services,uname);
				oneEvent.add(ue); 
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return oneEvent;
	}

   public static List<userEvent> getAllEvents(String username){
	   
	   ArrayList<userEvent> events = new ArrayList<>();
	   
	   try {
			
			dbConnection db = new dbConnection();
			Statement stmt = db.getConnection().createStatement();	
			
			
			String sql = "SELECT * FROM userevent WHERE uname ='"+username+"'";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				
				int id = rs.getInt(1);
				String type = rs.getString(2);
				String date = rs.getString(3);
				int guests = rs.getInt(4);
				String location = rs.getString(5);
				String theme = rs.getString(6);
				String services = rs.getString(7);
				String uname = rs.getString(8);

				userEvent ue = new userEvent(id,type,date,guests,location,theme,services,uname);
				events.add(ue); 
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return events;
   }

   public static boolean updateEvent(String id, String type,String date , int guests, String location,String theme,String services,String username) {
	   
	   boolean isSuccess = false;;
	   
	   try {
           dbConnection db = new dbConnection();
			
			Statement stmt = db.getConnection().createStatement();

	        
	        //SQL QUERY
			String sql = "UPDATE userevent SET type='"+type+"',date='"+date+"',guestsNo='"+guests+"',location='"+location+"',theme='"+theme+"',sevices='"+services+"'" 
	        + "WHERE eventID='"+id+"'";
					
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

   public static boolean deleteEvent(String id) {
		
	   int convertedID = Integer.parseInt(id);
       boolean isSuccess=false;	
	
	try {
        dbConnection db = new dbConnection();
		
		Statement stmt = db.getConnection().createStatement();

        
        //SQL QUERY
        String sql = "DELETE FROM userevent WHERE eventID='"+convertedID+"'";
        
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
   
public static List<userEvent> getTotalEvents(){
	   
	   ArrayList<userEvent> events = new ArrayList<>();
	   
	   try {
			
			dbConnection db = new dbConnection();
			Statement stmt = db.getConnection().createStatement();	
			
			
			String sql = "SELECT * FROM userevent ";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				
				int id = rs.getInt(1);
				String type = rs.getString(2);
				String date = rs.getString(3);
				int guests = rs.getInt(4);
				String location = rs.getString(5);
				String theme = rs.getString(6);
				String services = rs.getString(7);
				String uname = rs.getString(8);

				userEvent ue = new userEvent(id,type,date,guests,location,theme,services,uname);
				events.add(ue); 
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return events;
   }








}
