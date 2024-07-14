<%-- 
    Document   : detail
    Created on : Feb 14, 2024, 2:24:54 PM
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
        <title>Product Detail</title>
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css" />
        <!-- Google Fonts Roboto -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" />
        <!-- MDB -->
        <link rel="stylesheet" href="css/mdb.min.css" />
        <!-- Custom styles -->
        <link rel="stylesheet" href="css/detail/detail.css" />
    </head>
    <body>
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

            <!-- Heading -->
            <div class="bg-primary">
                <div class="container py-4">
                    <!-- Breadcrumb -->
                    <nav class="d-flex">
                        <h6 class="mb-0">
                            <a href="home" class="text-white-50"><i class="fas fa-home m-1 me-md-2"></i>Home</a>
                            <span class="text-white-50 mx-2"> - </span>
                            <a href="list" class="text-white-50"><i class="fas fa-list-ul m-1 me-md-2"></i>List</a>
                            <span class="text-white-50 mx-2"> - </span>
                            <a href="" class="text-white"><u><i class="fas fa-archive m-1 me-md-2"></i>Detail</u></a>
                        </h6>
                    </nav>
                    <!-- Breadcrumb -->
                </div>
            </div>
            <!-- Heading -->
        </header>

        <!-- content -->
        <section class="py-5">
            <div class="container">
                <div class="row gx-5">
                    <aside class="col-lg-6">
                        <div class="border rounded-4 mb-3 d-flex justify-content-center">
                            <a data-fslightbox="mygalley" class="rounded-4"data-type="image" href="">
                                <img style="max-width: 100%; max-height: 100vh; margin: auto;" class="rounded-4 fit" src="${detail.image}" />
                            </a>
                        </div>        

                    </aside>
                    <main class="col-lg-6">
                        <div class="ps-lg-3">
                            <h4 class="title text-dark">
                                ${detail.productName}
                            </h4>
                            <div class="d-flex flex-row my-3">
                                <span class="text-muted"><i class="fas fa-shopping-basket fa-sm mx-1"></i>${detail.amount}</span>
                                <span class="${detail.amount ==0 ? "text-danger" : "text-success"} ms-2">${detail.amount ==0 ? "Out of Stock" : "In Stock"}</span>
                            </div>

                            <div class="mb-3">
                                <span class="h5">$ ${detail.price}</span>
                                <span class="text-muted">/Tax-free</span>
                            </div>

                            <p>
                                ${detail.description}
                            </p>

                            <div class="row">
                                <dt class="col-3">Type:</dt>
                                <c:forEach items="${listC}" var="c">
                                    <c:if test="${detail.categoryID == c.categoryID}">
                                        <dd class="col-9">${c.categoryName}</dd>
                                    </c:if>
                                </c:forEach>

                                <dt class="col-3">Brand</dt>
                                <c:forEach items="${listM}" var="m">
                                    <c:if test="${detail.manufacturerID == m.manufacturerID}">
                                        <dd class="col-9">${m.manufacturerName}</dd>
                                    </c:if>
                                </c:forEach>
                            </div>

                            <hr />

                            <!--Success Message -->
                            <div class="${mess != null ? "alert alert-success" : ""}"   style="text-align: center; margin-top: 10px;" role="alert">
                                ${mess}
                            </div>

                            <!-- Failed Message -->
                            <div class="${failmess != null ? "alert alert-danger" : ""}"   style="text-align: center; margin-top: 10px;" role="alert">
                                ${failmess}
                            </div>

                            <c:if test ="${!sessionScope.account.isAdmin}">
                                <c:if test = "${sessionScope.account == null}">
                                    <a href="login.jsp" class="btn btn-primary shadow-0"> <i class="me-1 fa fa-sign-in"></i> Log In to GET IT ! </a>
                                    </c:if>

                                <c:if test = "${sessionScope.account != null && detail.amount <= 0 }">
                                    <a href="addtofavorties?pID=${detail.productID}" class="btn btn-success shadow-0 me-">Add to favorite <i class="fas fa-heart fa-lg px-1"></i></a>
                                    </c:if>

                                <c:if test = "${sessionScope.account != null && detail.amount > 0 && !detail.isDeleted }">
                                    <a href="addtocart?pID=${detail.productID}" class="btn btn-primary shadow-0"> <i class="me-1 fa fa-shopping-basket"></i> Add to cart </a>
                                    <a href="addtofavorties?pID=${detail.productID}" class="btn btn-danger shadow-0 me-"><i class="me-1 fa fa-heart"></i> Add to favorite </a>
                                </c:if>
                            </c:if>

                        </div>
                    </main>
                </div>
            </div>
        </section>

        <!-- content -->
        <!-- Products -->
        <section>
            <div class="container my-5">
                <c:if test="${listP.size() > 1}">
                    <header class="mb-4">
                        <h3>Similar Products</h3>
                    </header>
                </c:if>

                <div class="row">
                    <c:forEach items="${listP}" var="list" begin="0" end="5">    
                        <c:if test ="${list.productID != detail.productID}">
                            <div class="col-lg-2 col-md-6 col-sm-6 d-flex">
                                <div class="card w-80 shadow-2-strong">
                                    <img src="${list.image}" class="card-img-top" style="aspect-ratio: 1 / 1" />
                                    <div class="card-body d-flex flex-column">
                                        <h5><a href="detail?pid=${list.productID}" title="View Details" class="text-dark">${list.productName} </a></h5>
                                        <p class="card-text"> $ ${list.price}</p>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </section>
        <!-- Products -->


        <%@include file="components/footer.jsp" %>


        <!-- MDB -->
        <script type="text/javascript" src="js/mdb.min.js"></script>
        <!-- Custom scripts -->
        <script type="text/javascript" src="js/detail/detail.js"></script>
    </body>
</html>


