package com.example.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.Admin;

import com.example.demo.repository.AdminRepository;

@Service
public class AdminService {
	
	@Autowired
	private AdminRepository repo;
	
	public void save(Admin msc) {
		
		  repo.save(msc);
	}
	
	public Admin retriveAdmin(String email) {
		
		 Optional<Admin> book = repo.findById(email);
		 
		    Admin mainAdmin = book.get();
		      
		    return mainAdmin;
		
		}
		
		public void update(String email , String updatedPassword) {
		       
			 Optional<Admin> admin = repo.findById(email);
			 
			 if (admin.isPresent()){
				 
				 Admin existingAdmin = admin.get();

				 existingAdmin.setPassword(updatedPassword);
				  
		            // Save the updated student object
		            repo.save(existingAdmin);
		            
	        }
		        
		 }
		
		public List<Admin> listAll(){
			
			 return repo.findAll();
		}
		

}
