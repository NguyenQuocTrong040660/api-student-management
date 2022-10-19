//tạo một JWTtừ tên người dùng, ngày tháng, ngày hết hạn(expirration),sercet
// Lay ten nguoi dung jwt
//xac nhan mot jwt

package com.system.api.security.jwt;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;

import com.system.api.security.userprinciple.UserDetaillmpl;

import io.jsonwebtoken.*;

@Component
public class JwtUtuil {

	public static final Logger logger = LoggerFactory.getLogger(JwtUtuil.class);
	
	@Value("${trong.app.jwtSecret}")
	private String jwtSecret;
	
	//time hieu luc chuoi jwt
	@Value("${trong.app.jwtExpirationMs}")
	private int jwtExpirationMs;
	
	//tao jwt tu thong tin user
	public String createJwtToken(Authentication authentication) {
		UserDetaillmpl userPrincipal =  (UserDetaillmpl) authentication.getPrincipal();//lay username va passwork
		System.out.println(userPrincipal);
		
		//tao jwt token tu user
		return Jwts.builder().setSubject((userPrincipal.getEmail()))
				.setIssuedAt(new Date())  
				.setExpiration(new Date((new Date()).getTime() + jwtExpirationMs))
				.signWith(SignatureAlgorithm.HS512, jwtSecret)
				.compact();
	}
	
	//Lay thong tin user tu jwt
	public String getUserNameFromJwtToken(String token) {
		String username = Jwts.parser().setSigningKey(jwtSecret).parseClaimsJws(token).getBody().getSubject();
		
		return username;
				
	}
	
	//Try Cach tu parseClaimsJws
	public boolean validateJwtToken(String authToken) {
		try {
			Jwts.parser().setSigningKey(jwtSecret).parseClaimsJws(authToken);
			return true;
			
		}catch(SignatureException e) {
			logger.error("Invalid JWT signature: {}", e.getMessage());
			
		}catch (MalformedJwtException e) {
			logger.error("Invalid JWT token: {}", e.getMessage());
		} catch (ExpiredJwtException e) {
			logger.error("JWT token is expired: {}", e.getMessage());
		} catch (UnsupportedJwtException e) {
			logger.error("JWT token is unsupported: {}", e.getMessage());
		} catch (IllegalArgumentException e) {
			logger.error("JWT claims string is empty: {}", e.getMessage());
		}
		
		
		return false;
	}
	
	
	
	
}
