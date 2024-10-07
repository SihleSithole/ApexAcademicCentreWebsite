package com.example.demo.controller;

import java.io.IOException;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.example.demo.model.Booking;
import com.example.demo.model.Review;
import com.example.demo.model.Tutor;
import com.example.demo.repository.TutorRepository;
import com.example.demo.service.AdminService;
import com.example.demo.service.BookingService;
import com.example.demo.service.EmailSenderService;
import com.example.demo.service.ReviewService;
import com.example.demo.service.TutorService;


import jakarta.servlet.http.HttpServletRequest;

import jakarta.servlet.http.HttpSession;

@Controller
public class PageController {
	

	
	@Autowired
	private EmailSenderService senderService;
	
    @Autowired         
    private HttpServletRequest request;
	
	 @Autowired
    private TutorService tutorService;
	 
	 @Autowired
	 private BookingService bookingService;
	 
	 @Autowired
	 private ReviewService reviewService;
	 
	 @Autowired
	 private AdminService adminService;
	 
	 @Autowired
	 private TutorRepository tutorRepo;

	@GetMapping("/")
	public ModelAndView bookTutorPage() {
	    // Retrieve the list of tutors
	    List<Tutor> tutors = tutorService.listAll();
	    
	    // Sort the list in descending order based on hoursTutored
	    Collections.sort(tutors, new Comparator<Tutor>() {
	        @Override
	        public int compare(Tutor t1, Tutor t2) {
	            return Integer.compare(t2.getRatings(), t1.getRatings());
	        }
	    });
	    
	    // Create and populate ModelAndView
	    ModelAndView data = new ModelAndView("tutorsLandingPage.jsp");
	    data.addObject("tutors", tutors);
	    
	    return data;
	}
	
	
	@GetMapping("/admin")
       public ModelAndView adminDashboard(HttpSession session) {
		    String email = (String) session.getAttribute("adminEmail");
		    if (email == null || !adminService.isAdminLoggedIn(email)) {
		        return new ModelAndView("loginAdmin.html"); // Redirect to login if not logged in
		    }
		
		System.out.println(email);
		
		List<Tutor> tutor = tutorService.listAll();
		List<Booking> booking = bookingService.listAll();
		List<Review> reviews = reviewService.listAll();
		
		if(email.equals("sihlesithole810@gmail.com")) {
		
		ModelAndView data = new ModelAndView("adminDashboard.jsp");// load the admin dashboard
		data.addObject("tutors" , tutor);
		data.addObject("bookings", booking);
		data.addObject("reviews", reviews);
				
		return data;
		
		}
		
		else {
			
			ModelAndView data = new ModelAndView("loginAdmin.html");// login first
		
				
			return data;
			
			
		}
	}
	

	 @PostMapping("/addTutor")//only admin have access
		public String addTutor(@RequestParam("profile") MultipartFile profile , @RequestParam("hiddenName")  String name ,
				@RequestParam("hiddenID") String id , @RequestParam("hiddenEmail") String email ,
				@RequestParam("hiddenPhone") String phone , @RequestParam("hiddenSubjects") String subjects ,
				@RequestParam("hiddenGrades") String grades , @RequestParam("hiddenSyllabus") String syllabus ,
				@RequestParam("tutorOption") String tutorOption , @RequestParam("hiddenAddress") String address,
				@RequestParam("bio") String qualification , @RequestParam("about") String about,
				@RequestParam("hours") String bio , @RequestParam("hiddenArea") String area, @RequestParam("hiddenCountry") String country , @RequestParam("hiddenIdentity") String dob , @RequestParam("hiddenSurname") String surname ,@RequestParam("hiddenModules") String hiddenModules) throws IOException, ParseException 
		{
		 
		 System.out.println(hiddenModules);
		 
		 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		 Date date = dateFormat.parse(dob);
		 
           byte[] imageData = profile.getBytes();
                
		   Tutor tutor = new Tutor(email,name,id,phone,subjects,grades,address,tutorOption,qualification,about,bio,imageData,syllabus,area,country,date,surname,hiddenModules);
		      
		    tutorService.save(tutor); 
		    
		    String serverName = request.getServerName();
		    int serverPort = request.getServerPort();
		    String protocol = request.getScheme();
		    String host = protocol + "://" + serverName + ":" + serverPort;

	        String reviewLink = host + "/review-ratings?email=" + email;
	        
	        String sHeading = "Dear " + name;
	        
		   
			senderService.sendSimpleEmail(email, "Tutor Registration Approval" ,
			sHeading+",\n\nCongratulations! You have been successfully added to the Apex Academic Centre website. We are confident that you will deliver exceptional service to our clients.\r\n"
					+ "\r\n"
					+ "Clients can book your services directly through our website, and we will also assign clients to you via email. To enhance your profile and increase visibility, please share the link below with your students, so they can leave reviews about your services on our website. These reviews will make your profile more attractive to potential clients and increase your chances of being recommended.\n\n Link: " + reviewLink + "\n\nThank you for joining our team, and we look forward to your success!");
		   
			 return "redirect:/admin"; // Redirect to adminDashBoard
		 
 
		}
	 
	 @PostMapping("/deleteTutor")
     public String deleteTutor(@RequestParam("deleteEmail") String email ) {
		 
		 Tutor tutor = new Tutor();
		    tutor.setEmail(email);
		      tutorService.delete(tutor);
		 	 
		 return "redirect:/admin";
		 
	 }
	 
	 @PostMapping("/editTutor")//only admin have access
		public String updateTutor(@RequestParam("editprofile") MultipartFile profile , @RequestParam("edithiddenName")  String name 
				, @RequestParam("edithiddenEmail") String email ,
				@RequestParam("edithiddenPhone") String phone , @RequestParam("edithiddenSubjects") String subjects ,
				@RequestParam("edithiddenGrades") String grades , @RequestParam("edithiddenSyllabus") String syllabus ,
				@RequestParam("edittutorOption") String tutorOption , @RequestParam("edithiddenAddress") String address,
				@RequestParam("editbio") String bio , @RequestParam("editabout") String about,
				@RequestParam("edithours") String hours , @RequestParam("edithiddenArea") String area  ) throws IOException 
		{
		 
		 		 
           byte[] imageData = profile.getBytes();
		    
           Tutor tutor = new Tutor();
           tutor.setEmail(email);
		    tutor.setFullNames(name);
		    tutor.setImage(imageData);
		    tutor.setPhoneNumber(phone);
		    tutor.setEmail(email);
		    tutor.setAddress(address);
		    tutor.setSubjects(subjects);
		    tutor.setGrades(grades);
		    tutor.setSyllabus(syllabus);
		    tutor.setBio(bio);
		    tutor.setAbout(about);
		    tutor.setHoursTutored(hours);
		    tutor.setAvailability(tutorOption);
		    tutor.setArea(area);
           
    
		    tutorService.update(email, tutor);
		    
		   
			return "redirect:/admin"; // Redirect to adminDashBoard
		 
 
		}
	 
	 
	 @PostMapping("/searchTutor")
	 @ResponseBody
	 public Tutor searchTutor(@RequestBody Map<String, String> requestBody) {
	
		 String email = requestBody.get("searchEmail");
		 System.out.println(email);
		 
		 Optional<Tutor> opT = tutorRepo.findById(email);
		 Tutor tutor = new Tutor();
		 
		 if (opT.isPresent()){
			 
			 System.out.println("SIMTHOLILE");
			 
			 tutor = opT.get();

		 }
		
		 return tutor;
		 
	 }
	 
	 @PostMapping("/booking")
	    public ModelAndView placeBooking(@RequestBody Map<String, String> booking, HttpSession session) {
	        
		             /*Amount*/
	        String amount = booking.get("amount");
	        
	                 /**first-form**/
		    String name = booking.get("first-name");
		    String surname = booking.get("last-name");
		    String email = booking.get("email");
		    String phone = booking.get("phone");
		    String province = booking.get("province");
		    String country = booking.get("country");
		    String instrLangauge = booking.get("language");
		    
		            /*second form*/
		    String tutorFor = booking.get("tutoring-for");
		    String helpWith = booking.get("help-with");

		 
	                  /*school*/
		    
		    String learnerName = "N/A";
		    String learnerSurname = "N/A";
		    String grade = "N/A";
		    String syllabus = "N/A";
		    
		            /*university*/
		    
		    String studentName = "N/A";
		    String studentSurname = "N/A";
		    String year ="N/A";
		    String postGrad = "N/A";

		    
		    if(helpWith.equals("school")) {
		    	
		    	 learnerName = booking.get("student-name");
		    	 learnerSurname = booking.get("student-last-name");
		    	 grade = booking.get("grade");
		    	 syllabus = booking.get("syllabus");
		    }
		    
		    else {
		    	
			    studentName = booking.get("stud-name");
			    studentSurname = booking.get("stud-last");
			    year = booking.get("year");
			    postGrad = booking.get("postgrad-type");
		    	
		    }
		    

		    /*third form*/
		    
		    String subject =  booking.get("subject");
		    String onlineInperson =  booking.get("tutor-style");
		    String suburb =  "N/A";
		    String toStart = "N/A";
		    
		    if(!onlineInperson.equals("Online")) {
		    	
			    suburb =  booking.get("suburb-inperson");
			    toStart =  booking.get("address-inperson");
		    	
		    }
 
		    /*fourth form*/
		    String message = booking.get("message");
		    
		    if(message.equals("")) {
		    	
		    	message = "nothing...";
		    
		    }
		    
		    String secTutor = booking.get("tutor-option");
		    String tutorName = booking.get("hiddenTutorName");
		    String tutorEmail = booking.get("hiddenTutorEmail");

		    
		    
		    if(tutorName.equals("undefined")) {
		    	
		    	  tutorName = "N/A";
		    	  tutorEmail = "N/A";
		    	  
		    	  
		    	 
		    }
		    		    
		    String packageType = booking.get("package");
		    String sessions = booking.get("sessions");
		    
	        // Create or update session attributes
	        session.setAttribute("bookings", booking);
	        session.setAttribute("amount", amount);
		    session.setAttribute("name", name);
		    session.setAttribute("surname", surname);
		    session.setAttribute("email", email);
		    session.setAttribute("phone", phone);
		    session.setAttribute("province", province);
		    session.setAttribute("country", country);
		    session.setAttribute("instrLangauge", instrLangauge);
		    session.setAttribute("tutorFor", tutorFor);
		    session.setAttribute("helpWith", helpWith);
		    session.setAttribute("learnerName", learnerName);
		    session.setAttribute("learnerSurname", learnerSurname);
		    session.setAttribute("grade", grade);
		    session.setAttribute("syllabus", syllabus);
		    session.setAttribute("studentName", studentName);
		    session.setAttribute("studentSurname", studentSurname);
		    session.setAttribute("year", year);
		    session.setAttribute("postGrad", postGrad);
		    session.setAttribute("subject", subject);
		    session.setAttribute("onlineInperson", onlineInperson);
		    session.setAttribute("suburb", suburb);
		    session.setAttribute("toStart", toStart);
		    session.setAttribute("secTutor", secTutor);
		    session.setAttribute("tutorName", tutorName);
		    session.setAttribute("tutorEmail", tutorEmail);
		    session.setAttribute("packageType", packageType);
		    session.setAttribute("message", message);
		    session.setAttribute("sessions", sessions);

	        // Return the view name without the .jsp extension
	        ModelAndView data = new ModelAndView("payment"); // View name without the .jsp extension
	        data.addObject("bookings", booking);
	        data.addObject("amount", amount);	      
	        
	        
	        /* Send email to tutor (if needed)
	        senderService.sendSimpleEmail(tutorEmaill, subject ,
	            "Name : " + name + "\nEmail : " + email + "\nLink : " + bookingLink);
	        */
	        
	        return data;
	    }
	 
	 @PostMapping("/other-booking")
	 @ResponseBody
	    public void otherBooking(@RequestBody Map<String, String> booking) {
	        

		 System.out.println("We here - Send the email");
		 
		    String name = booking.get("first-name");
		    String surname = booking.get("last-name");
		    String email = booking.get("email");
		    String phone = booking.get("phone");
		    String province = booking.get("province");
		    String country = booking.get("country");
		    String instrLangauge = booking.get("language");
		    String tutorFor = booking.get("tutoring-for");
		    String helpWith = booking.get("help-with");

		    
		    String schName = "n/a";
		    String schSurname = "n/a";
		    String schGrade = "n/a";
		    String schSyllabus = "n/a";
		    String unName = "n/a";
		    String unSurname = "n/a";
		    String unYear = "n/a";
		    
		    if(helpWith.equals("school")){

		        schName = booking.get("student-name");
		        schSurname = booking.get("student-last-name");
		        schGrade = booking.get("grade");
		        schSyllabus = booking.get("syllabus");

		    }

		    else{

		         unName = booking.get("stud-name");
		         unSurname = booking.get("stud-last");
		         unYear = booking.get("year");

		    }
		    
		    String subject = booking.get("subject");
		    String tutorStyle = booking.get("tutor-style");

		    String address = "n/a";
		    String suburb = "n/a";

		    if(tutorStyle.equals("In Person")){

		         address = booking.get("address-inperson");
		         suburb = booking.get("suburb-inperson");
		    }

		    String message = booking.get("message");
		    if(message.equals("")){
		        message = "n/a";
		    }
		    
		     String tutorOption = booking.get("tutor-option");
		     String status = booking.get("who");
		     String userPackage = "Not Selected";
		     
		     
			    String tutorName = booking.get("hiddenTutorName");
			    String tutorEmail = booking.get("hiddenTutorEmail");

			    
			    
			    if(tutorName.equals("undefined")) {
			    	
			    	  tutorName = "Apex Tutor";
			    	  tutorEmail = "apexexcellencetutors@gmail.com";
			    	  
			    	  
			    	 
			    }
		     
		     String isPaid = "No";
		     
		     Booking bookings = new Booking( name,  surname,  email,  phone,  province,  country,
		    		 instrLangauge,  tutorFor,  helpWith,  schName,  schSurname,  schGrade,
					 schSyllabus,  unName,  unSurname,  unYear,  subject,  tutorStyle,
					 address,  suburb,  message,  tutorOption,  status,  userPackage,
					 tutorName,  tutorEmail,  isPaid , "not paid" , "0");
		     
		     String sendName = "";
		     String clientName = name + " " + surname;
		     
		     if(schName.equals("n/a")) {
		    	 
		    	 sendName = unName + " " + unSurname;
		     }
		     
		     else {
		    	 
		    	 sendName = schName + " " + schSurname;
		    	 
		     }
		     
		     
		     bookingService.save(bookings);
		     
		 
	        // SEND EMAIL TO CLIENT
	         
	            senderService.sendSimpleEmail(email, "Apex Academic Centre - Tutor Booking" ,
	            "Dear " + clientName + ",\r\n"
	            + "\r\n"
	            + "\r\n"
	            + "Thank you for considering Apex Academic Centre for " + sendName  +"'s educational needs. We appreciate your inquiry about our one-on-one [in-person/online] tutoring services for " + subject + ".\r\n"
	            + "\r\n"
	            + "\r\n"
	            + "Our consultants will promptly contact you to discuss " + sendName  +"'s requirements and match them with a suitable tutor.\r\n"
	            + "\r\n"
	            + "\r\n"
	            + "Best regards,\r\n"
	            + "Apex Academic Centre");
	        
	            /*   SEND EMAIL TO APEX  */
	            
			    Long entryId = bookings.getEntry();
			    
			    String serverName = request.getServerName();
			    int serverPort = request.getServerPort();
			    String protocol = request.getScheme();
			    String host = protocol + "://" + serverName + ":" + serverPort;

		        String bookingLink = host + "/booking-details?id=" + entryId;
	            
	            if(status.equals("consult")) {
	            	
	            	senderService.sendSimpleEmail(tutorEmail, 
		            	    "New Tutor Request - " + clientName, 
		            	    "Dear Apex Academic Centre Team,\r\n" +
		            	    "\r\n" +
		            	    "We have received a tutoring inquiry from " + clientName + ", who has filled out our Book A Tutor form.\r\n" +
		            	    "\r\n" +
		            	    "Please review the details of their request here: " + bookingLink + "\r\n" +
		            	    "\r\n" +
		            	    "We kindly request that you contact " + clientName + " to schedule a consultation and discuss their tutoring needs.\r\n" +
		            	    "\r\n" +
		            	    "Thank you for your prompt attention.\r\n" +
		            	    "\r\n" +
		            	    "Best regards,\r\n" +
		            	    "Admin"
		            	);
	            	
	            }
		     
		   


	            
	        
	         
	    }
	 
	 
	 @PostMapping("/pushBooking")
	 @ResponseBody
	 public void placeBooking(@RequestBody Map<String, String> booking) {
		 
		    String name = booking.get("name");
		    String surname = booking.get("surname");
		    String email = booking.get("email");
		    String phone = booking.get("phone");
		    String province = booking.get("province");
		    String country = booking.get("country");
		    String instrLangauge = booking.get("instrLangauge");
		    String tutorFor = booking.get("tutorFor");
		    String helpWith = booking.get("helpWith");
		    String schName = booking.get("schName");
		    String schSurname = booking.get("schSurname");
		    String schGrade = booking.get("schGrade");
		    String schSyllabus = booking.get("schSyllabus");
		    String unName = booking.get("unName");
		    String unSurname = booking.get("unSurname");
		    String unYear = booking.get("unYear");
		    String status = "pending";
		    String subject =  booking.get("subject");
		    String tutorStyle =  booking.get("tutorStyle");
		    String address =  booking.get("address");
		    String suburb =  booking.get("suburb");
		     String tutorOption =  booking.get("tutorOption");
		     String message = booking.get("message");
		     String userPackage = booking.get("userPackage");
		     String tutorName = booking.get("tutorName");
		     String tutorEmail = booking.get("tutorEmail");
		     String isPaid = "Yes";
		     
		     Booking bookings = new Booking( name,  surname,  email,  phone,  province,  country,
		    		 instrLangauge,  tutorFor,  helpWith,  schName,  schSurname,  schGrade,
					 schSyllabus,  unName,  unSurname,  unYear,  subject,  tutorStyle,
					 address,  suburb,  message,  tutorOption,  status,  userPackage,
					 tutorName,  tutorEmail,  isPaid , "not paid" , "0");
		     
		     String sendName = "";
		     String clientName = name + " " + surname;
		     
		     if(schName.equals("n/a")) {
		    	 
		    	 sendName = unName + " " + unSurname;
		     }
		     
		     else {
		    	 
		    	 sendName = schName + " " + schSurname;
		    	 
		     }
		     
		     
		     bookingService.save(bookings);
			    
			    Long entryId = bookings.getEntry();
			    String tutorEmaill = bookings.getTutorEmail();
			    
			    String serverName = request.getServerName();
			    int serverPort = request.getServerPort();
			    String protocol = request.getScheme();
			    String host = protocol + "://" + serverName + ":" + serverPort;

		        String bookingLink = host + "/booking-details?id=" + entryId;
		        
			    /*Send email to tutor*/
				senderService.sendSimpleEmail(tutorEmaill, "Booking-info: " + subject ,
				"Dear " + tutorName + "\n\nWe're pleased to inform you that [" +  name + " " + surname + "] has booked your services to support their child, [" + sendName + "]. We're thrilled to have you on board and are confident in your ability to provide exceptional guidance and support.\r\n"
						+ "\r\n"
						+ "To confirm your booking, please review the details at the link below and ACCEPT within 24 hours. If you're unavailable or need to reschedule, please notify us immediately so we can arrange a suitable replacement tutor.\r\n"
						+ "\r\n"
						+ "Link : " + bookingLink + "\r\n"
						+ "\r\n"
						+ "Thank you for your cooperation and expertise. We look forward to a successful collaboration!\r\n"
						+ "\r\n"
						+ "Best regards,\r\n"
						+ "Apex Academic Centre");
				
				
			    /*Send email to the student who book tutor*/
				senderService.sendSimpleEmail(email, "Apex Tutor booking : no-reply" ,
				"Dear " + clientName + "\n\nThank you for choosing " + tutorName + "! We're thrilled to have them work with " + sendName + " and are confident they will receive exceptional guidance and support in " + subject + ".\r\n"
						+ "\r\n"
						+ "Next Steps:\r\n"
						+ "\r\n"
						+ "- " + tutorName + " will contact you within the next 24 hours to introduce themselves and discuss a personalized lesson plan.\r\n"
						+ "- Please note that if " + tutorName + " is unavailable for any reason or needs to reschedule, we have a secondary tutor available to ensure continuity.\r\n"
						+ "\r\n"
						+ "Thank you for entrusting us with your academic needs. We look forward to " + sendName + " success!\r\n"
						+ "\r\n"
						+ "Best regards,\r\n"
						+ "Apex Academic Centre");
				
	 }
	 

	    @GetMapping("/booking-details")
	    public ModelAndView getBookingDetails(@RequestParam("id") Long id) {
	    	
	        Booking booking = bookingService.findOneBook(id);  
	        
	        System.out.println(id);
	        
			ModelAndView data = new ModelAndView("confirm-booking.jsp");// load the admin dashboard
			data.addObject("bookings", booking);
			
			return data;
	
	    }
	    
		 @PostMapping("/accept-booking")
		 @ResponseBody
		 public RedirectView acceptBooking(@RequestParam("accept-id") Long id, HttpServletRequest request) {
			 
			  bookingService.update(id);
			  
			    String serverName = request.getServerName();
			    int serverPort = request.getServerPort();
			    String protocol = request.getScheme();
			    String host = protocol + "://" + serverName + ":" + serverPort;

		        String bookingLink = host + "/booking-details?id=" + id;
		        
			    /*Send email to applicant*/
		        Booking booking = bookingService.findOneBook(id); 
		        
		        String email = booking.getEmail();
		        String subject = booking.getSubject();
		        String tutorName = booking.getTutorName();
		        String name = booking.getName();
		        String surname = booking.getSurname();
		        
		        String clientName = name + " " + surname;
		        
				senderService.sendSimpleEmail(email, "Booking Approval - " + subject  ,
				"Dear " + clientName+",\n\nWe're delighted to inform you that " + tutorName + " has accepted your booking! They will be in touch with you shortly to arrange a suitable timetable and discuss any necessary details.\r\n"
						+ "\r\n"
						+ "Please note that if you have any questions, concerns, or misunderstandings, you can reach us directly via:\r\n"
						+ "\r\n"
						+ "Email: admin@apexacademiccentre.co.za\r\n"
						+ "Phone/WhatsApp: 068 035 1845\r\n"
						+ "\r\n"
						+ "We're committed to ensuring a smooth and successful tutoring experience.\r\n"
						+ "\r\n"
						+ "Kind regards,\r\n"
						+ "Apex Academic Centre");
			  
		        return new RedirectView(bookingLink);

			 
		 }
		 
		 @GetMapping("/review-ratings")
		 public ModelAndView reviewRatings(@RequestParam("email") String tutorEmail) {
			 
				ModelAndView data = new ModelAndView("rate-tutor.jsp");// load the admin dashboard
				data.addObject("tutorEmail", tutorEmail);
				
				return data;
			 
		 }
		 
		 @PostMapping("/add-review-ratings")
		 public String addReviews(@RequestParam("tutorEmail") String tutorEmail ,  @RequestParam("name") String name , @RequestParam("message") String message , @RequestParam("ratings") int ratings) {
			 
			
			 Review reviews = new Review(name,tutorEmail,message,ratings,"pending");
			  
			 reviewService.save(reviews);
				
				return "redirect:/";
			 
		 }
		 
		 @PostMapping("/approve-review")
		 public String acceptReview(@RequestParam("rEntryId") Long entryId , @RequestParam("rTutorEmail") String email) {
			 
			 reviewService.updateReview(entryId);
				
				return "redirect:/admin";
			 
		 }
		 
		 
		 @GetMapping("/payment")
		 public ModelAndView proess_paynment() {
			 
				ModelAndView data = new ModelAndView("payment.jsp");// load the admin dashboard
				//data.addObject("tutorEmail", tutorEmail);
				
				return data;
			 
		 }
		 
		 

		    
		    @GetMapping("view-profile")
		    public ModelAndView getTry(@RequestParam("email") String email) {
		        
		        List<Tutor> tutors = tutorService.listAll();
		        
		        String tutorEmail = simpleDecrypt(email);
		        
		        Optional<Tutor> opT = tutorRepo.findById(tutorEmail);
		        Tutor tutor = new Tutor();
		        List<Review> reviews = reviewService.listAll();
		            
		        if (opT.isPresent()){
		            tutor = opT.get();
		        }
		        
		        String name = tutor.getFullNames();
		        
		        ModelAndView data = new ModelAndView("profile.jsp"); // load the admin dashboard
		        data.addObject("tutor", tutor);
		        data.addObject("tutors", tutors);
		        data.addObject("name", name);
		        data.addObject("reviews", reviews);
		       
		        return data;   
		    }

		    
		    		
			 @PostMapping("/deleteConsult")
		     public String deleteConsultant(@RequestParam("deleteEmailConsult") Long id ) {
				 
				 Booking booking = bookingService.findOneBook(id);
				    bookingService.delete(booking);
				 	 
				 return "redirect:/admin";
				 
			 }
			 
			 @PostMapping("/deleteOther")
		     public String deleteOther(@RequestParam("deleteEmailOther") Long id ) {
				 
				 Booking booking = bookingService.findOneBook(id);
				    bookingService.delete(booking);
				 	 
				 return "redirect:/admin";
				 
			 }
			 
			    @GetMapping("/adminpanel")
			    public String adminLogin() {
			    	
			    	  return "loginAdmin.html";
			    }
			    
			 /*   @GetMapping("/retriveAdmin")
			    @ResponseBody
			    public Admin getAdmin() {
			 
 
					 Admin admin = adminService.retriveAdmin("sihlesithole810@gmail.com");
					 
					 
					 return admin;
			    }*/
			    
			    	    
			    @GetMapping("/success")
			    public ModelAndView handlePaymentSuccess(@RequestParam Map<String, String> paymentDetails , HttpSession session) {
			        // Extract necessary details from paymentDetails

		            String amount =  (String) session.getAttribute("amount");
		            String name =  (String) session.getAttribute("name");
		            String email = (String) session.getAttribute("email");
		            String surname = (String) session.getAttribute("surname");
		            String phone = (String) session.getAttribute("phone");
		            String province =  (String) session.getAttribute("province");
		            String country =  (String) session.getAttribute("country");
		            String instrLangauge =  (String) session.getAttribute("instrLangauge");
		            String tutorFor = (String) session.getAttribute("tutorFor");
		            String helpWith =  (String) session.getAttribute("helpWith");
		            String learnerName = (String) session.getAttribute("learnerName");
		            String learnerSurname =  (String) session.getAttribute("learnerSurname");
		            String grade = (String) session.getAttribute("grade");
		            String syllabus =  (String) session.getAttribute("syllabus");
		            String studentName =  (String) session.getAttribute("studentName");
		            String studentSurname = (String) session.getAttribute("studentSurname");
		            String year =  (String) session.getAttribute("year");
		           // String postGrad = (String) session.getAttribute("postGrad");
		            String subject =  (String) session.getAttribute("subject");
		            String onlineInperson =  (String) session.getAttribute("onlineInperson");
		            String suburb =  (String) session.getAttribute("suburb");
		            String toStart = (String) session.getAttribute("toStart");
		            String secTutor =  (String) session.getAttribute("secTutor");
		            String tutorName = (String) session.getAttribute("tutorName");
		            String tutorEmail =  (String) session.getAttribute("tutorEmail");
		            String sessions =  (String) session.getAttribute("sessions");
		            
		            if (tutorName.equals("N/A")) {
		                tutorName = "Main Booking"; // Initialize to empty string
		                tutorEmail = "Main Booking"; // Initialize to empty string
		            }
		            
		            if(sessions == null) {
		            	
		            	sessions = "0";
		            }


		            String packageType =  (String) session.getAttribute("packageType");
		            String message = (String) session.getAttribute("message");
		            String isPaid = "Yes"; 
			        

			        ModelAndView data = new ModelAndView("success.jsp"); // load the admin dashboard
			        data.addObject("name", name);
			        data.addObject("email", email);
			        
				     Booking bookings = new Booking( name,  surname,  email,  phone,  province,  country,
				    		 instrLangauge,  tutorFor,  helpWith,  learnerName,  learnerSurname,  grade,
							 syllabus,  studentName,  studentSurname,  year,  subject,  onlineInperson,
							 toStart,  suburb,  message,  secTutor,  "pending",  packageType,
							 tutorName,  tutorEmail,  isPaid , amount , sessions);
				     
				     bookingService.save(bookings);
				     
				     String sendName = "";
				     String clientName = name + " " + surname;
				     
				     if(learnerName.equals("N/A")) {
				    	 
				    	 sendName = studentName + " " + studentSurname;
				     }
				     
				     else {
				    	 
				    	 sendName = learnerName + " " + learnerSurname;
				    	 
				     }
				     
				     if(tutorName.equals("Main Booking")) {
				    	 
				    	 tutorName = "Our Highly intelligent tutor";
				    	 
				     }
				     
				     
				     bookingService.save(bookings);
					    
					    Long entryId = bookings.getEntry();
					    String tutorEmaill = bookings.getTutorEmail();
					    
					     if(tutorEmail.equals("Main Booking")) {
					    	 
					    	 tutorEmaill = "apexexcellencetutors@gmail.com";
					    	 
					     }
					    
					    String serverName = request.getServerName();
					    int serverPort = request.getServerPort();
					    String protocol = request.getScheme();
					    String host = protocol + "://" + serverName + ":" + serverPort;

				        String bookingLink = host + "/booking-details?id=" + entryId;
				        
					    /*Send email to tutor*/
						senderService.sendSimpleEmail(tutorEmaill, "Booking-info: " + subject ,
						"Dear " + tutorName + "\n\nWe're pleased to inform you that [" +  name + " " + surname + "] has booked your services to support their child, [" + sendName + "]. We're thrilled to have you on board and are confident in your ability to provide exceptional guidance and support.\r\n"
								+ "\r\n"
								+ "To confirm your booking, please review the details at the link below and ACCEPT within 24 hours. If you're unavailable or need to reschedule, please notify us immediately so we can arrange a suitable replacement tutor.\r\n"
								+ "\r\n"
								+ "Link : " + bookingLink + "\r\n"
								+ "\r\n"
								+ "Thank you for your cooperation and expertise. We look forward to a successful collaboration!\r\n"
								+ "\r\n"
								+ "Best regards,\r\n"
								+ "Apex Academic Centre");
						
						
					    /*Send email to the student who book tutor*/
						senderService.sendSimpleEmail(email, "Apex Tutor booking : no-reply" ,
						"Dear " + clientName + "\n\nThank you for choosing " + tutorName + "! We're thrilled to have them work with " + sendName + " and are confident they will receive exceptional guidance and support in " + subject + ".\r\n"
								+ "\r\n"
								+ "Next Steps:\r\n"
								+ "\r\n"
								+ "- " + tutorName + " will contact you within the next 24 hours to introduce themselves and discuss a personalized lesson plan.\r\n"
								+ "- Please note that if " + tutorName + " is unavailable for any reason or needs to reschedule, we have a secondary tutor available to ensure continuity.\r\n"
								+ "\r\n"
								+ "Thank you for entrusting us with your academic needs. We look forward to " + sendName + " success!\r\n"
								+ "\r\n"
								+ "Best regards,\r\n"
								+ "Apex Academic Centre");
			        
			        
			        
			        return data; // Name of the success HTML page (success.html)
			        
			    }
			    
			    public String simpleDecrypt(String encryptedText) {
			        int shift = 3; // This should match the shift used in encryption
			        StringBuilder decrypted = new StringBuilder();
			        
			        for (int i = 0; i < encryptedText.length(); i++) {
			            char ch = encryptedText.charAt(i);
			            
			            // Shift uppercase letters
			            if (ch >= 'A' && ch <= 'Z') {
			                ch = (char) (((ch - 'A' - shift + 26) % 26) + 'A');
			            }
			            // Shift lowercase letters
			            else if (ch >= 'a' && ch <= 'z') {
			                ch = (char) (((ch - 'a' - shift + 26) % 26) + 'a');
			            }
			            // Shift numbers
			            else if (ch >= '0' && ch <= '9') {
			                ch = (char) (((ch - '0' - shift + 10) % 10) + '0');
			            }
			            
			            decrypted.append(ch);
			        }
			        return decrypted.toString();
			    }
			    
				 @GetMapping("/bookingTutor")
				 public String bookingForm() {
					 
						return "bookTutor.html";
					 
				 }
				 
				 @PostMapping("/login")
				 public ModelAndView login(@RequestParam String email, @RequestParam String password, HttpSession session) {
				     if (adminService.isAdminLoggedIn(email)) {
				         return new ModelAndView("loginAdmin.html").addObject("message", "This admin is already logged in.");
				     }

				     if (adminService.validateAdmin(email, password)) {
				         session.setAttribute("adminEmail", email); // Store email in session
				         adminService.logInAdmin(email, session); // Register this session
				         return new ModelAndView("redirect:/admin"); // Redirect without exposing email in URL
				     } else {
				         return new ModelAndView("redirect:/loginAdmin.html").addObject("message", "Invalid credentials.");
				     }
				 }
				 
				 
				    @GetMapping("/logout")
				    public String logout(HttpSession session) {
				        String email = (String) session.getAttribute("adminEmail");
				        if (email != null) {
				            adminService.logOutAdmin(email); // Remove this admin from logged-in users
				            session.invalidate(); // Invalidate the session
				        }
				        return "loginAdmin.html"; // Redirect to the login page
				    }


			    
			  
}
