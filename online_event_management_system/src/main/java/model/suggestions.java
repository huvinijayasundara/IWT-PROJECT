package model;

public class suggestions  {

	String suggestions;
	int eventID;
	
	public suggestions(int id,String suggestions) {
		
        this.eventID= id;
		this.suggestions = suggestions;
	}

	public String getSuggestions() {
		return suggestions;
	}

	public void setSuggestions(String suggestions) {
		this.suggestions = suggestions;
	}

	public int getEventID() {
		return eventID;
	}

	public void setEventID(int eventID) {
		this.eventID = eventID;
	}

	
	
}
