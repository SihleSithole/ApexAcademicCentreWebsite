package com.example.demo.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.Tutor;
import com.example.demo.service.TutorService;

@Controller
public class PageController {
	
	 @Autowired
	 private TutorService tutorService;

	@GetMapping("/")
	public String bookingTutor() {	
		  return "chooseTutor.jsp";
	}
	
	@GetMapping("/admin")
	public ModelAndView adminDashboard() {
		
		List<Tutor> tutor = tutorService.listAll();
		ModelAndView data = new ModelAndView("adminDashboard.jsp");// load the admin dashboard
		data.addObject("tutors" , tutor);
		
		return data;
		
	}
	
	 @PostMapping("/addTutor")//only admin have access
		public String addTutor(@RequestParam("name") String name,
								@RequestParam("id") String id,
								@RequestParam("image") MultipartFile image,
								@RequestParam("address") String address,
								@RequestParam("phone") String phone,
								@RequestParam("email") String email) throws IOException 
		{
		 
		    byte[] imageData = image.getBytes();

		    Tutor tutor = new Tutor(id,name,"sithole",phone,email,address,true,imageData);
		      
		    tutorService.save(tutor);
		   
			return "redirect:/admin"; // Redirect to adminDashBoard
		 
		 
		 
		}
	
	
}
