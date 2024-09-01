package com.example.demo.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.Tutor;
import com.example.demo.repository.TutorRepository;

@Service
public class TutorService {
	
	@Autowired
	private TutorRepository repo;
	
	public List<Tutor> listAll(){
		
		 return repo.findAll();
	}
	
	public void save(Tutor msc) {
		
		  repo.save(msc);
	}
	
	public void delete(Tutor msc) {
		
		repo.delete(msc);
		
	}
	
	public void update(String id , Tutor updatedTutor) {
	       
		 Optional<Tutor> tutor = repo.findById(updatedTutor.getEmail());
		 
		 if (tutor.isPresent()){
			 
			 Tutor existingTutor = tutor.get();

			    existingTutor.setFullNames(updatedTutor.getFullNames());
			   /* existingTutor.setImage(updatedTutor.getImage());*/
			    existingTutor.setPhoneNumber(updatedTutor.getPhoneNumber());
			    existingTutor.setEmail(updatedTutor.getEmail());
			    existingTutor.setAddress(updatedTutor.getAddress());
			    existingTutor.setSubjects(updatedTutor.getSubjects());
			    existingTutor.setGrades(updatedTutor.getGrades());
			    existingTutor.setSyllabus(updatedTutor.getSyllabus());
			    existingTutor.setAvailability(updatedTutor.getAvailability());
			    existingTutor.setBio(updatedTutor.getBio());
			    existingTutor.setAbout(updatedTutor.getAbout());
			    existingTutor.setHoursTutored(updatedTutor.getHoursTutored());
			    existingTutor.setBackground("Yes");
			    existingTutor.setArea(updatedTutor.getArea());

	            // Save the updated student object
	            repo.save(existingTutor);
	            
         }
	        
	 }
	
	public void updateRatings(String email , int rate) {
		
		String noSpaces = email.replaceAll("\\s+", "");
		
		 Optional<Tutor> tutor = repo.findById(noSpaces);
		 
		 if (tutor.isPresent()){
			 
			 Tutor existingTutor = tutor.get();
			 
			 int ratings = existingTutor.getRatings();
			   ratings += rate;
			 
			 existingTutor.setRatings(ratings);
			 			 
			 repo.save(existingTutor);
			 
		 }
		
	}
	
}