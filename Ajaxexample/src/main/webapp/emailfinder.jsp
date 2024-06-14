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
    String email=request.getParameter("email");  
    if(email.contains("@")&&email.contains(".")){  
    try{  
    Class.forName("com.mysql.jdbc.Driver");  
    Connection con=DriverManager.getConnection("jdbc:mysql://192.168.18.245:3306/javadb_168","javadb_168","Sp3cJa5A2k24");  
    PreparedStatement ps=con.prepareStatement("select * from user100 where email=?");  
    ps.setString(1,email);  
    ResultSet rs=ps.executeQuery();  
    if(rs.next()){  
    out.print("Unavailable! <img src='unchecked.gif'/>");  
    }else{  
    out.print("Available! <img src='checked.gif'/>");  
    }  
    }catch(Exception e){out.print(e);}  
    }else{  
    out.print("Invalid email!");  
    }  
    %>  














</body>
</html>