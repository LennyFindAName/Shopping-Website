<%-- 
    Document   : favorites
    Created on : Mar 11, 2024, 4:00:18 PM
    Author     : legion
--%>

<%-- 
    Document   : user.jsp
    Created on : Mar 10, 2024, 9:03:49 PM
    Author     : legion
--%>

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
        <title>Profile</title>
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
                                            <a href="loadcart" class="me-1 border rounded py-1 px-3 nav-link d-flex align-items-center" > <i class="fas fa-shopping-cart m-1 me-md-2"></i><p class="d-none d-md-block mb-0"></p> </a>
                                                </c:if> 
                                            </c:if>

                                    <a href="logout" class="me-1 border rounded py-1 px-3 nav-link d-flex align-items-center" > <i class="fas fa-sign-in-alt m-1 me-md-2"></i><p class="d-none d-md-block mb-0"></p> </a>



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
                                <a href="" class="text-white"><u><i class="fas fa-heart m-1 me-md-2"></i>Favorites</u></a>
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
                        <div class="card border shadow-0" >

                            <!-- cart -->
                            <h4 class="cart-title text-center" style="margin-top:30px"><i class="fas fa-heart text-danger"></i> Your Favorites</h4><hr>
                            <div class="table-responsive" style="height:500px" >
                                <table class=" table table-hover text-nowrap" >
                                    <c:if test ="${listP.size() == 0}">
                                        <h5 class="card-title mb-4 text-center">It's quite empty here</h5>
                                    </c:if>
                                    <tbody>
                                    <div class="overflow-y-auto" >
                                        <c:forEach items="${listP}" var="o">
                                            <tr>
                                                <!-- Image -->
                                                <td>
                                                    <img src=" ${o.image} " class="border rounded me-3" style="width: 60px; height: 60px;" />
                                                </td>
                                                <!-- Name -->
                                                <td>
                                                    <a href="detail?pid=${o.productID}" class="btn btn-light border "><div class="">${o.productName}</div> </a>
                                                </td>

                                                <td>
                                                    <button type="button" style="margin-left:70px" class="btn btn-danger" data-mdb-ripple-init data-mdb-modal-init data-mdb-target="#deleteModal${o.productID}">
                                                        Remove
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </div>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- cart -->
                </div>
            </section>
            <!-- cart + summary -->

            <!-- Delete Modal HTML -->
            <c:forEach items="${listP}" var="p">
                <div class="modal fade" id="deleteModal${p.productID}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <form action="deletefavorite?id=${p.productID}" method ="post">
                                <div class="modal-header">						
                                    <h4 class="modal-title">Remove from favorites ?  </h4>
                                </div>
                                <div class="modal-body">					
                                    <p>Are you sure you want to remove this product from favorites?</p>
                                    <p class="text-warning"><small>This action cannot be undone.</small></p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-mdb-ripple-init data-mdb-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-danger" data-mdb-ripple-init>Ok</button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div> 
            </c:forEach>
            <!-- Footer -->
            <%@include file="components/footer.jsp" %>
            <!-- MDB -->
            <script type="text/javascript" src="js/mdb.umd.min.js"></script>
            <!-- MDB -->
            <script type="text/javascript" src="js/mdb.min.js"></script>
            <!-- Custom scripts -->
            <script type="text/javascript" src="js/admin/admin2.js"></script>
        </c:if>
    </body>
</html>



