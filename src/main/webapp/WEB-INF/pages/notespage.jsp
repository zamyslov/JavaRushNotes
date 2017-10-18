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
            background-color: #D3D3D3;
        }

        h1 {
            text-align: center;
            color: #BC8F8F;
        }

        table {
            font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
            margin: 0px 0px 0px 150px;
            /*padding: 50px 50px;*/
            font-size: 12px;
            border-radius: 10px;
            border-spacing: 0;
            text-align: center;
        }

        th {
            background: #BC8F8F;
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

        td {
            padding: 10px 20px;
            background: #f0f8dc;
        }

        .paneladd {
            color: #1c25ff;
            background-color: #BC8F8F;
            width: 30%;
            float: left;
            text-align: left;
            padding: 5px 0px;
        }

        .panelfilter {
            color: #1c25ff;
            background-color: #BC8F8F;
            width: 70%;
            float: right;
            text-align: right;
            padding: 5px 0px;
        }

        .panelpage {
            background-color: #BC8F8F;
            color: #1c25ff;
            font-weight: bold;
            text-align: center;
        }

    </style>
</head>
<br>
<h1>Notes</h1>
<div class="paneladd">
    <a href="/add">Add note</a>
</div>
<div class="panelfilter">
    <a>Sort by:</a>
    <a href="/sortnotes?id=0">ID</a>
    <a href="/sortnotes?id=1">Date</a>
    <a>Filter by:</a>
    <a href="/filternotes?id=-1">All</a>
    <a href="/filternotes?id=1">Executed</a>
    <a href="/filternotes?id=0">Not executed</a>
</div>

<%--<c:url var="addUrl" value="/jvtestbd/main/users/add" />--%>
<%--<c:url var="filterUrl" value="/jvtestbd/main/users/filter" />--%>
<br><br>

<table>
    <tr>
        <th>ID</th>
        <th>Date</th>
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
                <%--&lt;%&ndash;<td><fmt:formatDate pattern="HH:mm" value="${note.createdDate}"/></td>&ndash;%&gt;--%>
                <%--<td><c:out value="${note.createdDate}"/></td>--%>
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

<div id="pagination" class="panelpage">
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
</body>
</html>