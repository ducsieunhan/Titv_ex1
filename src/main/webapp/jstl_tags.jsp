<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Details</title>
</head>
<body>
<%
	try
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/java_jdbc","root","Gamma@2210");
		String sql = "insert into java_jdbc_table(id,name,age,course)values(?,?,?,?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String course = request.getParameter("course");		
		
		ps.setString(1,id);
		ps.setString(2,name);
		ps.setString(3,age);
		ps.setString(4,course);
		
		int status=ps.executeUpdate();
		if(status>0)
		{
			out.print("Data successfully added");
		}
		else
		{
			out.print("Data has not been saved. ERROR!!!");
		}
		

	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	
%>
	
</body>
</html>