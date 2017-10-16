<%--
  Created by IntelliJ IDEA.
  User: Oleg
  Date: 12.10.2017
  Time: 20:03
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>List of notes</title>
</head>
< hre>
<br>
<h1>Notes</h1>
<%--<c:url var="addUrl" value="/jvtestbd/main/users/add" />--%>
<%--<c:url var="filterUrl" value="/jvtestbd/main/users/filter" />--%>
<table style="border: 2px solid; width: 650px; text-align:center">
    <thead style="">
    <tr>
        <th>ID</th>
        <th>Date</th>
        <th>Time</th>
        <th>Text</th>
        <th>Executed</th>
        <th colspan="4"></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${notesList}" var="note">
        <tr>
            <th><c:out value="${note.id}"/></th>
            <th><fmt:formatDate pattern="dd MMM yyyy" value="${note.createdDate}"/></th>
            <th><fmt:formatDate pattern="HH:mm" value="${note.createdDate}"/></th>
            <th><c:out value="${note.text}"/></th>
            <th class="checkbox"><input value="${note.isExecuted}" type="checkbox" disabled="true"></th>
            <td><a href="/edit?id=${note.id}">Edit</a></td>
            <td><a href="/delete?id=${note.id}">Delete</a></td>
        </tr>
    </c:forEach>
    </tbody>
    <tbody>
</table>
<br>
</br>
<a href="/add">Add</a>
<%--<c:if test="${notesfull.size() > -1}">--%>
<%--<c:forEach begin="1" end="${count}" var="val">--%>
<%--<c:url var="pageURL" value="/jvtestbd//main/notesPage?numpage=${val}" />--%>
<%--<a href="${pageURL}">${val}</a>-.--%>
<%--</c:forEach>--%>
<%--</c:if>--%>

<%--<c>--%>
<%--You can filter users. <a href="${filterUrl}">Filter</a>.--%>
<%--</c>--%>

<br>
</br>

</body>
</html>