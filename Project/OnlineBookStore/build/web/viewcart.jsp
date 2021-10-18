<%-- 
    Document   : viewcart
    Created on : Jun 20, 2021, 9:47:40 PM
    Author     : NHULT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="servlet.sessionmodel.CartItem"%>
<%@page import="java.util.Map"%>
<%@page import="servlet.sessionmodel.Cart"%>
<%@page import="common.Config"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Shopping</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="style_viewcart.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <div class="info-form">
                <div class="main-div">
                    <div class="panel">
                        <h2>Your Order Details</h2>
                    </div>

                    <c:set var="cart" value="${CART}"></c:set>
                    <c:choose>
                        <c:when test="${ not empty cart and not empty cart.getAll() and fn:length(cart.getAll()) > 0}">
                            <c:set var="items" value = "${cart.getAll()}"></c:set>
                                <form action="dispatchercontroller" class="view-form">
                                    <table border="0">
                                    <c:set var="total" value="${0}"/>
                                    <tbody>
                                        <tr>
                                            <td>Email:</td>
                                            <td>
                                                <input name="txtUserEmail" type="text" style="width: 400px" value="${User.getEmail()}"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Phone number:</td>
                                            <td>
                                                <input name="txtUserPhoneNumber" type="text" style="width: 400px" value="${User.getPhoneNumber()}"/>  
                                                <font color="red">${UERROR.phoneEmpty} ${UERROR.phoneInvalid}</font>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Address:</td>
                                            <td>
                                                <input name="txtUserAddress"  type="text" style="width: 400px" value="${User.address}"/>  
                                                <font color="red">${UERROR.addressEmpty}</font></td>
                                        </tr>
                                        <tr>
                                            <td>Fullname:</td>
                                            <td>
                                                <input name="txtUserFullName" type="text" style="width: 400px" value="${User.fullName}"/> 
                                                <font color="red">${UERROR.fullNameEmpty}</font>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <table border="1" style="margin-top:28px; margin-bottom: 13px" class="table">
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>Name</th>
                                            <th>Quantity</th>
                                            <th>Price</th>
                                            <th>Subtotal</th>
                                            <th>Update</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <c:set var="totalPrice" value = "${0}"></c:set>
                                    <c:forEach var="cartItem" items="${items}" varStatus="count">
                                        <fmt:formatNumber var="roundedProductPrice"
                                                          value="${cartItem.value.getPrice()}"
                                                          maxFractionDigits="2" />
                                        <fmt:formatNumber var="roundedOrderPrice"
                                                          value="${cartItem.value.getPrice() * cartItem.value.getQuantity()}"
                                                          maxFractionDigits="2" />
                                        <c:set var="totalPrice" value="${totalPrice + cartItem.value.getPrice() * cartItem.value.getQuantity()}"></c:set>
                                            <tr>
                                                <td>${count.count}</td>
                                            <td>${cartItem.value.getProductName()}</td>
                                            <td>
                                                <input type="text" value="${cartItem.value.getQuantity()}" style="width: 100px" name="txtQuantity">
                                                <c:if test="${UERROR_INDEX eq cartItem.value.getId()}">
                                                    <font color="red"> ${INSUFFICENT_ERROR}, ${INCORRECT_QUANTITY} </font>
                                                </c:if>
                                            </td>
                                        <input type="hidden" value="${cartItem.key}" name="txtId">
                                        <td>

                                            ${roundedProductPrice}$
                                        </td>

                                        <td>
                                         
                                            ${roundedOrderPrice}$
                                        </td>
                                        <td>
                                            <input type="submit" value="Update Quantity" name="btAction" class="btn btn-primary">
                                        </td>
                                        <td>
                                            <input type="checkbox" name="chkItem" value="${cartItem.key}" />
                                        </td>
                                        </tr>
                                    </c:forEach>
                                    <fmt:formatNumber var="roundedTotalPrice"
                                                      value="${totalPrice}"
                                                      maxFractionDigits="2" />
                                    <tr>
                                        <td colspan="6">
                                            Total: ${roundedTotalPrice}$
                                        </td>
                                        <td>
                                            <input type="submit" value="Remove Selected Items" name="btAction" class="btn btn-primary"/>
                                        </td>
                                    </tr>
                                    </tbody>

                                </table>
                                <a href="${Config.getShoppingOnlineUrl()}">Shopping More</a>
                                <input type="submit" value="Checkout" name="btAction" class="btn btn-primary"/>
                            </form>    
                        </c:when>
                        <c:otherwise>
                            <h2>No cart</h2> 
                            <a href=${Config.getShoppingOnlineUrl()}>Shopping More</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </body>
</html>

