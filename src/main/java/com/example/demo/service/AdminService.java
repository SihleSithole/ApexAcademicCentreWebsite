package com.example.demo.service;

import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;

@Service
public class AdminService {
    private final ConcurrentHashMap<String, HttpSession> loggedInAdmins = new ConcurrentHashMap<>();

    public boolean isAdminLoggedIn(String email) {
        return loggedInAdmins.containsKey(email);
    }

    public void logInAdmin(String email, HttpSession session) {
        loggedInAdmins.put(email, session);
    }

    public void logOutAdmin(String email) {
        loggedInAdmins.remove(email);
    }
    
    public boolean validateAdmin(String email, String password) {
    	
    	boolean  bFlag = false;
    	
    	if(email.equals("sihlesithole810@gmail.com") && password.equals("ozor101!")) {
    		
    		  bFlag = true;
    	}
    	
    	
    	return bFlag;
    }
}
