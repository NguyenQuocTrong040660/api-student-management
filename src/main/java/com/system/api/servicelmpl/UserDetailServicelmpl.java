package com.system.api.servicelmpl;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.system.api.entity.Teacher;
import com.system.api.model.TeacherDTO;
import com.system.api.repository.TeacherRepository;
import com.system.api.security.userprinciple.UserDetaillmpl;
@Service
public class UserDetailServicelmpl implements UserDetailsService {

	
	@Autowired
	private TeacherRepository  teacherRepository ;
	
	@Transactional
	
	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		    Teacher user =  teacherRepository .findByEmail(email)
		    		.orElseThrow(()->new UsernameNotFoundException("username not found in DB with"+email));
		return UserDetaillmpl.build(user);
	}

}
