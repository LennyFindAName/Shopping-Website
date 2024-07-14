<%-- 
    Document   : mailtest
    Created on : Mar 12, 2024, 11:58:38 PM
    Author     : legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="sendmail" method="post">
            To :<input type="text" name="to" value="" />
            Subject : <input type="text" name="subject" value="" />
            Content : <textarea name="content"></textarea>
            <button type="submit">Send</button>
        </form>
    </body>
</html>
