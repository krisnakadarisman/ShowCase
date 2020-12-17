<%-- 
    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<%@page import="java.sql.*" %>
 <%@page import="java.io.*" %>
 <html>
 <head>
 <title>Display data Obat</title>
 </head>
 <body>
 <h3>MEDIKA SYSTEMA</h3>
 <h2>Laporan Data Obat</h2>
 <%
 try {
 
//deklarasi url database
 String url = "jdbc:mysql://localhost:3306/sik";
 Connection con = null;
 Statement stat = null;
 ResultSet rs = null;
 
//load jdbc driver
 Class.forName("com.mysql.jdbc.Driver").newInstance();
 
con = DriverManager.getConnection(url, "root", "");
 
stat = con.createStatement();
 
//membuat query
 String query = "Select * from obat";
 
rs = stat.executeQuery(query);
 
%>


	<%
		String exportToExcel = request.getParameter("exportToExcel");
		if (exportToExcel != null
				&& exportToExcel.toString().equalsIgnoreCase("YES")) {
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "inline; filename="
					+ "Obat.xls");

		}
	%>
 <table border="1">
 <tr>
 <th>Kode Obat</th>
 <th>Nama Obat</th>
 <th>Harga Obat</th>
 </tr>
 <% while (rs.next())
 {
 %>
 <tr>
 <td><%=rs.getString(1)%></td>
 <td><%=rs.getString(2)%></td>
 <td><%=rs.getString(3)%></td>
 </tr>
 
<%
 }
 %>
 <%
 
//menutup koneksi
 rs.close();
 stat.close();
 con.close();
 }
 catch (Exception ex)
 {
 out.println ("Unable to connect to database");
 }
 %>
 </table>
 </body>
 </html>

