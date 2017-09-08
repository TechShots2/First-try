<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

String name=request.getParameter("name");
String email=request.getParameter("email");
String phone=request.getParameter("phone");
String pass=request.getParameter("password");
String key="|";
String passe="hahaha it didnt work";
byte temp;
try
{
	byte b[]=pass.getBytes();
	byte k[]=key.getBytes();
	int limit=pass.length();
	
	for(int i=0;i<(limit);i++)
	{
	
		temp=b[i];
		temp+=k[0];
		b[i]=temp;
		
	}
	String temp1=new String(b, "ISO-8859-1");
	passe = temp1;
	
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/dashboard","root","");
Statement stmt=con.createStatement();
PreparedStatement ps=con.prepareStatement("insert into dashboard(name,email,phone,password)values(?,?,?,?)");
ps.setString(1,name);
ps.setString(2,email);
ps.setString(3,phone);
ps.setString(4,passe);

int i=ps.executeUpdate();
if(i>0)
{
	
System.out.println("registered sucessfuly");
	}
}
catch(Exception e)
{
	System.out.println(e);
}





%>

</body>
</html>