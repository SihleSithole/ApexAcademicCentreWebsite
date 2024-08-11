package com.example.demo.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;

@Entity
public class Bio {
	
	@Id
	@GeneratedValue
	@Column(name = "number")
	private Integer number;
	
	@Column(name = "bioMessage")
	private String bioMessage;

	public Bio() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Bio(String bioMessage) {
		super();
		this.bioMessage = bioMessage;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public String getBioMessage() {
		return bioMessage;
	}

	public void setBioMessage(String bioMessage) {
		this.bioMessage = bioMessage;
	}
	
	

}
