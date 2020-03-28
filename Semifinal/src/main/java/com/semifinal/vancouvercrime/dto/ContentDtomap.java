package com.semifinal.vancouvercrime.dto;

public class ContentDtomap {
	
	String Latitude;
	String Longitude;
	
	//---------------------------------------------------------------
	
	public ContentDtomap() {
		// TODO Auto-generated constructor stub
	}

	//---------------------------------------------------------------
	public ContentDtomap(String latitude, String longitude) {
		super();
		Latitude = latitude;
		Longitude = longitude;
	}

	//---------------------------------------------------------------
	public String getLatitude() {
		return Latitude;
	}

	public void setLatitude(String latitude) {
		Latitude = latitude;
	}

	public String getLongitude() {
		return Longitude;
	}

	public void setLongitude(String longitude) {
		Longitude = longitude;
	}
	
	//---------------------------------------------------------------
	
	
	
	
	
	
	
	
	
	
	
	

}
