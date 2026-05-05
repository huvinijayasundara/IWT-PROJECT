package service;

import model.EventPlanner;
import util.dbConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EventPlannerService {

	// Create EventPlanner
	public boolean createEventPlanner(EventPlanner planner) throws ClassNotFoundException {
		String query = "INSERT INTO eventplanner (id,name, email, phone_no, password) VALUES (?, ?, ?, ?, ?)";
		try {
			Connection connection = dbConnection.getConnection();
			PreparedStatement stmt = connection.prepareStatement(query);
			stmt.setString(1, planner.getId());
			stmt.setString(2, planner.getName());
			stmt.setString(3, planner.getEmail());
			stmt.setString(4, planner.getPhone_no());
			stmt.setString(5, planner.getPassword());
			return stmt.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	// Get EventPlanner by ID
	public EventPlanner getEventPlanner(String id) {
		String query = "SELECT * FROM eventplanner WHERE id = ?";
		try (Connection connection = dbConnection.getConnection();
				PreparedStatement stmt = connection.prepareStatement(query)) {
			stmt.setString(1, id);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				EventPlanner planner = new EventPlanner();
				planner.setId(rs.getString("id"));
				planner.setName(rs.getString("name"));
				planner.setEmail(rs.getString("email"));
				planner.setPhone_no(rs.getString("phone_no"));
				planner.setPassword(rs.getString("password"));

				return planner;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// Get EventPlanner by Email
	public EventPlanner getEventPlannerByEmail(String email) {
		String query = "SELECT * FROM eventplanner WHERE email = ?";
		try (Connection connection = dbConnection.getConnection();
				PreparedStatement stmt = connection.prepareStatement(query)) {
			stmt.setString(1, email);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				EventPlanner planner = new EventPlanner();
				planner.setId(rs.getString("id"));
				planner.setName(rs.getString("name"));
				planner.setEmail(rs.getString("email"));
				planner.setPhone_no(rs.getString("phone_no"));
				planner.setPassword(rs.getString("password"));

				return planner;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// Get All EventPlanners
	public List<EventPlanner> getAllEventPlanners() {
		List<EventPlanner> planners = new ArrayList<>();
		String query = "SELECT * FROM eventplanner";
		try (Connection connection = dbConnection.getConnection();
				Statement stmt = connection.createStatement()) {
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				EventPlanner planner = new EventPlanner();
				planner.setId(rs.getString("id"));
				planner.setName(rs.getString("name"));
				planner.setEmail(rs.getString("email"));
				planner.setPhone_no(rs.getString("phone_no"));
				planner.setPassword(rs.getString("password"));
				planners.add(planner);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return planners;
	}

	// Update EventPlanner
	public boolean updateEventPlanner(EventPlanner planner) {
		String query = "UPDATE eventplanner SET name = ?, email = ?, phone_no = ?, password = ? WHERE id = ?";
		try (Connection connection = dbConnection.getConnection();
				PreparedStatement stmt = connection.prepareStatement(query)) {
			stmt.setString(1, planner.getName());
			stmt.setString(2, planner.getEmail());
			stmt.setString(3, planner.getPhone_no());
			stmt.setString(4, planner.getPassword());
			stmt.setString(5, planner.getId());
			return stmt.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// Delete EventPlanner
	public boolean deleteEventPlanner(String id) {
		String query = "DELETE FROM eventplanner WHERE id = ?";
		try (Connection connection = dbConnection.getConnection();
				PreparedStatement stmt = connection.prepareStatement(query)) {
			stmt.setString(1, id);
			return stmt.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}