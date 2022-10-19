package com.system.api.controller;

import java.util.*;
import java.util.stream.Collectors;

import javax.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.system.api.repository.TeacherRepository;
import com.system.api.request.LoginRequest;
import com.system.api.request.SignUpForm;
import com.system.api.response.jwtResponse;
import com.system.api.response.messageResponse;
import com.system.api.security.jwt.JwtUtuil;
import com.system.api.security.userprinciple.UserDetaillmpl;
import com.system.api.service.StudentService;
import com.system.api.service.TeacherService;
import com.system.api.entity.ERole;
import com.system.api.entity.Role;
import com.system.api.entity.Student;
import com.system.api.entity.Teacher;
import com.system.api.model.StudentDTO;
import com.system.api.model.TeacherDTO;
import com.system.api.repository.RoleRepository;
import lombok.ToString;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
@RestController
@CrossOrigin("*")
@ToString
@RequestMapping("/api/v1/auth")
public class Authencation {
	
	@Autowired
	private ModelMapper modelMapper;

	@Autowired
	private TeacherService teacherService;
	
    //convert Entity => DTO
	public TeacherDTO convertIntoDto(Teacher teacher) {

		TeacherDTO teacherDTO = modelMapper.map(teacher, TeacherDTO.class);
		return teacherDTO;
	}

	//convert DTO => Entity
	public Teacher convertIntoEntity(TeacherDTO teacherDTO) {
		Teacher teacher = modelMapper.map(teacherDTO, Teacher.class);
		return teacher;
	}
	
	
	@Autowired
	private AuthenticationManager AuthenticationManager; // from webconfig == @Bean
	
	@Autowired
	private TeacherRepository teacherRepository;
	
	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
	private PasswordEncoder passwordencode;// from webconfig == @Bean
	
	@Autowired 
	private JwtUtuil JwtUtuil;
	
	
	@PostMapping(path="/login")
	public ResponseEntity<?> loginUser(@Valid @RequestBody LoginRequest loginForm){
		
		//Xac Thuc tu username va password
		
		Authentication authentication = AuthenticationManager.authenticate(
				new UsernamePasswordAuthenticationToken(loginForm.getEmail(),loginForm.getPassword()));
		
		//Neu ko xay ra exception tuc la hople
		//Set Thong Tn authentication vao Security Context
		
		SecurityContextHolder.getContext().setAuthentication(authentication);
		
		//Tra ve JWT cho nguoi dung
		String jwt = JwtUtuil.createJwtToken(authentication);
		System.out.println("Token:"+jwt);
		
		//lay thong tin UserDetail
		UserDetaillmpl userDetail =  (UserDetaillmpl) authentication.getPrincipal();//lay username va passwork role id
		
		//Lay role va stranfer data->tolist
		System.out.println("\n serDetail:"+userDetail);
	    List<String> role = userDetail.getAuthorities().stream()
				.map(item->item.getAuthority())
				.collect(Collectors.toList());
		System.out.println("Role:"+role);
		
		return ResponseEntity.ok(new jwtResponse
				       (jwt,
						userDetail.getId(),
						userDetail.getUsername(),
						userDetail.getEmail()
						
						
						
						));
		
	
		}
	
	
	@PostMapping("/register")
	public ResponseEntity<?> register(@Valid  @RequestBody SignUpForm teacherDTO )

	{
		
		if(teacherRepository.existsByEmail(teacherDTO.getEmail())) {
			return ResponseEntity.badRequest().body(new messageResponse("Email Signup da ton tai"));
		}
		
		 
		//Tao 1 Account cho user
		Teacher user = new Teacher(teacherDTO.getTeacherName(),teacherDTO.getBirthDate(),teacherDTO.isGender(),
				teacherDTO.getAddress(),teacherDTO.getEmail(),passwordencode.encode(teacherDTO.getPassword()),teacherDTO.getPhone(),
				teacherDTO.isStatus());
				
		
		//lay value(role) khi sigupFrom
		Set<String> strRole = teacherDTO.getRole();
		
		//Thiet lap roles map den Role de thuc hien cac funtion add remove inser...
		Set<Role> roles = new HashSet<>();
		
		if(strRole == null) {
			Role sig_default_role = roleRepository.findByName(ERole.ROLE_USER)
					.orElseThrow(()->new RuntimeException("error")); //return exception 
			roles.add(sig_default_role);
		
		}else {
			
			strRole.forEach(role ->{    //duyet qua tat ca-for
				switch (role) { 
				case "ROLE_ADMIN":  
					Role sig_admin_role = roleRepository.findByName(ERole.ROLE_ADMIN)
					.orElseThrow(()->new RuntimeException("error")); //return exception 
			         roles.add(sig_admin_role);
					
					break;
					
				case "ROLE_PM":
					Role sig_pm_role = roleRepository.findByName(ERole.ROLE_PM)
					.orElseThrow(()->new RuntimeException("error")); //return exception 
			         roles.add(sig_pm_role);
					
					break;
					
				
					
				}
			});
			
		}
		//luu lai gia tri role trong user
		
		user.setRoles(roles);
		Teacher userRegister= teacherRepository.save(user);
		
		return ResponseEntity.ok(new messageResponse("Register sucessfuly!!"));
		
	}
  
}


