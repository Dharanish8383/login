<%@ page import="java.sql.*" %>
<%  Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); %>
<HTML>
       <HEAD>
       <TITLE>The View Of Verification Table </TITLE>
       </HEAD>
       <BODY BGCOLOR="cyan">
       <H1>The View Of Verification Table </H1>
       <%
      
       String db_Host="192.168.5.57";
       String db_Port="1433";
       String db_User="sa";
       String db_Password="welcome!23";
       String db_Database ="web_page";
	
	   java.sql.Connection connection = DriverManager.getConnection("jdbc:sqlserver://"+db_Host+":"+db_Port+";user="+db_User+";password="+db_Password+";database="+db_Database);
       Statement statement = connection.createStatement() ;
       ResultSet resultset = statement.executeQuery("select * from Voice_Details where Status = 'verified'") ;
       
       %>
      <TABLE BORDER="1">
    <TR>
      <TH>Mobile_number</TH>
      <TH>Name</TH>
      <TH>Email</TH>
      <TH>Address</TH>
      <TH>Status</TH>
     
    </TR>
      <% while(resultset.next()){ %>
    <TR>
       <TD> <%= resultset.getString(1) %></TD>
       <TD> <%= resultset.getString(2) %></TD>
       <TD> <%= resultset.getString(3) %></TD>
       <TD> <%= resultset.getString(4) %></TD>
       <TD> <%= resultset.getString(5) %></TD>
     </TR>
      <% } %>
     </TABLE>
     </BODY>
</HTML>