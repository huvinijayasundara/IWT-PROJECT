package model;

public class Admin {


		private int supId;
		private String name;
		private String address;
		private String phone;
		private String email;
		private String userName;
		private String password;
		private String role;
		
		public Admin(int supId, String name, String address, String phone, String email, String userName,String password , String role) {
		
			this.supId = supId;
			this.name = name;
			this.address = address;
			this.phone = phone;
			this.email = email;
			this.userName = userName;
			this.password = password;
			this.role = role;
		}


		public String getRole() {
			return role;
		}


		public void setRole(String role) {
			this.role = role;
		}


		public int getSupId() {
			return supId;
		}


		public String getName() {
			return name;
		}


		public String getAddress() {
			return address;
		}


		public String getPhone() {
			return phone;
		}


		public String getEmail() {
			return email;
		}


		public String getUserName() {
			return userName;
		}


		public String getPassword() {
			return password;
		}	
		
}