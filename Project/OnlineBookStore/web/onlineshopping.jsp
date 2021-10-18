<%-- 
    Document   : onlineshopping
    Created on : Jun 20, 2021, 11:44:22 PM
    Author     : NHULT
--%>

<%@page import="data.dto.ProductDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dto.UserDto"%>
<%@page import="java.sql.SQLException"%>
<%@page import="data.dao.ProductDao"%>
<%@page import="common.Config.Action"%>
<%@page import="common.Config"%>
<%@page import="common.FakeResouceImg"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Online Shopping</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="style_onlineshopping.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <div class="shopping-form">
                <div class="main-div">
                    <div class="panel">
                        <h1>Welcome to Slim Air Book Store!</h1>
                    </div>
                    <div class="banner-image">
                        <image style="max-width: 100%" src="https://static.vecteezy.com/system/resources/previews/002/051/198/non_2x/book-fast-delivery-location-on-phone-online-free-vector.jpg">
                    </div>
                    <nav class="navbar navbar-expand-sm bg-danger navbar-dark">
                        <ul class="navbar-nav">
                            <li class="nav-item active">
                                <a class="nav-link">Home</a>
                            </li>
                            <c:if test="${not empty sessionScope.User}">
                                <li class="nav-item">
                                    <a style="text-decoration: none; color: white; margin-right: 30px; margin-left: 20px; vertical-align:-8px" href="${Config.getSignOutUrl()}">SignOut</a>
                                </li>
                                <li class="nav-item">
                                    <c:url value="dispatchercontroller" var="viewUserInfoUrl">
                                        <c:param name="btAction" value="viewuserinfo"></c:param>
                                    </c:url>
                                    <a style="text-decoration: none; color: white; margin-right: 30px; vertical-align:-8px" href="${viewUserInfoUrl}">UserInfo</a>
                                </li>
                            </c:if>
                            <c:if test="${empty sessionScope.User}">
                                <li class="nav-item">
                                    <a style="text-decoration: none; color: white; margin-right: 30px; margin-left: 20px; vertical-align:-8px" href="${Config.DISPATCH_CONTROLLER}">Login</a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
                    <h5>Choose your favorite book category:</h5>
                    <c:set var="selectedCategory" value="${param.cboCategory}"/>
                    <c:set var = "productImages" value = "${FakeResouceImg.productImage}"/> 
                    <c:set var="categories" value="${requestScope.SHOPPING_CATEGORY}"/>
                    <c:set var="products" value="${requestScope.SHOPPING_PRODUCT}"/>
                    <c:set var="error" value="${UERROR}"/>
                    <c:if test="${ empty selectedCategory}">
                        <c:set var="selectedCategory" value="${categories[0].title}"/>
                    </c:if>

                    <form action="dispatchercontroller" id="shopping-form">
                        <input type="hidden" name="btAction" value="ShoppingOnline"/>
                        <select name="cboCategory" id="categoryList" onchange="this.form.submit()">
                            <option>${selectedCategory}</option>
                            <c:forEach items="${categories}" var="categoryItem" varStatus="status">
                                <c:if test="${categoryItem.title  ne selectedCategory}">
                                    <option>${categoryItem.title}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </form>
                    <table border="1" >
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Price</th>
                                <th>Image</th>
                                <th>Quantity</th>

                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${products}" var="productItem" varStatus="status">
                                <c:if test="${productItem.categoryTitle eq selectedCategory}">
                                    <tr>
                                <form action="dispatchercontroller">
                                    <td>
                                        ${productItem.name}
                                    </td>
                                    <td>
                                        ${productItem.price}
                                    </td>
                                    <td>
                                        <img src=" ${productImages.get(productItem.id)}" alt="Book Photo">
                                    </td>
                                    <td>
                                        <input type="text" value="1" name="txtProductQuantity" style="width: 30px"/>
                                        <br/>
                                        <c:if test="${error.productId eq productItem.id}">
                                            ${error.overQuantity}, ${error.incorectQuantity}
                                        </c:if>
                                    </td>
                                    <td>
                                        <input type="hidden" value="${selectedCategory}" name="cboCategory">
                                        <input type="hidden" name="txtProductName" value="${productItem.name}" />
                                        <input type="hidden"  name="txtProductPrice" value="${productItem.price}"/>
                                        <input type="hidden"  name="txtProductId" value="${productItem.id}" />
                                        <input type="submit" value="Add item to cart" name="btAction" class="btn btn-primary"/>
                                    </td>
                                </form>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                    <form action="dispatchercontroller" id="view">
                        <input type="submit" value="View your cart" name="btAction" class="btn btn-primary"/>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>