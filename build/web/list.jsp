<%-- 
    Document   : list
    Created on : Feb 11, 2024, 2:26:11 PM
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
        <!-- Bootstrap 5 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <!-- MDB -->
        <link rel="stylesheet" href="css/mdb.min.css" />
        <!-- Custom styles -->
        <link rel="stylesheet" type="text/css" href="css/list/list.css" />
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

            <div class="bg-primary text-white py-5 " style="margin-bottom: 50px">
                <div class="container   py-5">
                    <h1>
                        Best products & <br />
                        brands in our store
                    </h1>
                    <p>
                        Trendy Products, Factory Prices, Excellent Service
                    </p>                   
                </div>
            </div>
            <div class="collapse navbar-collapse" id="navbarLeftAlignExample">
                <!-- Left links -->
                <p class="medium fw-bold  mb-1"><a href="home" id="cancel_signup"><i class="fas fa-angle-left"></i> Back to Home</a></p>
                <!-- Left links -->
            </div>
            <!-- Jumbotron -->
        </header>

        <!-- sidebar + content -->
        <section class="">
            <div class="container">
                <div class="row">

                    <!-- sidebar -->
                    <div class="col-lg-3">
                        <div style="margin-bottom: 20px;">
                            <p class="medium fw-bold  mb-1" ><a href="home" id="cancel_signup"><i class="fas fa-angle-left"></i> Back to Home</a></p>                        <!-- Toggle button -->
                        </div>


                        <!-- Collapsible wrapper -->
                        <div class="collapse card d-lg-block mb-5" >

                            <div class="accordion" >
                                <div class="accordion-item">
                                    <h2 class="accordion-header" >
                                        <button
                                            class="accordion-button text-dark bg-light"
                                            >
                                            Related items
                                        </button>
                                    </h2>
                                    <div class="accordion-collapse collapse show">
                                        <div class="accordion-body">
                                            <ul class="list-group list-group-light ">
                                                <li class="list-group px-3 border-0 ${cid == null ? "active" : ""}" aria-current="true">
                                                    <a class ="${cid != null ? "text-dark" : ""} " href="list">All</a>
                                                </li>
                                                <c:forEach items="${listC}" var="c">
                                                    <li class="list-group px-3 border-0 ${cid == c.categoryID ? "active" : ""}">
                                                        <a class ="${cid != c.categoryID ? "text-dark" : ""}" href="category?cid=${c.categoryID}"><span>${c.categoryName} </span></a>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingTwo">
                                        <button
                                            class="accordion-button text-dark bg-light"
                                            type="button"
                                            data-mdb-toggle="collapse"
                                            data-mdb-target="#panelsStayOpen-collapseTwo"
                                            aria-expanded="true"
                                            aria-controls="panelsStayOpen-collapseTwo"
                                            >
                                            Brands
                                        </button>
                                    </h2>
                                    <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse show" aria-labelledby="headingTwo">
                                        <div class="accordion-body">
                                            <div>
                                                <ul class="list-group list-group-light ">
                                                    <li class="list-group px-3 border-0 ${mid == null ? "active" : ""}" aria-current="true">
                                                        <a class ="${mid != null ? "text-dark" : ""} " href="list">All</a>
                                                    </li>
                                                    <c:forEach items="${listM}" var="m">
                                                        <li class="list-group px-3 border-0 ${mid == m.manufacturerID ? "active" : ""}">
                                                            <a class ="${mid != m.manufacturerID ? "text-dark" : ""}" href="manufacturer?mid=${m.manufacturerID}"><span>${m.manufacturerName} </span></a>
                                                        </li>
                                                    </c:forEach>

                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="headingThree">
                                        <button
                                            class="accordion-button text-dark bg-light"
                                            type="button"
                                            data-mdb-toggle="collapse"
                                            data-mdb-target="#panelsStayOpen-collapseThree"
                                            aria-expanded="false"
                                            aria-controls="panelsStayOpen-collapseThree"
                                            >
                                            Price
                                        </button>
                                    </h2>
                                    <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse show" aria-labelledby="headingThree">
                                        <div class="accordion-body">

                                            <form action="pricefilter?isFilter=1" method="get">                                            
                                                <div class="row mb-3">
                                                    <div class="col-6">
                                                        <p class="mb-0">
                                                            Min
                                                        </p>
                                                        <div class="form-outline">
                                                            <input name="min" type="number" id="typeNumber" value="" class="form-control" style ="background-color: whitesmoke;" required/>
                                                            <label class="form-label" for="typeNumber">$0</label>
                                                        </div>
                                                    </div>
                                                    <div class="col-6">
                                                        <p class="mb-0">
                                                            Max
                                                        </p>
                                                        <div class="form-outline">
                                                            <input name="max" type="number" id="typeNumber" value="" class="form-control" style ="background-color: whitesmoke;" required/>
                                                            <label class="form-label" for="typeNumber">$1000</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <button type="submit" class="btn btn-white w-100 border border-secondary">apply</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- sidebar -->
                    <!-- content -->
                    <div class="col-lg-9">
                        <header class=" align-items-lg-start border-bottom mb-4 pb-3">
                            <p><span  class ="category-name" > ${listP.size()} </span> items available </p>

                            <!--                            <div class="ms-auto">
                                                            <select class="form-select d-inline-block w-auto border pt-1">
                                                                <option value="0">Newest</option>
                                                                <option value="0">Oldest</option>
                                                                <option value="1">Most expensive</option>
                                                                <option value="2">Cheapest</option>
                                                                <option value="3">Randomly</option>
                                                            </select>
                                                            <div class="btn-group shadow-0 border">
                                                                <button type="submit" class="btn btn-primary shadow-0">
                                                                    <i class="fas fa-search"></i>
                                                                </button>
                                                            </div>
                                                        </div>-->
                            <div style="position: relative; width: 100%;">
                                <div style="position: absolute; right: 0;top: 50%; transform: translateY(-150%);">
                                    <form action="search" method="get">
                                        <div class="input-group float-center">
                                            <div class="form-outline">
                                                <input name="txt" type="text" id="form1" class="form-control" style ="background-color: whitesmoke;"/>
                                                <label class="form-label" for="form1">Search</label>
                                            </div>
                                            <button type="submit" class="btn btn-primary shadow-0">
                                                <i class="fas fa-search"></i>
                                            </button>
                                        </div>
                                    </form>

                                </div>
                            </div>
                        </header>
                        <c:if test="${listP.size() == 0}">
                            <h3 class="text-dark text-center">It's quite empty here ......</h3>
                        </c:if>

                        <c:forEach items ="${listP}" var="p" begin="${page.begin}" end ="${page.end-1}">
                            <div class="row justify-content-center mb-3">
                                <div class="col-md-12">
                                    <div class="card shadow-0 border rounded-3">
                                        <div class="card-body">
                                            <div class="row g-0">
                                                <div class="col-xl-3 col-md-4 d-flex justify-content-center">
                                                    <div class="bg-image hover-zoom ripple rounded ripple-surface me-md-3 mb-3 mb-md-0">
                                                        <img src="${p.image}" class="w-100" />
                                                        <a href="#!">
                                                            <div class="hover-overlay">
                                                                <div class="mask" style="background-color: rgba(253, 253, 253, 0.15);"></div>
                                                            </div>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="col-xl-6 col-md-5 col-sm-7">
                                                    <h5><a href="detail?pid=${p.productID}" title="View Details" class="text-dark">${p.productName} </a></h5>
                                                    <div class="d-flex flex-row">

                                                        <span class="text-muted">${p.amount} items available</span>
                                                    </div>
                                                </div>
                                                <div class="col-xl-3 col-md-3 col-sm-5" style="justify-content: center">
                                                    <div class="d-flex flex-row align-items-center mb-1" style="justify-content: center; margin:0 auto"  >
                                                        <h3 class="mb-1 me-1" style="text-align: center" >$ ${p.price}</h3>
                                                    </div>
                                                    <h6 class="text-success" style="text-align: center; margin:0 auto">Free shipping</h6>    

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>



                        <hr />

                        <!-- Pagination All-->
                        <!-- Pagination -->
                        <c:if test="${cid == null && isSearch == null && mid == null && isFilter == null}">
                            <form action ="list" method ="post"></c:if>
                            <c:if test="${cid != null}">
                                <form action ="category?cid=${cid}" method ="post"></c:if>
                                <c:if test="${isSearch != null}">
                                    <form action ="search?txt=${txt}" method ="post"></c:if>
                                    <c:if test="${mid != null}">
                                        <form action ="manufacturer?mid=${mid}" method ="post"></c:if>
                                        <c:if test="${isFilter != null && cid == null && isSearch == null && mid == null}">
                                            <form action ="pricefilter?isFilter=${isFilter}" method ="post"></c:if>

                                                <nav aria-label="Page navigation example" class="d-flex justify-content-center mt-3">
                                                    <ul class="pagination"> 
                                                        <select class="browser-default custom-select" style="margin-right:30px;" name ='nrpp' placeholder="Enter size">
                                                        <c:forEach items = "${nrppArr}" var ="nr">
                                                            <option value='${nr}' ${nr==page.nrpp? "selected":""}>
                                                            <li class="page-item">${nr} items</li>
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                    <input type="text" name ="index" value ="${page.index}" hidden>
                                                    <input type="text" name ="total" value ="${page.totalPage}" hidden>

                                                    <c:if test ="${page.index!=0}">
                                                        <li class="page-item"><input class="page-link " type ="submit" name="btnHome" value ="First"></li>
                                                        <li class="page-item"><input class="page-link " type ="submit" name="btnPre" value ="Pre"></li>
                                                        </c:if>

                                                    <c:forEach var="p" begin ='${page.pageStart}' end ='${page.pageEnd}'>
                                                        <li class="page-item ${p == page.index? "active" : ""}"><input class ="page-link " type="submit" name="btn${p}" value ="${p+1}"></li>

                                                    </c:forEach>

                                                    <c:if test ="${page.index!=page.totalPage-1}">
                                                        <li class="page-item"><input class="page-link" type ="submit" name="btnNext" value ="Next"></li>
                                                        <li class="page-item"><input class="page-link" type ="submit" name="btnEnd" value ="Last"></li>
                                                        </c:if>    
                                                </ul>
                                            </nav>

                                        </form>
                                        <!-- Pagination -->
                                        </div>
                                        </div>
                                        </div>
                                        </section>

                                        <%@include file="components/footer.jsp" %>
                                        <!-- MDB -->
                                        <script type="text/javascript" src="js/mdb.min.js"></script>
                                        <!-- Custom scripts -->


                                        <script type="text/javascript" src="js/script.js"></script>
                                        </body>
                                        </html>


