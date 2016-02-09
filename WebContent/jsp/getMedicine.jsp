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

<sql:query var="mediciences" dataSource="${datasource}">
  SELECT id, Name, Groups, BodyPart FROM medicine 
</sql:query>
 <h3>The Available Ayurvedic Medicine List</h3>
    <table class="table table-striped">
      <tr>
        <th>id</th><th>Name</th><th>Group</th><th>BodyPart</th>
      </tr>
      <c:forEach items="${mediciences.rows}" var="row"> 
      <tr>
        <td><c:out value="${row.id}" /></td>
        <td><c:out value="${row.Name}" /></td>
       	<td><c:out value="${row.Groups}" /></td>
       	<td><c:out value="${row.BodyPart}" /></td>
      </tr>
      </c:forEach> 
    </table>
  </body>
</html>
