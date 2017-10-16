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
<h1>Create new User</h1>

<form:form modelAttribute="noteAttribute" method="POST" action="/save">
    <table>
        <tr>
            <td><form:label path="id">ID:</form:label></td>
            <td><form:input path="id"/></td>
        </tr>
        <tr>
            <td><form:label path="text">Text:</form:label></td>
            <td><form:input path="text"/></td>
        </tr>

        <tr>
            <td><form:label path="createdDate">Date:</form:label></td>
            <td><form:input path="createdDate"/></td>
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
