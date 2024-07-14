<%-- 
    Document   : admin
    Created on : Mar 4, 2024, 8:07:19 PM
    Author     : legion
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

        <title>Orders</title>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.0.0/css/all.css" />
        <!-- Google Fonts Roboto -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" />
        <!-- MDB -->
        <link rel="stylesheet" href="css/mdb.min.css" />

        <!-- Custom styles -->
        <link rel="stylesheet" href="css/admin/admin.css" />

    </head>

    <body>
        <!-- Deny access to non Admin -->
        <c:if test ="${!sessionScope.account.isAdmin}">
            <jsp:include page="denyaccess.jsp"></jsp:include>
        </c:if>

        <c:if test ="${sessionScope.account.isAdmin}">

            <%@include file="components/orders-header.jsp" %>

            <!--Main layout-->
            <main style="margin-top: 58px">
                <div class="container pt-4">



                    <!--Section: Manager Products-->
                    <section class="mb-4">
                        <div class="card">
                            <div class="card-header  py-3">

                                <h5 class="mb-0 text-center ">
                                    <strong>Orders Log</strong>
                                </h5>

                                <div style="position: relative; width: 100%;">
                                    <div style="position: absolute; right: 0;top: 0%; transform: translateY(-85%);">
                                        <form action="search" method="post">
                                            <div class="input-group float-center">
                                                <div class="form-outline">
                                                    <input name="txt" type="text" id="form1" class="form-control" style ="background-color: whitesmoke"/>
                                                    <label class="form-label" for="form1">Search</label>
                                                </div>
                                                <button type="submit" class="btn btn-primary shadow-0">
                                                    <i class="fas fa-search"></i>
                                                </button>
                                            </div>
                                        </form>

                                    </div>
                                </div>
                            </div>

                            <!-- Order List -->
                            <div class="card-body overflow-y-scroll" style="height:575px"  >
                                <div class="table-responsive">

                                    <table class="table table-hover text-nowrap">
                                        <thead>
                                            <tr>
                                                <th scope="col" style="width: 150px;">Order ID  </th>
                                                <th scope="col" style="width: 150px;">Username </th>
                                                <th scope="col" style="width: 150px;">Date</th>
                                                <th scope="col" style="width: 150px;">Total Price</th>
                                                <th scope="col" style="width: 150px;">Status</th>
                                                <th scope="col" style="width: 150px;">Order Details</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${orders}" var="o">
                                                <tr>
                                                    <!-- Order ID -->
                                                    <td><div class="" style="width: 150px;">${o.orderID}</div></td>

                                                    <!-- User's name -->
                                                    <td>
                                                        <div class="" style="width: 150px;"> 
                                                            <c:forEach items="${accs}" var="a">
                                                                <c:if test="${a.id == o.uID}">
                                                                    ${a.username}
                                                                </c:if>
                                                            </c:forEach> 
                                                        </div>
                                                    </td>

                                                    <!-- Date -->
                                                    <td><div class="" style="width: 150px;">${o.date}</div></td>

                                                    <!-- Total -->
                                                    <td><div class="" style="width: 150px;">${o.totalPrice}</div></td>

                                                    <!-- Status -->
                                                    <td>
                                                        <div class="" style="width: 150px;">
                                                            <c:if test="${o.isOrdering}">
                                                                <i class="fas fa-truck m-1 me-md-2"></i><small class="text-warning"> Delivering </small>
                                                                </c:if>

                                                            <c:if test="${o.isCancel}">
                                                                <i class="fas fa-times m-1 me-md-2 "></i><small class="text-danger"> Canceled </small>
                                                                </c:if>

                                                            <c:if test="${o.isArrived}">
                                                                <i class="fas fa-house m-1 me-md-2"></i><small class="text-success "> Arrived </small>
                                                                </c:if>
                                                        </div>
                                                    </td>

                                                    <td>
                                                        <button type="button" class="btn btn-primary" data-mdb-ripple-init data-mdb-modal-init data-mdb-target="#detailModal${o.orderID}">
                                                            ...
                                                        </button>
                                                    </td>
                                                </tr>
                                            </c:forEach>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!--Section: Manager Products-->
                    <!--Section: Statistics with subtitles-->
                    <section>

                        <div class="row">
                            <div class="col-xl-6 col-md-12 mb-4">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between p-md-1">
                                            <div>
                                                <h4>Total Orders</h4>
                                                <p class="mb-0">All time</p>
                                            </div>
                                            <div class="d-flex flex-row">
                                                <div class="align-self-center">
                                                    <h2 class="h1 mb-0 me-4">${orders.size()}</h2>
                                                </div>
                                            </div>
                                            <div class="align-self-center">
                                                <i class="fa fa-archive text-danger fa-3x"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6 col-md-12 mb-4">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between p-md-1">
                                            <div class="d-flex flex-row">
                                                <div class="align-self-center">
                                                    <h2 class="h1 mb-0 me-4">$ ${total}</h2>
                                                </div>
                                                <div>
                                                    <h4>Total Gain</h4>
                                                    <p class="mb-0">Delivering and Arrived Orders</p>
                                                </div>
                                            </div>
                                            <div class="align-self-center">
                                                <i class="fas fa-wallet text-success fa-3x"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6 col-md-12 mb-4">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between p-md-1">
                                            <div>
                                                <h4>Orders</h4>
                                                <p class="mb-0">Delivering</p>
                                            </div>
                                            <div class="d-flex flex-row">
                                                <div class="align-self-center">
                                                    <h2 class="h1 mb-0 me-4">${ordering}</h2>
                                                </div>
                                            </div>
                                            <div class="align-self-center">
                                                <i class="fa fa-truck text-warning fa-3x"></i>
                                            </div>
                                            <div>
                                                <h4>Orders</h4>
                                                <p class="mb-0">Arrived</p>
                                            </div>
                                            <div class="d-flex flex-row">
                                                <div class="align-self-center">
                                                    <h2 class="h1 mb-0 me-4">${arrived}</h2>
                                                </div>
                                            </div>
                                            <div class="align-self-center">
                                                <i class="fa fa-house text-success fa-3x"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6 col-md-12 mb-4">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between p-md-1">
                                            <div>
                                                <h4>Success Rate</h4>
                                                <p class="mb-0">Arrived + Delivering / Total </p>
                                            </div>
                                            <div class="d-flex flex-row">
                                                <div class="align-self-center">
                                                    <h2 class="h1 mb-0 me-4">${rate} %</h2>
                                                </div>
                                            </div>
                                            <div class="align-self-center">
                                                <i class="fa fa-archive text-danger fa-3x"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <!--Section: Statistics with subtitles-->


                </div>


                <!--Detail Modal -->            
                <c:forEach items="${orders}" var="o">
                    <div class="modal fade" id="detailModal${o.orderID}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">

                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Order Details </h5>
                                    </button>
                                </div>
                                <div class="modal-body">


                                    <c:forEach items="${details}" var="d">
                                        <c:if test="${d.orderID == o.orderID}">
                                            <c:forEach items="${listP}" var="p">
                                                <c:if test="${d.productID == p.productID}">
                                                    <div class="form-group">
                                                        <label>Product ID : ${p.productID}</label>
                                                        <input name="name" type="text" class="form-control" value="${p.productName}" readonly>
                                                        <label>Quantity</label>
                                                        <input name="name" type="text" class="form-control" value="${d.quantity}" readonly>
                                                        <label>Price</label>
                                                        <input name="name" type="text" class="form-control" value="${p.price}" readonly>
                                                    </div>
                                                    <br>
                                                    <hr>
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                    </c:forEach>

                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-mdb-ripple-init data-mdb-dismiss="modal" >Close</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>

            </main>
            <!--Main layout-->
            <!-- MDB -->
            <script type="text/javascript" src="js/mdb.umd.min.js"></script>
            <!-- Custom scripts -->
            <script type="text/javascript" src="js/admin/admin2.js"></script>
        </c:if>

    </body>

</html>
