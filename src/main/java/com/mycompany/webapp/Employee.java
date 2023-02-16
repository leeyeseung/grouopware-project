package com.mycompany.webapp;

import java.sql.Date;

import lombok.Data;

@Data
public class Employee {
	private String empId;
	private String managerId;
	private int deptId;
	private int teamId;
	private int gradeId;
	private int empNo;
	private String password;
	private String name;
	private String phone;
	private Date birth;
	private Date hireDate;
	private Date resignDate;
	private String profileContentType;
	private byte[] profileData;
	private int dayoffRemain;
	private int addDayoffRemain;
	private boolean initialPassword;
	
	
}