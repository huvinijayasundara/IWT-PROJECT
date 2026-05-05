package model;

public class Services {

	private int id;
	private String title;
	private String category;
	private double price;
	private String description;
	//private String image;
	
	public Services(int id, String title, String category, double price, String description) {
		super();
		this.setId(id);
		this.title = title;
		this.category = category;
		this.price = price;
		this.description = description;
		//this.image = image;
	}

	public String getTitle() {
		return title;
	}

	public String getCategory() {
		return category;
	}

	public double getPrice() {
		return price;
	}

	public String getDescription() {
		return description;
	}

	/*public String getImage() {
		return image;
	}*/

	public void setTitle(String title) {
		this.title = title;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	/*public void setImage(String image) {
		this.image = image;
	}*/
	
	
	
}
