package com.hta.movieplus.domain;

public class TimeTableDate {
	private int year;
	private int month;
	private int day;
	private String week;
	private String date;
	
	public TimeTableDate(int year, int month, int day, String week, String date) {
		// TODO Auto-generated constructor stub
		this.year = year;
		this.month = month;
		this.day = day;
		this.week = week;
		this.date = date;
	}

	public int getYear() {
		return year;
	}

	public int getMonth() {
		return month;
	}


	public int getDay() {
		return day;
	}

	public String getWeek() {
		return week;
	}

	public String getDate() {
		return date;
	}
	
	
}
