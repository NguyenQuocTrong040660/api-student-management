//Do Spring Security su dung <>tg UserDetail de chua toan bo thong tin nguoi dung
//=> Can chuyen User Sang USerDetailthong qua lop thua ke no UserDetaillmpl

package com.system.api.security.userprinciple;

import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.system.api.entity.Teacher;
import com.system.api.model.TeacherDTO;

import java.util.*;

public class UserDetaillmpl implements UserDetails {
	private Integer id;
	private String username;
	private String email;
	
	@JsonIgnore 
	private String password;
	
    private Collection<?  extends GrantedAuthority> role;
    
    
	
	public UserDetaillmpl(Integer id, String username, String email, String password,
			Collection<? extends GrantedAuthority> role) {
		
		this.id = id;
		this.username = username;
		this.email = email;
		this.password = password;
		this.role = role;
	}
	
	 
	
	
	
	//xay dung build
	public static UserDetaillmpl build(Teacher user) {
		
		/*Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
	    Set<Role> roles = user.getRoles();
	    for (Role role : roles) {
	    	
	        grantedAuthorities.add(new SimpleGrantedAuthority(role.getName().name()));
	    }*/
		List<GrantedAuthority> authorities = user.getRoles().stream().map(roles->new SimpleGrantedAuthority(roles.getName().name()))
				.collect(Collectors.toList());
		return new UserDetaillmpl(
				user.getId(), 
				user.getTeacherName(), 
				user.getEmail(), 
				user.getPassword(),
				authorities);
	}

	
	
	@Override
	public String toString() {
		return "UserDetaillmpl [id=" + id + ", username=" + username + ", email=" + email + ", password=" + password
				+ ", role=" + role + "]";
	}


	

	public Integer getId() {
		return id;
	}
	
	public String getEmail() {
		return email;
	}
	
	
	@Override
	public String getPassword() {
		
		return password;
	}

	@Override
	public String getUsername() {
		
		return username;
	}

	@Override
	public boolean isAccountNonExpired() {
		
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		
		return true;
	}

	@Override
	public boolean isEnabled() {
		
		return true;
	}
	@Override
	public boolean equals(Object o) {
		if (this == o)
			return true;
		if (o == null || getClass() != o.getClass())
			return false;
		UserDetaillmpl user = (UserDetaillmpl) o;
		return Objects.equals(id, user.id);
	}





	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		
		return role;
	}

	
	
}
