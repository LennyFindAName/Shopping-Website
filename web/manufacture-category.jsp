<%-- 
    Document   : manufacture-category
    Created on : Mar 11, 2024, 11:53:16 AM
    Author     : legion
--%>
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

        <title>Manufacturer-Category</title>
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

            <%@include file="components/manucate-header.jsp" %>

            <!--Main layout-->
            <main style="margin-top: 58px">
                <div class="container pt-4">
                    <section>
                        <div class="row">
                            <div class="col-xl-6 col-md-12 mb-4">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between p-md-1">
                                            <div>
                                                <h4>Brands</h4>
                                                <p class="mb-0">Total</p>
                                            </div>
                                            <div class="d-flex flex-row">
                                                <div class="align-self-center">
                                                    <h2 class="h1 mb-0 me-4">${listM.size()}</h2>
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
                                            <div>
                                                <h4>Category</h4>
                                                <p class="mb-0">Total</p>
                                            </div>
                                            <div class="d-flex flex-row">
                                                <div class="align-self-center">
                                                    <h2 class="h1 mb-0 me-4">${listC.size()}</h2>
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
                    <section>
                        <!-- Add Message -->
                        <div class="${mess != null ? "alert alert-warning" : ""}"   style="text-align: center; margin-top: 10px;" role="alert">
                            ${mess}
                        </div>
                        <div class="row">
                            <div class="col-xl-6 col-md-12 mb-4">
                                <div class="card" >
                                    <div class="card-header  py-3">

                                        <h5 class="mb-0 text-center ">
                                            <strong>Manufacturers</strong>
                                        </h5>
                                        <button type="button" class="btn btn-success " data-mdb-ripple-init data-mdb-modal-init data-mdb-target="#addManu">
                                            Add
                                        </button>

                                    </div>

                                    <!--  List -->
                                    <div class="card-body overflow-y-scroll" style="height:530px"  >
                                        <div class="table-responsive">

                                            <table class="table table-hover text-nowrap">
                                                <thead>
                                                    <tr>
                                                        <th scope="col" style="width: 150px;">Manufacturer ID  </th>
                                                        <th scope="col" style="width: 150px;">Name </th>
                                                        <th scope="col" style="width: 20px;">Image</th>
                                                        <th scope="col" style="width: 20px;">Total Products</th>
                                                        <th scope="col"></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${listM}" var="p">
                                                        <tr>
                                                            <!-- Manufacturer ID -->
                                                            <td><div class="" style="width: 20px;">${p.manufacturerID}</div></td>

                                                            <!-- ProductName -->
                                                            <td><div style="width: 60px;"> ${p.manufacturerName} </div></td>

                                                            <!-- Image -->
                                                            <td><div class="" style="width: 50px;">
                                                                    <img style="width: 100%;" src="${p.image}">
                                                                </div></td>

                                                            <!-- Total products -->
                                                            <td>
                                                                <div style="width: 100px;">
                                                                    <c:set var="total" value="${dao.countProductByMID(p.manufacturerID)}" />  ${total}
                                                                </div>
                                                            </td>
                                                            <!-- Buttons -->
                                                            <td>
                                                                <button type="button" class="btn btn-primary" data-mdb-ripple-init data-mdb-modal-init data-mdb-target="#editManu${p.manufacturerID}">
                                                                    Edit
                                                                </button>
                                                                <button type="button" class="btn btn-danger" data-mdb-ripple-init data-mdb-modal-init data-mdb-target="#deleteManu${p.manufacturerID}">
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
                            </div>
                            <div class="col-xl-6 col-md-12 mb-4">
                                <div class="card" >
                                    <div class="card-header  py-3">

                                        <h5 class="mb-0 text-center ">
                                            <strong>Categories</strong>
                                        </h5>
                                        <button type="button" class="btn btn-success " data-mdb-ripple-init data-mdb-modal-init data-mdb-target="#addCate">
                                            Add
                                        </button>

                                    </div>

                                    <!-- Product List -->
                                    <div class="card-body overflow-y-scroll" style="height:530px"  >
                                        <div class="table-responsive">

                                            <table class="table table-hover text-nowrap">
                                                <thead>
                                                    <tr>
                                                        <th scope="col" style="width: 50px;">Category ID  </th>
                                                        <th scope="col" style="width: 100px;">Name </th>
                                                        <th scope="col" style="width: 20px;">Image</th>
                                                        <th scope="col" style="width: 20px;">Total Products</th>
                                                        <th scope="col"></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${listC}" var="p">
                                                        <tr>
                                                            <!-- Manufacturer ID -->
                                                            <td><div class="" style="width:50px;">${p.categoryID}</div></td>

                                                            <!-- ProductName -->
                                                            <td><div style="width: 100px;"> ${p.categoryName} </div></td>

                                                            <!-- Image -->
                                                            <td><div class="" style="width: 50px;">
                                                                    <img style="width: 100%;" src="${p.image}">
                                                                </div></td>

                                                            <!-- Total products -->
                                                            <td>
                                                                <div style="width: 100px;">
                                                                    <c:set var="total" value="${dao.countProductByCID(p.categoryID)}" />  ${total}
                                                                </div>
                                                            </td>
                                                            <!-- Buttons -->
                                                            <td>
                                                                <button type="button" class="btn btn-primary" data-mdb-ripple-init data-mdb-modal-init data-mdb-target="#editCate${p.categoryID}">
                                                                    Edit
                                                                </button>
                                                                <button type="button" class="btn btn-danger" data-mdb-ripple-init data-mdb-modal-init data-mdb-target="#deleteCate${p.categoryID}">
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
                            </div>
                        </div>
                    </section>
                </div>

                <!--Add Manu Modal -->    
                <div class="modal fade" id="addManu" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Add Manufacturer </h5>
                                </button>
                            </div>
                            <form action="addmanucate?state=manu" method="post">
                                <div class="modal-body">
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
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-mdb-ripple-init data-mdb-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary" data-mdb-ripple-init>Add</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <!--Add Cate Modal -->    
                <div class="modal fade" id="addCate" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Add Category </h5>
                                </button>
                            </div>
                            <form action="addmanucate?state=cate" method="post">
                                <div class="modal-body">
                                    <div class="form-group">
                                        <label>Name</label>
                                        <input name="name" type="text" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="image">Image</label>
                                        <div class="input-group">
                                            <input type="text" class=" form-control" id="cateADD" name="image" placeholder="Enter image URL" required>
                                            <div class="input-group-append">
                                                <button class="btn btn-primary" type="button" id="checkButton2">Check</button>
                                            </div>
                                        </div>
                                        <img id="previewImage2" class="d-none img-thumbnail mt-2" alt="Image preview">
                                        <div id="errorMessage2" class="text-danger mt-2"></div>                                
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

                <!--Edit Manu Modal -->            
                <c:forEach items="${listM}" var="p">
                    <div class="modal fade" id="editManu${p.manufacturerID}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">

                            <div class="modal-content">
                                <form action="editmanucate?state=manu" method="post">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Edit Manufacturer </h5>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label>ID</label>
                                            <input name="id" type="text" class="form-control" value="${p.manufacturerID}" readonly>
                                        </div>

                                        <div class="form-group">
                                            <label>Name</label>
                                            <input name="name" type="text" class="form-control" value="${p.manufacturerName}" required>
                                        </div>

                                        <div class="form-group">
                                            <label for="image">Image</label>
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="image" name="image" placeholder="Enter image URL" value ="${p.image}"required>
                                            </div>
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

                <!--Edit Cate Modal -->            
                <c:forEach items="${listC}" var="p">
                    <div class="modal fade" id="editCate${p.categoryID}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">

                            <div class="modal-content">
                                <form action="editmanucate?state=cate" method="post">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Edit Category </h5>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label>ID</label>
                                            <input name="id" type="text" class="form-control" value="${p.categoryID}" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label>Name</label>
                                            <input name="name" type="text" class="form-control" value="${p.categoryName}" required>
                                        </div>

                                        <div class="form-group">
                                            <label for="image">Image</label>
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="image" name="image" placeholder="Enter image URL" value ="${p.image}"required>
                                            </div>
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

                <!-- Delete Manu HTML -->
                <c:forEach items="${listM}" var="p">
                    <div class="modal fade" id="deleteManu${p.manufacturerID}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <form action="deletemanucate?id=${p.manufacturerID}&&state=manu" method ="post">
                                    <div class="modal-header">						
                                        <h4 class="modal-title">Delete Manufacturer </h4>
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

                <!-- Delete Cate HTML -->
                <c:forEach items="${listC}" var="p">
                    <div class="modal fade" id="deleteCate${p.categoryID}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <form action="deletemanucate?id=${p.categoryID}&&state=cate" method ="post">
                                    <div class="modal-header">						
                                        <h4 class="modal-title">Delete Category </h4>
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
            <script type="text/javascript" src="js/admin/addmanu.js"></script>
            <script type="text/javascript" src="js/admin/addcate.js"></script>
        </c:if>

    </body>

</html>
