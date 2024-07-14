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
                                            <a href="loadfavorites" class="border rounded py-1 px-3 nav-link d-flex align-items-center" > <i class="fas fa-heart m-1 me-md-2"></i><p class="d-none d-md-block mb-0"></p> </a>
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
                                <a href="" class="text-white"><u><i class="fas fa-user m-1 me-md-2"></i>User</u></a>
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
                                <h6 class="h3 card-title mb-4 text-center" style="margin-top:30px"><i class="fas fa-history m-1 me-md-2"></i>Order History</h6>
                                <div class="m-4 overflow-y-auto" style="height:775px; ">
                                    <c:if test ="${orders.size() == 0}">
                                        <h5 class="card-title mb-4 text-center">It's quite empty here .....</h5>
                                    </c:if>

                                    <c:forEach items="${orders}" var="o">
                                        <h5 class="card-title mb-4"> 
                                            <i class="fas fa-shopping-cart m-1 me-md-2"></i><small class="text-muted"> Order ID : ${o.orderID} - </small>
                                            <small class="text-muted">$ ${o.totalPrice} - </small>
                                            <i class="fas fa-calendar m-1 me-md-2"></i><small class="text-muted"> ${o.date} - </small>
                                            <i class="fas fa-map-marker m-1 me-md-2"></i><small class="text-muted"> ${o.address} - </small>
                                                <c:if test="${o.isOrdering}">
                                                <i class="fas fa-truck m-1 me-md-2"></i><small class="text-warning"> Delivering </small>
                                                </c:if>

                                            <c:if test="${o.isCancel}">
                                                <i class="fas fa-times m-1 me-md-2 "></i><small class="text-danger"> Canceled </small>
                                                </c:if>

                                            <c:if test="${o.isArrived}">
                                                <i class="fas fa-home m-1 me-md-2"></i><small class="text-success "> Arrived </small>
                                                </c:if>

                                            <c:if test="${!o.isCancel && !o.isArrived}">
                                                <button type="button" style="margin-left:70px" class="btn btn-danger" data-mdb-ripple-init data-mdb-modal-init data-mdb-target="#deleteModal${o.orderID}">
                                                    Cancel
                                                </button>
                                            </c:if>
                                        </h5>

                                        <c:forEach items="${details}" var="d">
                                            <c:if test="${d.orderID == o.orderID}">
                                                <c:forEach items="${listP}" var="p">
                                                    <c:if test ="${d.productID == p.productID}">

                                                        <div class="row gy-3 mb-4">

                                                            <div class="col-lg-6">
                                                                <div class="me-lg-4">
                                                                    <div class="d-flex">
                                                                        <img src=" ${p.image} " class="border rounded me-3" style="width: 96px; height: 96px;" />
                                                                        <div class="">${p.productName}</div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="col-lg-3 col-sm-8 col-8 d-flex flex-row flex-lg-column flex-xl-row text-nowrap">
                                                                <div>
                                                                    <div class="input-group mb-0" style="width: 100px;">
                                                                        <input type="text" name="quantity" class="form-control text-center border border-secondary" value="${d.quantity}" readonly/>
                                                                    </div>
                                                                </div>

                                                            </div>

                                                            <div class="col-lg-3 col-sm-6 col-6 d-flex flex-row flex-lg-column flex-xl-row text-nowrap">
                                                                <div class="">
                                                                    <small class="text-muted text-nowrap"> $ ${p.price}/ per item </small>
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </c:forEach>
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
                                    <div class="justify-content-start text-center">
                                        <h3 class="mb-2 fw-bold"><i class="fas fa-user m-1 me-md-2"></i> ${sessionScope.account.username}</h3>
                                    </div>
                                    <img src="${user.image != null ? user.image : "https://cdn.pixabay.com/photo/2021/07/02/04/48/user-6380868_960_720.png"}" style="width: 300px; height:250px" class=" img-thumbnail mt-2" >
                                    <br>
                                    <hr>
                                    <div class="justify-content-start"> 
                                        <p class="mb-2 fw-bold"><i class="fas fa-info-circle m-1 me-md-2"></i>Full Name : </p>
                                        <p class="">${user.name != null ? user.name : "Empty"}</p>
                                    </div>
                                    <div class=" justify-content-start ">
                                        <p class="mb-2 fw-bold"><i class="fas fa-envelope m-1 me-md-2"></i>Contact G-mail:</p>
                                        <p class="">${user.gmail != null ? user.gmail : "Empty"}</p>
                                    </div>

                                    <div class=" justify-content-start ">
                                        <p class="mb-2 fw-bold"><i class="fas fa-phone m-1 me-md-2"></i>Contact Phone Number:</p>
                                        <p class="">${user.phone != 0 ? user.phone : "Empty"}</p>
                                    </div>
                                    <div class="justify-content-start">
                                        <p class="mb-2 fw-bold"><i class="fas fa-home m-1 me-md-2"></i>Address 1: </p>
                                        <p class="">${user.address1 != null ? user.address1 : "Empty"}</p>
                                    </div>
                                    <div class="justify-content-start">
                                        <p class="mb-2 fw-bold"><i class="fas fa-home m-1 me-md-2"></i>Address 2: </p>
                                        <p class="">${user.address2 != null ? user.address2 : "Empty"}</p>
                                    </div>
                                    <hr />

                                    <div class="mt-3">
                                        <button type="button" class="btn btn-primary w-100 border mt-2" data-mdb-ripple-init data-mdb-modal-init data-mdb-target="#updateModal">
                                            Update Profile
                                        </button>

                                        <button type="button" class="btn btn-warning w-100 border mt-2" data-mdb-ripple-init data-mdb-modal-init data-mdb-target="#changePassModal">
                                            Change Password
                                        </button>

                                        <!--  Message -->
                                        <div class="${mess != null ? "alert alert-warning" : ""}"   style="text-align: center; margin-top: 10px;" role="alert">
                                            ${mess}
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

            <!--Update Modal -->            
            <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">

                    <div class="modal-content">
                        <form action="updateuser?action=profile" method="post">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Update Profile  </h5>
                            </div>
                            <div class="modal-body">

                                <div class="form-group">
                                    <label>Full Name</label>
                                    <input name="name" type="text" class="form-control" value="${user.name != null ? user.name : ""}" required>
                                </div>

                                <div class="form-group">
                                    <label for="image">Image</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="image" name="image" placeholder="Enter image URL" value ="${user.image != null ? user.image : "https://cdn.pixabay.com/photo/2021/07/02/04/48/user-6380868_960_720.png"}" required>
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button" id="checkButton">Check</button>   
                                        </div>
                                    </div>
                                    <img id="previewImage" class="d-none img-thumbnail mt-2" alt="Image preview">
                                    <div id="errorMessage" class="text-danger mt-2"></div>                                
                                </div>


                                <div class="form-group">
                                    <label>Contact G-mail</label>
                                    <input name="gmail" type="text" class="form-control" value="${user.gmail != null ? user.gmail : ""}" required>
                                </div>

                                <div class="form-group">
                                    <label>Contact phone number</label>
                                    <input name="phone" type="number" class="form-control" value="${user.phone != 0 ? user.phone : ""}" required>
                                </div>
                                <div class="form-group">
                                    <label>Address 1</label>
                                    <input name="address1" type="text" class="form-control" value="${user.address1 != null ? user.address1 : ""}" required>
                                </div>
                                <div class="form-group">
                                    <label>Address 2</label>
                                    <input name="address2" type="text" class="form-control" value="${user.address2 != null ? user.address2 : ""}" required>
                                </div>
                                <div class="form-group">
                                    <label>Enter password</label>
                                    <input name="password" type="text" class="form-control" value="" required>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-mdb-ripple-init data-mdb-dismiss="modal" >Close</button>
                                <button type="submit" class="btn btn-primary" data-mdb-ripple-init>Update</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!--Change Pass Modal -->            
            <div class="modal fade" id="changePassModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">

                    <div class="modal-content">
                        <form action="updateuser?action=password" method="post">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Change Password  </h5>
                            </div>
                            <div class="modal-body">

                                <div class="form-group">
                                    <label>Password</label>
                                    <input name="newpass" type="password" class="form-control" value="" required>
                                </div>
                                <div class="form-group">
                                    <label>Old Password</label>
                                    <input name="oldpass" type="password" class="form-control" value="" required>
                                </div>
                                <div class="form-group">
                                    <label>Confirm Old Password</label>
                                    <input name="oldpassre" type="password" class="form-control" value="" required>
                                </div>



                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-mdb-ripple-init data-mdb-dismiss="modal" >Close</button>
                                <button type="submit" class="btn btn-primary" data-mdb-ripple-init>Update</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Delete Modal HTML -->
            <c:forEach items="${orders}" var="p">
                <div class="modal fade" id="deleteModal${p.orderID}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <form action="cancelorder?oid=${p.orderID}" method ="post">
                                <div class="modal-header">						
                                    <h4 class="modal-title">Cancel Order ${p.orderID} ?  </h4>
                                </div>
                                <div class="modal-body">					
                                    <p>Are you sure you want to cancel your order?</p>
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


