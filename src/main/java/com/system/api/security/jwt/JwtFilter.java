//Tao lop JwtFilter Extends OncePerRequestFilter
//over lop doFilterInternal

//Kiem tra Jwt tu request gui len xem hop le hay k0 , true to endpoint
package com.system.api.security.jwt;

import java.io.Console;
import java.io.IOException;
import java.net.http.HttpRequest;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.parser.Authorization;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.web.filter.OncePerRequestFilter;

import com.system.api.servicelmpl.UserDetailServicelmpl;

import lombok.extern.slf4j.Slf4j;

import org.springframework.util.StringUtils;
@Slf4j
public class JwtFilter extends OncePerRequestFilter{

	@Autowired
	private JwtUtuil JwtUtuil;
	
	//Lop xu li  UserdetailService
	@Autowired
	private UserDetailServicelmpl customUSerDetailService;
	
	private static final Logger logger = LoggerFactory.getLogger(JwtFilter.class);
	
	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		   try {
			
			String jwt = getJwtRequest(request);    //get Token from funtion bottom getJwtRequest
			if(jwt != null && JwtUtuil.validateJwtToken(jwt) ) {  //kiem tra dk Thoa (Not Exception va Not null)
	
				String username = JwtUtuil.getUserNameFromJwtToken(jwt); //Lau thong tin username token
				
				UserDetails userDetail = customUSerDetailService.loadUserByUsername(username);//Lay thong tin user DB thong qua username token lay dc
				
				if(userDetail != null) {
					// Nếu người dùng hợp lệ, set thông tin cho Seturity Context
					UsernamePasswordAuthenticationToken authencation = new UsernamePasswordAuthenticationToken(userDetail,null,userDetail.getAuthorities());
					authencation.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
					
					SecurityContextHolder.getContext().setAuthentication(authencation);
				}
			}
			
		}catch(Exception e) {
		
			logger.error("Failed khi tiet lap user authencation in classs filter", e);
			
		}
		filterChain.doFilter(request, response);
		
	}
		
	
	//lay chuoi token
	public String getJwtRequest(HttpServletRequest request) {
		String bearerToken = request.getHeader("Authorization"); //lay token co key "Authorization"
		
		//Kiem tra xem header Authorization co chua thong tin jwt khong
		
		if (StringUtils.hasText(bearerToken) && bearerToken.startsWith("Bearer ")) {
			String token = bearerToken.substring(7); //Cut chuoi token
            return token;
        }

		return null;
	}

}
