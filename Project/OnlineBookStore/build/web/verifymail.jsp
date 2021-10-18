<%-- 
    Document   : verifymail
    Created on : Jul 4, 2021, 7:12:12 PM
    Author     : NHULT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="common.Config"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Verify mail Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="style_verify.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <div class="verify-form">
                <div class="main-div">
                    <div class="panel">
                        <h2>Verify Your account</h2>
                    </div>
                    <form action="dispatchercontroller">
                        <table border="0">
                            <tbody>
                                <tr>
                                    <td>
                                        <input type="text" name="txtInputCode" value="" />
                                    </td>
                                    <td>
                                        <input type="submit" name="btAction" value="send verify code" class="btn btn-primary"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="${Config.getSignOutUrl()}">SignOut</a>
                                    </td>
                                </tr>            
                            </tbody>
                        </table>
                        <input type="submit" name="btAction" value="confirm email" class="btn btn-success"/>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
