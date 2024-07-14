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

        <title>Admin</title>
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

            <%@include file="components/admin-header.jsp" %>

            <!--Main layout-->
            <main style="margin-top: 58px">
                <div class="container pt-4">


                    <!--Section: Manager Products-->
                    <section class="mb-4">
                        <div class="card" >
                            <div class="card-header  py-3">

                                <h5 class="mb-0 text-center ">
                                    <strong>Manager Products</strong>
                                </h5>
                                <button type="button" class="btn btn-success " data-mdb-ripple-init data-mdb-modal-init data-mdb-target="#addProductModal">
                                    Add
                                </button>

                                <div style="position: relative; width: 100%;">
                                    <div style="position: absolute; right: 0;top: 50%; transform: translateY(-100%);">
                                        <form action="searchproductmanager" method="post">
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

                            <!-- Product List -->
                            <div class="card-body overflow-y-scroll" style="height:550px"  >
                                <div class="table-responsive">

                                    <table class="table table-hover text-nowrap">
                                        <thead>
                                            <tr>
                                                <th scope="col" style="width: 150px;">ProductID  </th>
                                                <th scope="col" style="width: 150px;">Name </th>
                                                <th scope="col" style="width: 20px;">Image</th>
                                                <th scope="col" style="width: 20px;">Category</th>
                                                <th scope="col">Description</th>
                                                <th scope="col" style="width: 20px;">Manufacturer</th>
                                                <th scope="col" style="width: 20px;">Amount</th>
                                                <th scope="col" style="width: 50px;">Price</th>
                                                <th scope="col"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listP}" var="p">
                                                <tr>
                                                    <!-- ProductID -->
                                                    <td><div class="" style="width: 20px;">${p.productID}</div></td>

                                                    <!-- ProductName -->
                                                    <td><div class="overflow-x-scroll" style="width: 150px;"> ${p.productName} </div></td>

                                                    <!-- Image -->
                                                    <td><div class="" style="width: 50px;">
                                                            <img style="width: 100%;" src="${p.image}">
                                                        </div></td>

                                                    <!-- Category -->
                                                    <td>
                                                        <div class="text-center" style="width: 20px;">  
                                                            <c:forEach items="${listC}" var="c">
                                                                <c:if test="${c.categoryID == p.categoryID}">
                                                                    ${c.categoryName}
                                                                </c:if>
                                                            </c:forEach>
                                                        </div>
                                                    </td>

                                                    <!-- Description -->
                                                    <td><div class="overflow-x-scroll" style="width: 100px;">${p.description}</div></td>

                                                    <!-- Manufacturer -->
                                                    <td>
                                                        <div class="text-center" style="width: 20px;">
                                                            <c:forEach items="${listM}" var="m">
                                                                <c:if test="${m.manufacturerID == p.manufacturerID}">
                                                                    ${m.manufacturerName}
                                                                </c:if>
                                                            </c:forEach>
                                                        </div>
                                                    </td>

                                                    <!-- Amount -->
                                                    <td><div class="" style="width: 20px;">${p.amount}</div></td>

                                                    <!-- Price -->
                                                    <td>
                                                        <span class="text-success">
                                                            <i class="fas fa-usd me-1"></i><span>${p.price}</span>
                                                        </span>
                                                    </td>

                                                    <!-- Buttons -->
                                                    <td>
                                                        <button type="button" class="btn btn-primary" data-mdb-ripple-init data-mdb-modal-init data-mdb-target="#editProductModal${p.productID}">
                                                            Edit
                                                        </button>
                                                        <button type="button" class="btn btn-danger" data-mdb-ripple-init data-mdb-modal-init data-mdb-target="#deleteProductModal${p.productID}">
                                                            Delete
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
                        <!-- Add Message -->
                        <div class="${mess != null ? "alert alert-warning" : ""}"   style="text-align: center; margin-top: 10px;" role="alert">
                            ${mess}
                        </div>
                        <div class="row">
                            <div class="col-xl-6 col-md-12 mb-4">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between p-md-1">
                                            <div>
                                                <h4>Products</h4>
                                                <p class="mb-0">Total Available</p>
                                            </div>
                                            <div class="d-flex flex-row">
                                                <div class="align-self-center">
                                                    <h2 class="h1 mb-0 me-4">${listP.size()}</h2>
                                                </div>
                                            </div>
                                            <div class="align-self-center">
                                                <i class="fa fa-archive text-warning fa-3x"></i>
                                            </div>
                                            <div>
                                                <h4>Amount</h4>
                                                <p class="mb-0">Total</p>
                                            </div>
                                            <div class="d-flex flex-row">
                                                <div class="align-self-center">
                                                    <h2 class="h1 mb-0 me-4">${amount}</h2>
                                                </div>
                                            </div>
                                            <div class="align-self-center">
                                                <i class="fa fa-archive text-warning fa-3x"></i>
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
                                                    <h4>Total Cost</h4>
                                                    <p class="mb-0">All products</p>
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
                                                <h4>In Stock</h4>
                                                <p class="mb-0">Available</p>
                                            </div>
                                            <div class="d-flex flex-row">
                                                <div class="align-self-center">
                                                    <h2 class="h1 mb-0 me-4">${available}</h2>
                                                </div>
                                            </div>
                                            <div class="align-self-center">
                                                <i class="fa fa-archive text-success fa-3x"></i>
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
                                                <h4>Out of Stock</h4>
                                                <p class="mb-0">Unavailable</p>
                                            </div>
                                            <div class="d-flex flex-row">
                                                <div class="align-self-center">
                                                    <h2 class="h1 mb-0 me-4">${unavailable}</h2>
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

                <!--Add Modal -->    
                <div class="modal fade" id="addProductModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Add Product </h5>
                                </button>
                            </div>
                            <form action="addproduct" method="post">
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label>Category</label><br>
                                        <select name="category" class="select mb-3">
                                            <c:forEach items="${listC}" var="c">
                                                <option value="${c.categoryID}">${c.categoryName}</option>   
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label>Manufacturer</label><br>
                                        <select name="manufacturer" class="select mb-3">
                                            <c:forEach items="${listM}" var="m">
                                                <option value="${m.manufacturerID}">${m.manufacturerName}</option>   
                                            </c:forEach>
                                        </select>                        
                                    </div>
                                    <div class="form-group">
                                        <label>Name</label>
                                        <input name="name" type="text" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="image">Image</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="image" name="image" placeholder="Enter image URL" required>
                                            <div class="input-group-append">
                                                <button class="btn btn-primary" type="button" id="checkButton">Check</button>
                                            </div>
                                        </div>
                                        <img id="previewImage" class="d-none img-thumbnail mt-2" alt="Image preview">
                                        <div id="errorMessage" class="text-danger mt-2"></div>                                
                                    </div>

                                    <div class="form-group">
                                        <label>Description</label>
                                        <textarea name="description" class="form-control" required></textarea>
                                    </div>

                                    <div class="form-group">
                                        <label>Amount</label>
                                        <input name="amount" type="number" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Price</label>
                                        <input name="price" type="number" class="form-control"required>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-mdb-ripple-init data-mdb-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary" data-mdb-ripple-init>Add</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <!--Edit Modal -->            
                <c:forEach items="${listP}" var="p">
                    <div class="modal fade" id="editProductModal${p.productID}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">

                            <div class="modal-content">
                                <form action="editproduct" method="post">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Edit Product </h5>
                                        <input style="width:100px; text-align: center" type="number" class="form-control" name="pID" value="${p.productID}" readonly>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label>Category</label><br>
                                            <select name="category" class="select mb-3">
                                                <c:forEach items="${listC}" var="c">
                                                    <option value="${c.categoryID}" ${c.categoryID == p.categoryID? "selected": ""}>${c.categoryName}</option>   
                                                </c:forEach>
                                            </select>
                                        </div>

                                        <div class="form-group">
                                            <label>Manufacturer</label><br>
                                            <select name="manufacturer" class="select mb-3">
                                                <c:forEach items="${listM}" var="m">
                                                    <option value="${m.manufacturerID}" ${m.manufacturerID == p.manufacturerID ? "selected": ""}>${m.manufacturerName}</option>   
                                                </c:forEach>
                                            </select>                        
                                        </div>
                                        <div class="form-group">
                                            <label>Name</label>
                                            <input name="name" type="text" class="form-control" value="${p.productName}" required>
                                        </div>

                                        <div class="form-group">
                                            <label for="image">Image</label>
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="image" name="image" placeholder="Enter image URL" value ="${p.image}"required>
                                                <!--                                        <div class="input-group-append">
                                                                                            <button class="btn btn-primary" type="button" id="checkButton">Check</button>
                                                                                        </div>-->
                                            </div>
                                            <!--                                    <img id="previewImage" class="d-none img-thumbnail mt-2" alt="Image preview">
                                                                                <div id="errorMessage" class="text-danger mt-2"></div>                                -->
                                        </div>


                                        <div class="form-group">
                                            <label>Description</label>
                                            <textarea name="description" class="form-control" required> ${p.description}</textarea>
                                        </div>

                                        <div class="form-group">
                                            <label>Amount</label>
                                            <input name="amount" type="number" class="form-control" value="${p.amount}" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Price</label>
                                            <input name="price" type="number" class="form-control" value="${p.price}" required>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-mdb-ripple-init data-mdb-dismiss="modal" >Close</button>
                                        <button type="submit" class="btn btn-primary" data-mdb-ripple-init>Save changes</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>

                <!-- Delete Modal HTML -->
                <c:forEach items="${listP}" var="p">
                    <div class="modal fade" id="deleteProductModal${p.productID}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <form action="deleteproduct?pid=${p.productID}" method ="post">
                                    <div class="modal-header">						
                                        <h4 class="modal-title">Delete Product </h4>
                                    </div>
                                    <div class="modal-body">					
                                        <p>Are you sure you want to delete these Records?</p>
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
            </main>
            <!--Main layout-->
            <!-- MDB -->
            <script type="text/javascript" src="js/mdb.umd.min.js"></script>
            <!-- Custom scripts -->
            <script type="text/javascript" src="js/admin/admin2.js"></script>
        </c:if>

    </body>

</html>
