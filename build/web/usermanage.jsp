<%-- 
    Document   : usermanage
    Created on : Mar 11, 2024, 10:23:44 AM
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

        <title>Users</title>
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

            <%@include file="components/usermanage-header.jsp" %>

            <!--Main layout-->
            <main style="margin-top: 58px">
                <div class="container pt-4">
                    <!--Section: Statistics with subtitles-->
                    <section>

                        <div class="row">
                            <div class="col-xl-12 col-md-12 mb-4">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between p-md-1">
                                            <div>
                                                <h4>Total Users</h4>
                                                <p class="mb-0">All time</p>
                                            </div>
                                            <div class="d-flex flex-row">
                                                <div class="align-self-center">
                                                    <h2 class="h1 mb-0 me-4">${acc.size()}</h2>
                                                </div>
                                            </div>
                                            <div class="align-self-center">
                                                <i class="fa fa-users text-danger fa-3x"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <!--Section: Statistics with subtitles-->


                    <!--Section: Manager users-->
                    <section class="mb-4">
                        <div class="card">
                            <div class="card-header  py-3">

                                <h5 class="mb-0 text-center ">
                                    <strong>Users</strong>
                                </h5>

                                <div style="position: relative; width: 100%;">
                                    <div style="position: absolute; right: 0;top: 0%; transform: translateY(-85%);">
                                        <form action="searchuser" method="post">
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

                            <!-- User List -->
                            <div class="card-body overflow-y-scroll" style="height:430px"  >
                                <div class="table-responsive">
                                    <table class="table table-hover text-nowrap">
                                        <thead>
                                            <tr>
                                                <th scope="col" style="width: 150px;">ID </th>
                                                <th scope="col" style="width: 150px;">Username </th>
                                                <th scope="col" style="width: 150px;">Profile pic</th>
                                                <th scope="col" style="width: 150px;">More Info</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${acc}" var="a" >
                                                <tr>
                                                    <!-- User ID -->
                                                    <td><div class="" style="width: 150px;">${a.id}</div></td>
                                                    <!-- Username -->
                                                    <td><div class="" style="width: 150px;"> ${a.username}</div></td>

                                                    <c:forEach items="${detail}" var="d">
                                                        <c:if test = "${d.id == a.id}">
                                                            <!-- Image -->
                                                            <td><div class="" style="width: 50px;">
                                                                    <img style="width: 100%;" src="${d.image}">
                                                                </div></td>
                                                            </c:if>

                                                    </c:forEach>
                                                    <td>
                                                        <button type="button" class="btn btn-primary" data-mdb-ripple-init data-mdb-modal-init data-mdb-target="#detailModal${a.id}">
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


                </div>


                <!--Detail Modal -->            
                <c:forEach items="${acc}" var="o">
                    <div class="modal fade" id="detailModal${o.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">

                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">User Details </h5>
                                    </button>
                                </div>
                                <div class="modal-body">


                                    <c:forEach items="${detail}" var="d">
                                        <c:if test="${d.id == o.id}">
                                            <div class="form-group">
                                                <label>Full Name : </label>
                                                <input name="" type="text" class="form-control" value="${d.name}" readonly>
                                                <label>Contact G-mail</label>
                                                <input name="" type="text" class="form-control" value="${d.gmail}" readonly>
                                                <label>Contact Phone</label>
                                                <input name="" type="text" class="form-control" value="${d.phone}" readonly>
                                                <label>Address 1</label>
                                                <input name="" type="text" class="form-control" value="${d.address1}" readonly>
                                                <label>Address 2</label>
                                                <input name="" type="text" class="form-control" value="${d.address2}" readonly>
                                            </div>
                                            <br>
                                            <hr>
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
