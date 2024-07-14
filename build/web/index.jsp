<%-- 
    Document   : home
    Created on : Feb 8, 2024, 2:58:20 PM
    Author     : legion
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*" %>
<%@page import = "models.*" %>
<%@page import = "dal.*" %>
<%@page import = "controllers.*" %>
<%@page import = "context.*" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta http-equiv="x-ua-compatible" content="ie=edge" />
        <title>TechTropical</title>
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css" />
        <!-- Google Fonts Roboto -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" />
        <!-- MDB -->
        <link rel="stylesheet" href="css/mdb.min.css" />
        <!-- Custom styles -->
        <link rel="stylesheet" href="css/home/stylesheet.css" />
        <style>

        </style>
    </head>
    <body>
        <!--Main Navigation-->
        <header>
            <!-- Jumbotron -->
            <div class="p-3 text-center bg-white border-bottom">
                <div class="container">
                    <div class="row gy-3">
                        <!-- Left elements (Logo)-->
                        <div class="col-lg-2 col-sm-4 col-4">
                            <a href="" target="" class="float-start">
                                <img class="" src="https://i.imgur.com/HT85lJY.jpeg" height="35">
                            </a>
                        </div>
                        <!-- Left elements -->

                        <!-- Center elements (Users)-->
                        <div class="order-lg-last col-lg-5 col-sm-8 col-8">
                            <div class="d-flex float-end">


                                <c:if test ="${sessionScope.account != null}">

                                    <!-- Admin -->
                                    <c:if test ="${sessionScope.account.isAdmin}">
                                        <a href="" class="me-1 border rounded py-1 px-3 nav-link d-flex align-items-center" > <i class="fas fa-user-alt m-1 me-md-2"></i><p class="d-none d-md-block mb-0">${sessionScope.account.username}</p> </a>
                                        <a href="productmanager" class="me-1 border rounded py-1 px-3 nav-link d-flex align-items-center" "> <i class="fas fa-shopping-cart m-1 me-md-2"></i><p class="d-none d-md-block mb-0" style="font-size: small;">Admin Page</p> </a>
                                            </c:if>

                                    <!-- User -->
                                    <c:if test ="${!sessionScope.account.isAdmin}">
                                        <a href="loaduser" class="me-1 border rounded py-1 px-3 nav-link d-flex align-items-center" > <i class="fas fa-user-alt m-1 me-md-2"></i><p class="d-none d-md-block mb-0">${sessionScope.account.username}</p> </a>
                                        <a class="border rounded align-items-center py-1 px-3 nav-link me-3 me-lg-0 dropdown-toggle hidden-arrow" href="loadcart" id="navbarDropdownMenuLink"
                                           role="button" data-mdb-dropdown-init aria-expanded="false">
                                            <i class="fas fa-shopping-cart"></i>
                                            <c:if test ="${sessionScope.cartlist.size() != 0}">
                                                <span class="badge rounded-pill badge-notification bg-danger">${sessionScope.cartlist.size()}</span>
                                            </c:if>                                        </a>
                                        <a href="loadfavorites" class="border rounded py-1 px-3 nav-link d-flex align-items-center" > <i class="fas fa-heart m-1 me-md-2"></i><p class="d-none d-md-block mb-0"></p> </a>
                                            </c:if> 
                                    <a href="logout" class="me-1 border rounded py-1 px-3 nav-link d-flex align-items-center" > <i class="fas fa-sign-in-alt m-1 me-md-2"></i><p class="d-none d-md-block mb-0"></p> </a>
                                        </c:if>


                                <c:if test ="${sessionScope.account == null}">
                                    <a href="login.jsp" class="me-1 border rounded py-1 px-3 nav-link d-flex align-items-center" > <i class="fas fa-user-alt m-1 me-md-2"></i><p class="d-none d-md-block mb-0">Sign in</p> </a>
                                        </c:if>


                            </div>
                        </div>
                        <!-- Center elements -->

                        <!-- Right elements -->

                        <div class="col-lg-5 col-md-12 col-12"> </div>

                        <!-- Right elements -->
                    </div>
                </div>
            </div>
            <!-- Jumbotron -->

            <!-- Jumbotron -->
            <div class="bg-primary text-white py-5">
                <div class="container py-5">
                    <h1>
                        Best products & <br />
                        brands in our store
                    </h1>
                    <p>
                        Trendy Products, Factory Prices, Excellent Service
                    </p>
                    <form action ="list" method="get">
                        <button type="submit" class="btn btn-light shadow-0 text-primary pt-2 border border-white">
                            <span class="pt-1">Find more in Menu</span>
                        </button>
                    </form>
                </div>
            </div>
            <!-- Jumbotron -->
        </header>
        <!-- Products -->
        <section>

            <div class="container my-5">
                <header class="mb-4">
                    <h3>New products</h3>
                </header>

                <div class="row">
                    <c:forEach items="${listP}" var="list" begin="0" end="7">
                        <div class="col-lg-3 col-md-6 col-sm-6 d-flex">
                            <div class="card w-100 my-2 shadow-2-strong">
                                <div class="bg-image hover-zoom ripple rounded ripple-surface me-md-3 mb-3 mb-md-0">
                                    <img src="${list.image}" class="card-img-top" style="aspect-ratio: 1 / 1" />
                                    <a href="#!">
                                        <div class="hover-overlay">
                                            <div class="mask" style="background-color: rgba(253, 253, 253, 0.15);"></div>
                                        </div>
                                    </a>
                                </div>

                                <div class="card-body d-flex flex-column">
                                    <h5><a href="detail?pid=${list.productID}" title="View Details" class="text-dark">${list.productName} </a></h5>
                                    <p class="card-text"> $ ${list.price}</p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>

        <!-- Categories -->
        <section>

            <div class="container my-5">
                <header class="mb-4">
                    <h3>What you can find in this shop</h3>
                </header>

                <div class="card row overflow-x-auto " style="height:410px;">
                    <c:forEach items="${listC}" var="list" begin="0" end="6">
                        <div class="col-lg-3 col-md-6 col-sm-6 d-flex">
                            <div class="card w-100 my-2 shadow-2-strong">
                                <div class="bg-image hover-zoom ripple rounded ripple-surface me-md-3 mb-3 mb-md-0">
                                    <img src="${list.image}" class="card-img-top" style="aspect-ratio: 1 / 1" />
                                    <a href="#!">
                                        <div class="hover-overlay">
                                            <div class="mask" style="background-color: rgba(253, 253, 253, 0.15);"></div>
                                        </div>
                                    </a>
                                </div>

                                <div class="card-body d-flex flex-column">
                                    <h5><a href="category?cid=${list.categoryID}" title="View Details" class="text-dark">${list.categoryName} </a></h5>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>

        </<section>
            <div class="container my-5">
                <header class="mb-4">
                    <h3>Brands that trust our shop</h3>
                </header>

                <div class="card row overflow-x-auto " style="height:195px;">
                    <c:forEach items="${listM}" var="list">
                        <div class="col-lg-3 col-md-6 col-sm-6 m-2 ">
                            <div class="card-title bg-image hover-zoom ripple rounded ripple-surface me-md-3 mb-3 mb-md-0 ">
                                <img src="${list.image}" class="card-img-top" style="" />
                                <a href="manufacturer?mid=${list.manufacturerID}">
                                    <div class="hover-overlay">
                                        <div class="mask" style="background-color: rgba(253, 253, 253, 0.15);"></div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </c:forEach>

                </div>
            </div>
        </section>
        <!-- Products -->

        <!-- Footer -->
         <%@include file="components/footer.jsp" %>
        <!-- Footer -->
        <!-- MDB -->
        <script type="text/javascript" src="js/mdb.min.js"></script>
        <!-- Custom scripts -->
        <script type="text/javascript" src="js/script.js"></script>
    </body>
</html>
