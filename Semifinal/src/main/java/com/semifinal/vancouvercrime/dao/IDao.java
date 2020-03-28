package com.semifinal.vancouvercrime.dao;

import java.util.ArrayList;

import com.semifinal.vancouvercrime.dto.ContentDto;

public interface IDao {
	
	
	public void inputDao(String TYPE);
	
	public ArrayList<ContentDto> weather_list_Dao();
	
	public ArrayList<ContentDto> crime_all_Dao();

	public ArrayList<ContentDto> lat_long_Dao(String NEIGHBOURHOOD, String YEAR);
//	public ArrayList<ContentDto> lat_long_Dao();
	//public void lat_long_Dao(String NEIGHBOURHOOD, String YEAR);
	
}

