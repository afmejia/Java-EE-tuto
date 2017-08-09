<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : 8/08/2017, 11:50:07 PM
    Author     : felipe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Hello World!</h2>
        <sql:query var="result" dataSource="jdbc/sample">
            SELECT name, city, state FROM customer
        </sql:query>
    
        <table border="1">
            <!-- column headers -->
            <tr>
                <c:forEach var="columnName" items="${result.columnNames}">
                    <th><c:out value="${columnName}"/></th>
                    </c:forEach>
            </tr>
            <!-- column data -->
            <c:forEach var="row" items="${result.rowsByIndex}">
                <tr>
                    <c:forEach var="column" items="${row}">
                        <td><c:out value="${column}"/></td>
                    </c:forEach>
                </tr>
            </c:forEach>
            
        <sql:query var="allRows" dataSource="jdbc/sample">
            SELECT name, city, state FROM customer
        </sql:query>
            <table border="1">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Location</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="currentRow" items="${allRows.rows}">
                    <tr>
                        <td>${currentRow.name}</td>
                        <td>${currentRow.city}, ${currentRow.state}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </table>

    </body>
</html>
