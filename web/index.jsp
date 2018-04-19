<%-- 
    Document   : index
    Created on : Apr 19, 2018, 3:40:23 AM
    Author     : maple
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, momslibraryPackage.*,org.hibernate.*,org.hibernate.cfg.*" %>
<%! int id;String title; Session session1 = null; %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <table width="220" border="1">
            <tr><th>ID</th><th>TITLE</th></tr>                     
            <%
                Configuration cf=new Configuration();
                cf.configure();
                SessionFactory sf = cf.buildSessionFactory();
                session1 =sf.openSession();
                String SQL_QUERY ="from Book";
                Query query = session1.createQuery(SQL_QUERY);
                Iterator it=query.iterate();
                while(it.hasNext())
                {
                    Book b = (Book) it.next();
                    id = b.getId();
                    title = b.getTitle();
                    %>                  
                    <tr>
                        <td><%=id%></td>
                        <td><%=title%></td>
                    </tr>
                    <%
                }
            session1.close();
            %>
        </table>
        
        <h1>Mom's library</h1>
        <form action="BookManagement" method="POST">
            New book title: <input type="text" name="title"/><br><br/>
            <button type='submit'>Add</button>
        </form>
    </body>
</html>
