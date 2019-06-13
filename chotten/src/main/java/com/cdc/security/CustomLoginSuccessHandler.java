package com.cdc.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.web.util.UriComponentsBuilder;

public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		deleteSessionAttr(request);
		
		String prevUrl = request.getHeader("referer");
		String formUrl = request.getParameter("url");
		
		String url;
		if(formUrl != null) {
			url = formUrl+makeQueryParam(request);
		}else {
			int index = prevUrl.indexOf("8080");
			url = prevUrl.substring(index+4);
		}
		
		response.sendRedirect(url);
	}
	
	private String makeQueryParam(HttpServletRequest request) {
		
		String mno = request.getParameter("mno");
		String reviewlike = request.getParameter("reviewlike");
		String page = request.getParameter("page");
		
		UriComponentsBuilder uri = UriComponentsBuilder.fromPath("")
				.queryParam("mno", mno)
				.queryParam("reviewlike",reviewlike)
				.queryParam("page", page);
		
		return uri.toUriString();
	}
	
	private void deleteSessionAttr(HttpServletRequest req) {
		req.getSession().removeAttribute("loginFail");	
	}
}
