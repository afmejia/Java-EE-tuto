<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : bdinsertar
    Created on : 9/08/2017, 01:13:22 AM
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
        <sql:update var="InsertedRows" dataSource="jdbc/sample">
            INSERT INTO customer (customer_id, name, discount_code, zip)
            VALUES (((select max(customer_id) from customer) + 1),
            'Curso VideoTutoriales, SCN', 'M', '10096')
        </sql:update>
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
    </body>
</html>
