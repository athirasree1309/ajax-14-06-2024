<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>  
<%  
String comment=request.getParameter("comment");  
String email=request.getParameter("email");  
if(comment==null||email==null||comment.trim().equals("")||email.trim().equals("")){  
out.print("<p>Please write comment</p>");  
}else{  
  
try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://192.168.18.245:3306/javadb_168","javadb_168","Sp3cJa5A2k24");  
PreparedStatement ps=con.prepareStatement("insert into usercomment(comment1,email) values(?,?)");  
ps.setString(1,comment);  
ps.setString(2,email);  
int i=ps.executeUpdate();  
  
PreparedStatement ps2=con.prepareStatement("select * from usercomment order by id desc");  
ResultSet rs=ps2.executeQuery();  
  
out.print("<hr/><h2>Comments:</h2>");  
while(rs.next()){  
out.print("<div class='box'>");  
out.print("<p>"+rs.getString(2)+"</p>");  
out.print("<p><strong>By: "+rs.getString(3)+"</strong></p>");  
out.print("</div>");  
}  
  
con.close();  
}catch(Exception e){out.print(e);}  
  
}//end of else  
%>  



















</body>
</html>