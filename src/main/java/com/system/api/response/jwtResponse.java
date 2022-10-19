package com.system.api.response;

import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;

import lombok.*;
@Setter
@Getter
public class jwtResponse { 
	
	private String token;
	private String type="Bearer";
	private Integer id;
	private String name;
	private String email;
	private  List<String> roles;
	
   public jwtResponse() {
	
 }

public jwtResponse(String token, String type, Integer id, String name, String email, List<String> roles) {
	
	this.token = token;
	this.type = type;
	this.id = id;
	this.name = name;
	this.email = email;
	this.roles = roles;
}

public jwtResponse(String token,  Integer id, String name, String email) {
	
	this.token = token;
	
	this.id = id;
	this.name = name;
	this.email = email;
	
}

public String getToken() {
	return token;
}

public void setToken(String token) {
	this.token = token;
}

public String getType() {
	return type;
}

public void setType(String type) {
	this.type = type;
}

public Integer getId() {
	return id;
}

public void setId(Integer id) {
	this.id = id;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public List<String> getRoles() {
	return roles;
}

public void setRoles(List<String> roles) {
	this.roles = roles;
}





   	
}
