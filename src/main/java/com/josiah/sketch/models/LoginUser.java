package com.josiah.sketch.models;

import javax.validation.constraints.NotEmpty;

public class LoginUser {
	
//	@NotEmpty(message="Email is required!")
//    @Email(message="Please enter a valid email!")
//    private String email;
    
	@NotEmpty(message="Username is required!") 
//    @Pattern(regexp="^[A-Za-z]*$",message = "Invalid Input")
//    @Size(min=3, max=30, message="Username must be between 3 and 30 characters")
    private String userName;
	
    @NotEmpty(message="Password is required!")
//    @Size(min=8, max=128, message="Password must be between 8 and 128 characters")
    private String password;
    
    public LoginUser() {}

//	public String getEmail() {
//		return email;
//	}
//
//	public void setEmail(String email) {
//		this.email = email;
//	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

}
