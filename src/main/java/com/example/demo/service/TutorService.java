package com.example.demo.service;

import java.util.List;

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
	
}