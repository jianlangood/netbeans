<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<sql:query var="subjects" dataSource="jdbc/IFPWAFCAD">
    SELECT subject_id,name FROM subject
</sql:query>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IFPWAFCAD Homepage</title>
    </head>

    <body>
        <h1>Welcome to IFPWAFCAD, the International Former Professional Wrestlers' Association for Counseling and Development!</h1>
        <table border="0">
            <thead>
                <tr>
                    <th>IFPWAFCAD offers expert counseling in a wide range of fields.</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>To view the contact details of an IFPWAFCAD certified former
                professional wrestler in your area, select a subject below:</td>
                </tr>
                <tr>
                    <td><form action="response.jsp">
                            <strong>Select a subject:</strong>
                            <select name="subject_id">
                                <c:forEach var="row" items="${subjects.rowsByIndex}">
                                    <c:forEach var="column" items="${row}">
                                         <option value="<c:out value="${column}"/>"><c:out value="${column}"/></option>
                                     </c:forEach>
                                </c:forEach>                       
                            </select>
                            <input type="submit" value="submit" name="submit" />
                        </form></td>
                </tr>
            </tbody>
        </table>

    </body>
</html>
