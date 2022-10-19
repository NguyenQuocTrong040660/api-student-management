package com.system.api.security.jwt;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.system.api.servicelmpl.UserDetailServicelmpl;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(
		prePostEnabled = true)

public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
      
	@Autowired
	private UserDetailServicelmpl UserDetailService;
	
	@Autowired
	private JwtEntypoint JwtEntypoint;
	
	@Bean
	public JwtFilter AuthencationFilter() {
		
		return new JwtFilter();
		
	}
	
	//encoder passwork user
	@Bean
	PasswordEncoder passwordEncoder() {
			
	 return new BCryptPasswordEncoder();
		}
		
	
	@Override
	public void configure(AuthenticationManagerBuilder ath) throws Exception {
		ath.userDetailsService(UserDetailService) // Cung cáp userservice cho spring security
		.passwordEncoder(passwordEncoder());     //cung cấp password encoder
	}
	
	
	
	@Bean
	@Override
	public AuthenticationManager authenticationManagerBean() throws Exception {
		return super.authenticationManagerBean();
	}
	

	
	
	@Override
	protected void configure(HttpSecurity http) throws Exception{
		http.cors().and().csrf().disable()
		.exceptionHandling().authenticationEntryPoint(JwtEntypoint).and()
		.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS).and()
		.authorizeRequests().antMatchers("/api/v1/auth/**").permitAll()
		.antMatchers("/api/v1/").hasRole("USER")
		.antMatchers("/api/v1/checkRoleAmin").hasRole("ADMIN")
		.anyRequest().authenticated();
		http.authorizeRequests().and().exceptionHandling().accessDeniedPage("/403");
		
		// Thêm một lớp Filter kiểm tra jwt
		http.addFilterBefore(AuthencationFilter(), UsernamePasswordAuthenticationFilter.class);
	}  
    }
	
	

