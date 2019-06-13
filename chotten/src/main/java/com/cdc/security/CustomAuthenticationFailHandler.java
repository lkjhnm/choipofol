package com.cdc.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class CustomAuthenticationFailHandler implements AuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {

		
		String prevUrl = request.getHeader("referer");
		String url;
		
		int index = prevUrl.indexOf("8080");
		url = prevUrl.substring(index+4);
		
		request.getSession().setAttribute("loginFail", true);
		response.sendRedirect(url);
	}

}
