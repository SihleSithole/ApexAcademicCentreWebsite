package com.example.demo.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Booking {
	
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long entry;
    
	@Column(name = "name")
	private String name;
	
	@Column(name = "surname")
	private String surname;
	
	@Column(name = "email")
	private String email;
	
	@Column(name = "phone")
	private String phone;
	
	@Column(name = "subject")
	private String subject;
	
	@Column(name = "tutoring")
	private String tutoring;
	
	@Column(name = "internetCheck")
	private String internetCheck;
	
	@Column(name = "suburb")
	private String suburb;
	
	@Column(name = "contactMethod")
	private String contactMethod;
	
	@Column(name = "province")
	private String province;
	
	@Column(name = "tutoringFor")
	private String tutoringFor;
	
	@Column(name = "helpWith")
	private String helpWith;
	
	@Column(name = "studName")
	private String studName;
	
	@Column(name = "studSurname")
	private String studSurname;
	
	@Column(name = "grade")
	private String grade;
	
	@Column(name = "syllabus")
	private String syllabus;
	
	@Column(name = "year")
	private String year;
	
	@Column(name = "message")
	private String message;

	@Column(name = "tutorName")
	private String tutorName;
	
	@Column(name = "tutorEmail")
	private String tutorEmail;
	
	@Column(name = "status")
	private String status;
	

	public Booking() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Booking(String name, String surname, String email, String phone, String subject, String tutoring,
			String internetCheck, String suburb, String contactMethod, String province, String tutoringFor,
			String helpWith, String studName, String studSurname, String grade, String syllabus, String year,
			String message,String tutorName , String tutorEmail) {
		super();
		this.name = name;
		this.surname = surname;
		this.email = email;
		this.phone = phone;
		this.subject = subject;
		this.tutoring = tutoring;
		this.internetCheck = internetCheck;
		this.suburb = suburb;
		this.contactMethod = contactMethod;
		this.province = province;
		this.tutoringFor = tutoringFor;
		this.helpWith = helpWith;
		this.studName = studName;
		this.studSurname = studSurname;
		this.grade = grade;
		this.syllabus = syllabus;
		this.year = year;
		this.message = message;
		this.tutorEmail = tutorEmail;
		this.tutorName = tutorName;
		this.status = "pending..";
	}

	public Long getEntry() {
		return entry;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getTutoring() {
		return tutoring;
	}

	public void setTutoring(String tutoring) {
		this.tutoring = tutoring;
	}

	public String getInternetCheck() {
		return internetCheck;
	}

	public void setInternetCheck(String internetCheck) {
		this.internetCheck = internetCheck;
	}

	public String getSuburb() {
		return suburb;
	}

	public void setSuburb(String suburb) {
		this.suburb = suburb;
	}

	public String getContactMethod() {
		return contactMethod;
	}

	public void setContactMethod(String contactMethod) {
		this.contactMethod = contactMethod;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getTutoringFor() {
		return tutoringFor;
	}

	public void setTutoringFor(String tutoringFor) {
		this.tutoringFor = tutoringFor;
	}

	public String getHelpWith() {
		return helpWith;
	}

	public void setHelpWith(String helpWith) {
		this.helpWith = helpWith;
	}

	public String getStudName() {
		return studName;
	}

	public void setStudName(String studName) {
		this.studName = studName;
	}

	public String getStudSurname() {
		return studSurname;
	}

	public void setStudSurname(String studSurname) {
		this.studSurname = studSurname;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getSyllabus() {
		return syllabus;
	}

	public void setSyllabus(String syllabus) {
		this.syllabus = syllabus;
	}

	public String getYear() {
		return year;
	} 

	public void setYear(String year) {
		this.year = year;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getTutorName() {
		return tutorName;
	} 

	public void setTutorName(String tutorName) {
		this.tutorName = tutorName;
	}

	public String getTutorEmail() {
		return tutorEmail;
	}

	public void setTutorEmail(String tutorEmail) {
		this.tutorEmail = tutorEmail;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	

}
