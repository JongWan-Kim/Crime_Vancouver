package com.semifinal.vancouvercrime.dto;

public class ContentDto {
	
	int TYPE;
	int YEAR;
	int MONTH;
	int DAY;
	int HOUR;
	int Weather;
	float Temp;
	int Rel_Hum;
	
	String Latitude;
	String Longitude;
	
	String weather_name;
	String weather_num;
	
	//---------------------------------------------------------------
	public ContentDto() {
		// TODO Auto-generated constructor stub
	}

//-----------------------------------------------------------------
	public ContentDto(String weather_name, String weather_num) {
		super();
		this.weather_name = weather_name;
		this.weather_num = weather_num;
	}

//----------------------------------------------------
	
	public ContentDto(int tYPE, int yEAR, int mONTH, int dAY, int hOUR, int weather, float temp, int rel_Hum) {
	super();
	TYPE = tYPE;
	YEAR = yEAR;
	MONTH = mONTH;
	DAY = dAY;
	HOUR = hOUR;
	Weather = weather;
	Temp = temp;
	Rel_Hum = rel_Hum;
}
	
	
//--------------------------------------------------	
	
	
	
	
	
	
//--------------------------------------------------	
	//getter setter
	
	
	public String getWeather_name() {
		return weather_name;
	}





	public void setWeather_name(String weather_name) {
		this.weather_name = weather_name;
	}


	public String getWeather_num() {
		return weather_num;
	}


	public void setWeather_num(String weather_num) {
		this.weather_num = weather_num;
	}
	//---------------------------------------

	public int getTYPE() {
		return TYPE;
	}

	public void setTYPE(int tYPE) {
		TYPE = tYPE;
	}

	public int getYEAR() {
		return YEAR;
	}

	public void setYEAR(int yEAR) {
		YEAR = yEAR;
	}

	public int getMONTH() {
		return MONTH;
	}

	public void setMONTH(int mONTH) {
		MONTH = mONTH;
	}

	public int getDAY() {
		return DAY;
	}

	public void setDAY(int dAY) {
		DAY = dAY;
	}

	public int getHOUR() {
		return HOUR;
	}

	public void setHOUR(int hOUR) {
		HOUR = hOUR;
	}

	public int getWeather() {
		return Weather;
	}

	public void setWeather(int weather) {
		Weather = weather;
	}

	public float getTemp() {
		return Temp;
	}

	public void setTemp(float temp) {
		Temp = temp;
	}

	public int getRel_Hum() {
		return Rel_Hum;
	}

	public void setRel_Hum(int rel_Hum) {
		Rel_Hum = rel_Hum;
	}
	
	
	
	
	//---------------------------------------------------------
	
	

}
