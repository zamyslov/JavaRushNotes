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
        background-color: #D3D3D3;
    }

    table {
        font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
        margin: 0px 0px 0px 10px;
        /*padding: 50px 50px;*/
        font-size: 14px;
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
        border-width: 0 0px 0px 0;
        border-color: white;
    }

    th:first-child, td:first-child {
        text-align: left;
    }

    td {
        padding: 10px 20px;
    }

    .submit {
        background: #BC8F8F;
        color: #fff;
        width: 150px;
        margin: 15px 3px;
        font-weight: bold;
        padding: 12px 10px;
        -moz-border-radius: 3px;
        -webkit-border-radius: 3px;
        border-radius: 3px;
    }

    .error {
        color: red;
        font-weight: bold;
    }
</style>

<form:form modelAttribute="noteAttribute" method="POST" action="/save">
    <table>

        <tr>
            <th colspan="3">Create new note</th>
        </tr>

        <form:input type="hidden" path="id"/>
        <tr>
            <td><form:label path="text">Text:</form:label></td>
            <td><form:textarea path="text"/></td>
            <td><form:errors path="text" cssClass="error"/></td>
        </tr>

        <tr>
            <td><form:label path="createdDate">Date:</form:label></td>
            <td><form:input type="date" path="createdDate"/></td>
            <td><form:errors path="createdDate" cssClass="error"/></td>
        </tr>
        <tr>
            <td><form:label path="isExecuted">Executed:</form:label></td>
            <td><form:input path="isExecuted"/></td>
            <td><form:errors path="isExecuted" cssClass="error"/></td>
        </tr>

    </table>

    <input type="submit" class="submit" value="Save"/>
</form:form>

</body>
</html>
