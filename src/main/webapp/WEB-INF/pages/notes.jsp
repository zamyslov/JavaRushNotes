<%--
  Created by IntelliJ IDEA.
  User: Oleg
  Date: 12.10.2017
  Time: 20:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>List of notes</title>
</head>
<body>
<br>
    <h1>Notes</h1>
    <%--<c:url var="addUrl" value="/jvtestbd/main/users/add" />--%>
    <%--<c:url var="filterUrl" value="/jvtestbd/main/users/filter" />--%>
    <table style="border: 2px solid; width: 650px; text-align:center">
        <thead style="">
        <tr>
            <th>ID</th>
            <th>Date</th>
            <th>Text</th>
            <th>isExecuted</th>
            <th colspan="4"></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${notes}" var="note">
            <%--<c:url var="editUrl" value="/jvtestbd/main/users/edit?id=${notes.id}" />--%>
            <%--<c:url var="deleteUrl" value="/jvtestbd/main/users/delete?id=${notes.id}" />--%>
            <tr>
                <td><c:out value="${note.id}" /></td>
                <td><c:out value="${note.date}" /></td>
                <td><c:out value="${note.text}" /></td>
                <td><c:out value="${note.isExecuted}" /></td>
                <%--<td><a href="${editUrl}">Edit</a></td>--%>
                <%--<td><a href="${deleteUrl}">Delete</a></td>--%>
                <%--<td><a href="${addUrl}">Add</a></td>--%>
            </tr>
        </c:forEach>
        </tbody>
        <tbody>
    </table>

    <%--<c:if test="${notesfull.size() > -1}">--%>
        <%--<c:forEach begin="1" end="${count}" var="val">--%>
            <%--<c:url var="pageURL" value="/jvtestbd//main/notesPage?numpage=${val}" />--%>
            <%--<a href="${pageURL}">${val}</a>-.--%>
        <%--</c:forEach>--%>
    <%--</c:if>--%>
    <br>
    </br>

    <br>
    </br>
    <%--<c>--%>
        <%--You can filter users. <a href="${filterUrl}">Filter</a>.--%>
    <%--</c>--%>

    <br>
    </br>

</body>
</html>