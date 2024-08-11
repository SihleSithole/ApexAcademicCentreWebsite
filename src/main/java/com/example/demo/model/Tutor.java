package com.example.demo.model;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Lob;
import jakarta.persistence.OneToOne;

@Entity
public class Tutor {
	
	@Id
	@Column(name = "id")
	private String idNumber;
	
	@Column(name = "Name")
	private String name;
	
	@Column(name = "Surname")
	private String surname;
	
	@Column(name = "PhoneNumber")
	private String phoneNumber;
	
	@Column(name = "Email")
	private String email;
	
	@Column(name = "location")
	private String location;
	
	@Column(name = "trainOnline")
	private boolean canTrainOnline;
	
	@Lob
	@Column(columnDefinition = "longblob")
	private byte[] image;
	
	@OneToOne
	@JoinColumn(name = "tutor_id")
	private Bio bio;

	public Tutor() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Tutor(String idNumber, String name, String surname, String phoneNumber, String email, String location,
		boolean canTrainOnline , byte[] image) {
		super();
		this.idNumber = idNumber;
		this.name = name;
		this.surname = surname;
		this.phoneNumber = phoneNumber;
		this.email = email;
		this.location = location;
		this.canTrainOnline = canTrainOnline;
		this.image = image;
	}

	public String getIdNumber() {
		return idNumber;
	}

	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
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

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public boolean isCanTrainOnline() {
		return canTrainOnline;
	}

	public void setCanTrainOnline(boolean canTrainOnline) {
		this.canTrainOnline = canTrainOnline;
	}

	public Bio getBio() {
		return bio;
	}

	public void setBio(Bio bio) {
		this.bio = bio;
	}

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	
}
