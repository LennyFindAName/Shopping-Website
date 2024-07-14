<%-- 
    Document   : cart
    Created on : Feb 14, 2024, 1:55:16 PM
    Author     : legion
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta http-equiv="x-ua-compatible" content="ie=edge" />
        <title>Your Cart</title>
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css" />
        <!-- Google Fonts Roboto -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" />
        <!-- MDB -->
        <link rel="stylesheet" href="css/mdb.min.css" />
        <!-- Custom styles -->
        <link rel="stylesheet" href="css/cart/cart.css" />
    </head>
    <body>
        <!-- Deny access to non User -->
        <c:if test ="${sessionScope.account == null}">
            <jsp:include page="login.jsp"></jsp:include>
        </c:if>

        <c:if test ="${sessionScope.account != null}">
            <header>
                <!-- Jumbotron -->
                <div class="p-3 text-center bg-white border-bottom">
                    <div class="container">
                        <div class="row gy-3">
                            <!-- Left elements (Logo)-->
                            <div class="col-lg-2 col-sm-4 col-4">
                                <a href="" target="" class="float-start">
                                    <img src="https://i.imgur.com/HT85lJY.jpeg" height="35">
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
                                            <a href="productmanager" class="me-1 border rounded py-1 px-3 nav-link d-flex align-items-center" "> <i class="fas fa-shopping-cart m-1 me-md-2"></i><p class="d-none d-md-block mb-0" style="font-size: small;">Manage Products</p> </a>
                                                </c:if>

                                        <!-- User -->
                                        <c:if test ="${!sessionScope.account.isAdmin}">
                                            <a href="loaduser" class="me-1 border rounded py-1 px-3 nav-link d-flex align-items-center" > <i class="fas fa-user-alt m-1 me-md-2"></i><p class="d-none d-md-block mb-0">${sessionScope.account.username}</p> </a>
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

                <!-- Heading -->
                <div class="bg-primary">
                    <div class="container py-4">
                        <!-- Breadcrumb -->
                        <nav class="d-flex">
                            <h6 class="mb-0">
                                <a href="home" class="text-white-50"><i class="fas fa-home m-1 me-md-2"></i>Home</a>
                                <span class="text-white-50 mx-2"> - </span>
                                <a href="" class="text-white"><u><i class="fas fa-shopping-cart m-1 me-md-2"></i>Shopping cart</u></a>
                            </h6>
                        </nav>
                        <!-- Breadcrumb -->
                    </div>
                </div>
                <!-- Heading -->
            </header>

            <!-- cart + summary -->
            <section class="bg-light my-5">
                <div class="container">
                    <div class="row">
                        <!-- cart -->
                        <div class="col-lg-9">
                            <div class="card border shadow-0">
                                <div class="m-4">
                                    <h4 class="card-title mb-4"><i class="fas fa-shopping-cart"></i> Your shopping cart</h4>
                                    <c:if test ="${listCart == null}">
                                        <h5 class="card-title mb-4">It's quite empty here ......</h5>
                                    </c:if>


                                    <c:forEach items ="${listCart}" var="o">
                                        <div class="row gy-3 mb-4">
                                            <div class="col-lg-5">
                                                <div class="me-lg-4">
                                                    <div class="d-flex">
                                                        <img src=" ${o.image} " class="border rounded me-3" style="width: 96px; height: 96px;" />
                                                        <div class="">
                                                            <a href="#" class="nav-link">${o.productName}</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- Adjust quantity -->
                                            <div class="col-lg-2 col-sm-8 col-8 d-flex flex-row flex-lg-column flex-xl-row text-nowrap">
                                                <div>
                                                    <div class="input-group mb-0" style="width: 100px;">
                                                        <button class="btn btn-white border border-secondary px-2" type="button" id="button-addon1" data-mdb-ripple-color="dark">
                                                            <a href="quantity?action=minus&id=${o.productID}">  <i class="fas fa-minus"></i></a>
                                                        </button>
                                                        <input type="text" name="quantity" class="form-control text-center border border-secondary" value="${o.quantity}" aria-label="Example text with button addon" aria-describedby="button-addon1" />
                                                        <button class="btn btn-white border border-secondary px-2" type="button" id="button-addon2" data-mdb-ripple-color="dark">
                                                            <a href="quantity?action=plus&id=${o.productID}"> <i class="fas fa-plus"></i></a>
                                                        </button>
                                                    </div>
                                                </div>

                                            </div>
                                            <!-- !Adjust quantity -->

                                            <div class="col-lg-2 col-sm-6 col-6 d-flex flex-row flex-lg-column flex-xl-row text-nowrap">
                                                <div class="">
                                                    <text class="h6">$ ${o.totalPrice}</text> <br />
                                                    <small class="text-muted text-nowrap"> $ ${o.price}/ per item </small>
                                                </div>
                                            </div>
                                            <div class="col-lg col-sm-6 d-flex justify-content-sm-center justify-content-md-start justify-content-lg-center justify-content-xl-end mb-2">
                                                <div class="float-md-end">
                                                    <a href="#!" class="btn btn-light border px-2 icon-hover-primary"><i class="fas fa-heart fa-lg px-1 text-secondary"></i></a>
                                                    <a href="removecart?id=${o.productID}" class="btn btn-light border text-danger icon-hover-danger"> Remove</a>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>

                                <div class="border-top pt-4 mx-4 mb-4">
                                    <p><i class="fas fa-truck text-muted fa-lg"></i> Free Delivery within 1-2 weeks</p>
                                </div>
                            </div>
                        </div>
                        <!-- cart -->
                        <!-- summary -->
                        <div class="col-lg-3">

                            <div class="card shadow-0 border">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between">
                                        <p class="mb-2">Total price:</p>
                                        <p class="mb-2">$ ${sumPrice}</p>
                                    </div>
                                    <div class="d-flex justify-content-between">
                                        <p class="mb-2">Transport Fee + VAT Tax:</p>
                                        <p class="mb-2">${sumTax}</p>
                                    </div>
                                    <div class="mt-3">
                                        <form action="makeorder" method="post">
                                            <div class="d-flex justify-content-between">
                                                <p class="mb-2">Total price:</p>
                                                <p class="mb-2 fw-bold">$ ${sumPrice+sumTax}</p>
                                            </div>
                                            <div class="d-flex justify-content-between mb-2">
                                                <label>Select address</label>
                                                <select id="address" name="address">
                                                    <option>${user.address1}</option>
                                                    <option>${user.address2}</option>
                                                </select>
                                            </div>
                                                <small class="text-muted text-nowrap">(Required an address for ordering)</small>
                                            <hr />
                                            <c:if test ="${listCart != null}">
                                                <button class="btn btn-success w-100 shadow-0 mb-2" type="submit"> Make Purchase</button>
                                            </c:if>
                                        </form>

                                        <!-- Purchase Success Message -->
                                        <a href="home" class="btn btn-light w-100 border mt-2"> Back to shop </a>                                       
                                        <div class="${mess != null ? "alert alert-success" : ""}"   style="text-align: center; margin-top: 10px;" role="alert">
                                            ${mess}
                                        </div>

                                        <!-- Purchase Failed Message -->
                                        <div class="${failmess != null ? "alert alert-danger" : ""}"   style="text-align: center; margin-top: 10px;" role="alert">
                                            ${failmess}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- summary -->
                    </div>
                </div>
            </section>
            <!-- cart + summary -->

            <!-- Footer -->
             <%@include file="components/footer.jsp" %>
                <!-- MDB -->
                <script type="text/javascript" src="js/mdb.min.js"></script>
                <!-- Custom scripts -->
                <script type="text/javascript" src="js/script.js"></script>
        </c:if>
    </body>
</html>

