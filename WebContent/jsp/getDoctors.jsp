<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="header.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jstl/sql_rt" %>

<sql:setDataSource var="datasource" 
                driver="com.mysql.jdbc.Driver" 
                   url="jdbc:mysql://localhost:3306/ayuracharya" user="root" password="root" />

<sql:query var="doctors" dataSource="${datasource}">
  SELECT id, Name, Specialization, Email, Phone, Location FROM doctor 
</sql:query>
<h3>The Certified Ayurvedic Vaidya List</h3>
    <table class="table table-striped">
      <tr>
        <th>id</th><th>Name</th><th>Specialization</th><th>Email</th><th>Contact No</th><th>Location</th>
      </tr>
      <c:forEach items="${doctors.rows}" var="row"> 
      <tr>
        <td><c:out value="${row.id}" /></td>
        <td><c:out value="${row.Name}" /></td>
       	<td><c:out value="${row.Specialization}" /></td>
       	<td><c:out value="${row.Email}" /></td>
       	<td><c:out value="${row.phone}" /></td>
       	<td><c:out value="${row.Location}" /></td>
      </tr>
      </c:forEach> 
    </table>
  </body>
</html>
