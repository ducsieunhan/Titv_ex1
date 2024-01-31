package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.bin.student_bo;


public  class student_dao 
{
	public static Connection getConnection()
	{
		Connection con=null;
		try
		{
			String url="jdbc:mysql://localhost:3306/java_jdbc";
			String user="root";
			String password ="Gamma@2210";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			con=DriverManager.getConnection(url,user,password);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return con;
	}
	
	public static int index(student_bo st)
	{
		int status = 0;
		
		try
		{
			Connection con = student_dao.getConnection();
			
			String query = "insert into java_jdbc_table(id,name,age,course)values(?,?,?,?)";
			
			PreparedStatement ps = con.prepareStatement(query);
			
			ps.setString(1,st.getId());
			ps.setString(2,st.getName());
			ps.setString(3,st.getAge());
			ps.setString(4,st.getCourse());
			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		return status;
	}
}
