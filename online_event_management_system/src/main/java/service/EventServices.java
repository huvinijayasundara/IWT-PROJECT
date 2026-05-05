package service;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Event;
import util.dbConnection;


public class EventServices {
	
	public void insertData(Event eventt) {
	    try {
	        // Extract values from the Event object
	        String eventId = eventt.getEventId();
	        String eventName = eventt.getEventName();
	        String eventType = eventt.getEventType();
	        String clientName = eventt.getClientName();
	        String email = eventt.getEmail();
	        String phone = eventt.getPhone();
	        Date eventdate = eventt.getEventdate(); // java.sql.Date expected
	        String selPackage = eventt.getSelPackage();
	        String selServices = eventt.getSelServices();
	        String text = eventt.getText();
	        String status = eventt.getStatus();

	        // SQL insert query using PreparedStatement
	        String sql = "INSERT INTO planevent (Event_id, Event_name, event_Type, client_name, email, phone_number, date, package, services, notes, status) " +
	                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

	        PreparedStatement pstmt = dbConnection.getConnection().prepareStatement(sql);
	        pstmt.setString(1, eventId);
	        pstmt.setString(2, eventName);
	        pstmt.setString(3, eventType);
	        pstmt.setString(4, clientName);
	        pstmt.setString(5, email);
	        pstmt.setString(6, phone);
	        pstmt.setDate(7, eventdate); // Make sure this is java.sql.Date
	        pstmt.setString(8, selPackage);
	        pstmt.setString(9, selServices);
	        pstmt.setString(10, text);
	        pstmt.setString(11, status);

	        pstmt.executeUpdate(); // Execute the insert
	        pstmt.close();         // Optional: close statement
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
		
	public static List<Event> showData() {
		List<Event> eventList = new ArrayList<>();      //create a list to hold the data
		try {
			Statement stmt = dbConnection.getConnection().createStatement();
			
			//sql to fetch data
			String sql = "SELECT * FROM planevent" ;
			
			//execute sql query
			ResultSet rs = stmt.executeQuery(sql);
			
			//loop through all the rows in the result set
			while(rs.next()) {
				//create new Event object for each row
				Event ev = new Event();
				
				//set each property from database to column
				ev.setEventId(rs.getString("Event_id"));
				ev.setEventName(rs.getString("Event_name"));
				ev.setEventType(rs.getString("event_Type"));
				ev.setClientName(rs.getString("client_name"));
				ev.setEmail(rs.getString("email"));
				ev.setPhone(rs.getString("phone_number"));
				ev.setEventdate(rs.getDate("date"));
				ev.setSelPackage(rs.getString("package"));
				ev.setSelServices(rs.getString("services"));
				ev.setText(rs.getString("notes"));
				ev.setStatus(rs.getString("status"));
				
				
				//add the Event data to the Event list
				eventList.add(ev);	
			
			}
			rs.close();
			stmt.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return eventList;
		
	}
	
	
	
	
	
	
	
	public static Event getEventById(String eventId) {
	    Event ev = null;
	    try {
	    	Statement stmt = dbConnection.getConnection().createStatement();
			
	        String sql = "SELECT * FROM planevent WHERE Event_id='" + eventId + "'";
	        ResultSet rs = stmt.executeQuery(sql);

	        if (rs.next()) {
	            ev = new Event();
	            ev.setEventId(rs.getString("Event_id"));
				ev.setEventName(rs.getString("Event_name"));
				ev.setEventType(rs.getString("event_Type"));
				ev.setClientName(rs.getString("client_name"));
				ev.setEmail(rs.getString("email"));
				ev.setPhone(rs.getString("phone_number"));
				ev.setEventdate(rs.getDate("date"));
				ev.setSelPackage(rs.getString("package"));
				ev.setSelServices(rs.getString("services"));
				ev.setText(rs.getString("notes"));
				ev.setStatus(rs.getString("status"));
				
	        }

	        rs.close();
	        stmt.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return ev;
	}

	public void updateEvent(Event eventt) {
	    try {
	        Statement stmt = dbConnection.getConnection().createStatement();
	        
	        String sql = "UPDATE planevent SET " +
	                "Event_name='" + eventt.getEventName() + "', " +
	                "event_Type='" + eventt.getEventType() + "', " +
	                "client_name='" + eventt.getClientName() + "', " +
	                "email='" + eventt.getEmail() + "', " +
	                "phone_number='" + eventt.getPhone() + "', " +
	                "date='" + eventt.getEventdate() + "', " +
	                "`package`='" + eventt.getSelPackage() + "', " + // Escaped package
	                "services='" + eventt.getSelServices() + "', " +
	                "notes='" + eventt.getText() + "', " + // Added comma
	                "status='" + eventt.getStatus() + "' " + // Fixed quotes
	                "WHERE Event_id='" + eventt.getEventId() + "'";

	        stmt.executeUpdate(sql);
	        stmt.close(); // Ensure statement is closed after execution
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
	
	public void deleteData(String eventId) {
		try {
			Statement st = dbConnection.getConnection().createStatement();
			
			String sql = "DELETE FROM planevent WHERE Event_id=  '"+eventId+"'" ;
			
			System.out.println("Executing sql: " +sql);
			int rows = st.executeUpdate(sql);
			
			System.out.println("rows deleted "+rows);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
public static ResultSet showUpcommingData() {
	    
		ResultSet count1=null;

	    try {
	    	Statement st = dbConnection.getConnection().createStatement();
	        String sql = "SELECT COUNT(Event_id) FROM planevent WHERE status = 'upcomming'";
	        count1 = st.executeQuery(sql);

	        System.out.println("servise "+ count1);

	       

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    
		return count1;
	}


}
