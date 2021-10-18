<%-- 
    Document   : userinfo
    Created on : Jul 3, 2021, 7:49:56 PM
    Author     : NHULT
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="common.Config"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Info Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="style_userinfo.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <div class="info-form">
                <div class="main-div">
                    <div class="panel">
                        <h2>Your Account</h2>
                    </div>
                    <form action="dispatchercontroller">
                        <table border="0">
                            <tbody>
                                <c:choose>
                                    <c:when test="${User.signInMethod eq 'GOOGLE_SIGNIN'}">
                                        <tr>
                                            <td>
                                                Email:${User.email}
                                            </td>
                                            <td>
                                                <input name="txtUserEmail" type="hidden" value="${User.email}"/>
                                            </td>
                                        </tr>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td>Password:</td>
                                            <td>
                                                <input name="txtUserPassword" type="password" value="${User.password}"/>  
                                                <font color="red">${UERROR.passwordEmpty}</font>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Email:</td>
                                            <td>
                                                <input name="txtUserEmail" type="text" value="${User.email}"/> 
                                                <font color="red"> ${UERROR.emailEmpty} ${UERROR.emailDuplicate} </font>
                                            </td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                                <tr>
                                    <td>Phone number:</td>
                                    <td>
                                        <input name="txtUserPhoneNumber" type="text" value="${User.getPhoneNumber()}"/>  
                                        <font color="red">${UERROR.phoneEmpty}</font>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Address:</td>
                                    <td>
                                        <input name="txtUserAddress"  type="text" style="width: 400px" value="${User.address}"/>  
                                        <font color="red">${UERROR.addressEmpty}</font>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Fullname:</td>
                                    <td>
                                        <input name="txtUserFullName" type="text" value="${User.fullName}"/> 
                                        <font color="red">${UERROR.fullNameEmpty}</font>  
                                    </td>
                                </tr>
                                <c:if test="${User.role eq 'ADMIN'}">
                                    Current role: <select name="ddlist">
                                    <option value="ADMIN">Admin</option>
                                    <option value="USER">User</option>
                                </select>    
                                </br>     
                            </c:if>
                            <tr>
                                <td>
                                    <a href="dispatchercontroller">Back</a>
                                </td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="submit" name="btAction" value="Update" class="btn btn-primary">     
                                    <input type="hidden" name="txtRawUserEmail" value="${User.email}">
                                </td>
                                <td>
                                    <input type="submit" name="btAction" value="SignOut" class="btn btn-primary">
                                    <input type="hidden" name="txtSignInMethod" value="${User.signInMethod}"/>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
