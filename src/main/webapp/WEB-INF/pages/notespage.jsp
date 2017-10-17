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
    <style type="text/css">
        body {
            background: url(/background.jpg) repeat;
        }

        table {
            font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
            margin: 0px 0px 0px 150px;
            /*padding: 50px 50px;*/
            font-size: 14px;
            border-radius: 10px;
            border-spacing: 0;
            text-align: center;
        }

        th {
            background: #000000;
            color: white;
            text-shadow: 0 1px 1px #2D2020;
            padding: 10px 20px;
        }

        th, td {
            border-style: solid;
            border-width: 0 1px 1px 0;
            border-color: white;
        }

        th:first-child, td:first-child {
            text-align: left;
        }

        th:first-child {
            border-top-left-radius: 10px;
        }

        th:last-child {
            border-top-right-radius: 10px;
            border-right: none;
        }

        td {
            padding: 10px 20px;
            background: #f0f8dc;
        }

        tr:last-child td:first-child {
            border-radius: 0 0 0 10px;
        }

        tr:last-child td:last-child {
            border-radius: 0 0 10px 0;
        }

        tr td:last-child {
            border-right: none;
        }

    </style>
</head>
<br>
<h1>Notes</h1>
<%--<c:url var="addUrl" value="/jvtestbd/main/users/add" />--%>
<%--<c:url var="filterUrl" value="/jvtestbd/main/users/filter" />--%>
<div id="pagination">
    <c:if test="${maxPages > 0}">
        <c:url value="/" var="prev">
            <c:param name="page" value="${page-1}"/>
        </c:url>
        <c:if test="${page > 1}">
            <a href="<c:out value="${prev}" />" class="pn prev">Prev</a>
        </c:if>
        <c:forEach begin="1" end="${maxPages}" varStatus="i">
            <c:choose>
                <c:when test="${page == i.index}">
                    <span>${i.index}</span>
                </c:when>
                <c:otherwise>
                    <c:url value="/" var="url">
                        <c:param name="page" value="${i.index}"/>
                    </c:url>
                    <a href='<c:out value="${url}" />'>${i.index}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </c:if>
    <c:url value="/" var="next">
        <c:param name="page" value="${page + 1}"/>
    </c:url>
    <c:if test="${page + 1 <= maxPages}">
        <a href='<c:out value="${next}" />' class="pn next">Next</a>
    </c:if>
</div>

<table>
    <tr>
        <th>ID</th>
        <th>Date</th>
        <th>Time</th>
        <th>Text</th>
        <th>Executed</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <tbody>
    <c:forEach items="${notesList}" var="note">
        <tr>
            <td><c:out value="${note.id}"/></td>
            <td><fmt:formatDate pattern="dd MMM yyyy" value="${note.createdDate}"/></td>
            <td><fmt:formatDate pattern="HH:mm" value="${note.createdDate}"/></td>
            <td><c:out value="${note.text}"/></td>
            <td><c:out value="${note.isExecuted}"/></td>
                <%--<td> <input type="checkbox" value="${note.isExecuted}" type="checkbox"></td>--%>
            <td><a href="/edit?id=${note.id}">Edit</a></td>
            <td><a href="/delete?id=${note.id}">Delete</a></td>
        </tr>
    </c:forEach>
    </tbody>
    <tbody>
</table>
<br>
</br>
<a href="/add" style="background: #1dabb8;
    color: #fff;
    width: 150px;
    margin: 15px 3px;
    font-weight: bold;
    padding: 12px 10px;
    -moz-border-radius: 3px;
    -webkit-border-radius: 3px;
    border-radius: 3px;
">Add note</a>

<%--<form:form modelAttribute="noteFilter" method="GET" action="/filternotes">--%>
<%--<select name="filter">--%>
    <%--<option value="All">All</option>--%>
    <%--<option value="Executed">Executed</option>--%>
    <%--<option value="NotExecuted">Not executed</option>--%>
<%--</select>--%>
    <%--<input type="submit" value="Filter"/>--%>
<%--</form:form>--%>
<form:form action="/filternotes" method="GET" modelAttribute="noteFilter">
    <form:select path="filter">
        <form:option value="All" label="Select" />
        <form:option value="Executed" label="Select" />
        <form:option value="NotExecuted" label="Select" />
    </form:select>
    <a href="/filternotes">Add note</a>
</form:form>
<%--<c>--%>
<%--You can filter users. <a href="${filterUrl}">Filter</a>.--%>
<%--</c>--%>

<br>
</br>

</body>
</html>