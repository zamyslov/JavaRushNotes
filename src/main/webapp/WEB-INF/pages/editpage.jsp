<%--
  Created by IntelliJ IDEA.
  User: Oleg
  Date: 16.10.2017
  Time: 9:45
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<style type="text/css">
    body {
        background: url(/WEB-INF/pages/background.jpg) repeat;
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

    submit {
        background: #300205;
        color: #fff;
        width: 150px;
        margin: 15px 3px;
        font-weight: bold;
        padding: 12px 10px;
        -moz-border-radius: 3px;
        -webkit-border-radius: 3px;
        border-radius: 3px;
    }

</style>

<h1>Create new User</h1>

<form:form modelAttribute="noteAttribute" method="POST" action="/save">
    <table>
        <form:input type="hidden" path="id"/>
        <tr>
            <td><form:label path="text">Text:</form:label></td>
            <td><form:input path="text"/></td>
            <%--<td><form:textarea path="text" rows="5" cols="30"/></td>--%>
        </tr>

        <tr>
            <td><form:label path="createdDate">Date:</form:label></td>
            <td><form:input type="date" path="createdDate"/></td>
        </tr>
        <tr>
            <td><form:label path="isExecuted">Executed:</form:label></td>
            <td><form:input path="isExecuted"/></td>
        </tr>

    </table>

    <input type="submit" value="Save"/>
</form:form>

</body>
</html>
