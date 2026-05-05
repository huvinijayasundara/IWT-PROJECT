package model;

public class userEvent {
	
	int id;
	String type;
	String date;
	int guests;
	String location;
	String theme;
	String services;
	String uname;
	
	
	
	public userEvent(int id, String type, String date, int guests, String location, String theme, String services,String uname) {
		this.id = id;
		this.type = type;
		this.date = date;
		this.guests = guests;
		this.location = location;
		this.theme = theme;
		this.services = services;
		this.uname = uname;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getGuests() {
		return guests;
	}
	public void setGuests(int guests) {
		this.guests = guests;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getTheme() {
		return theme;
	}
	public void setTheme(String theme) {
		this.theme = theme;
	}
	public String getServices() {
		return services;
	}
	public void setServices(String services) {
		this.services = services;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	

}
