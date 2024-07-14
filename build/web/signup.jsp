<%-- 
    Document   : signup
    Created on : Mar 3, 2024, 10:29:13 PM
    Author     : legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta http-equiv="x-ua-compatible" content="ie=edge" />
        <title>SignUp</title>        
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css" />
        <!-- Google Fonts Roboto -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" />
        <!-- Bootstrap 5 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <!-- MDB -->
        <link rel="stylesheet" href="css/mdb.min.css" />
        <!-- Custom styles -->
        <link rel="stylesheet" type="text/css" href="css/login/login.css" />
    </head>
    <body>

        <section class="vh-100">
            <div class="d-flex flex-column flex-md-row text-center text-md-start justify-content-between py-4 px-4 px-xl-5 bg-primary">
                <!-- Copyright -->
                <div class="text-primary mb-3 mb-md-0">
                    <span class="text-dark h5">Tech Tropical</span>  <span class = "text-white">A dream land for tech geeks</span>
                </div>
                <!-- Copyright -->

                <!-- Right -->
            </div>
            <div class="container-fluid h-custom">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-md-9 col-lg-6 col-xl-5">
                        <img src="https://www.shutterstock.com/image-vector/computer-hardware-line-icons-set-600nw-635642507.jpg"
                             class="img-fluid" alt="Sample image">
                    </div>
                    <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                        <form action ="signup" method ="post">

                            <div class="divider d-flex align-items-center my-4">
                                <p class="text-center fw-bold mx-3 mb-0">Sign Up</p>
                            </div>

                            <!-- Email input -->
                            <div class=" mb-4 text-background">
                                <input type="text" name ="user" id="form3Example4" class="form-control form-control-lg" placeholder="Full name" required autofocus="">
                            </div>

                            <!-- Password input -->
                            <div class="mb-3 text-background">
                                <input type="password" name ="pass" id="form3Example4" class="form-control form-control-lg "
                                       placeholder="Password" required />
                            </div>

                            <!-- RePassword input -->
                            <div class="mb-3 text-background">
                                <input type="password" name ="repass" id="form3Example4" class="form-control form-control-lg "
                                       placeholder="Re-enter Password" required />
                            </div>
                            
                            <!-- Login Failed Message -->
                            <div class="${failmess != null ? "alert alert-danger" : ""}"   style="text-align: center; margin-top: 10px;" role="alert">
                                ${failmess}
                            </div>

                            <div class="text-center text-lg-start mt-4 pt-2">
                                <button class="btn btn-primary btn-block" type="submit"><i class="fas fa-user-plus"></i> Sign Up</button>
                            </div>
                            <p class="small fw-bold mt-2 pt-1 mb-0"><a href="login.jsp" id="cancel_signup"><i class="fas fa-angle-left"></i> Back</a></p>
                            

                        </form>
                    </div>
                </div>
            </div>
            <div
                class="d-flex flex-column flex-md-row text-center text-md-start justify-content-between py-4 px-4 px-xl-5 bg-primary">
                <!-- Copyright -->
                <div class="text-white mb-3 mb-md-0">
                    Tech Tropical © 2024. All Copyright rights reserved.
                </div>
                <!-- Copyright -->

                <!-- Right -->
                <div>
                    <a href="#!" class="text-white me-4">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a href="#!" class="text-white me-4">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a href="#!" class="text-white me-4">
                        <i class="fab fa-google"></i>
                    </a>
                    <a href="#!" class="text-white">
                        <i class="fab fa-linkedin-in"></i>
                    </a>
                </div>
                <!-- Right -->
            </div>
        </section>
    </body>
</html>

