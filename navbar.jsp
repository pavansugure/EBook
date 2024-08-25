<!-- component - User navbar -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<div class="container-fluid p-3">
    <div class="row">
        <div class="col-md-3 text-success">
            <h3>
                <i class="fa-solid fa-book mx-1 "></i>Ebooks
            </h3>
        </div>
        <div class="col-md-6">
            <form class="form-inline my-2 my-lg-0" style="margin-left: 309.5px;" action="search.jsp" method="post">
                <input class="form-control mr-sm-1 border border-secondary rounded-left" type="search" name="ch"
                    placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-primary my-2 my-sm-0 rounded-top" type="submit">Search</button>
            </form>
        </div>

        <c:if test="${not empty userobj}">

            <div class="col-md-3">

                <a href="checkout.jsp"><i class="fa-solid fa-cart-plus mx-1 fa-2x"></i></a> <a href="login.jsp"
                    class="btn btn-outline-success"><i class="fa-solid fa-user mx-1"></i>${userobj.name}</a>
                <a href="logout" class="btn btn-outline-primary text-white"><i
                    class="fa-solid fa-right-to-bracket mx-1"></i>Logout</a>
            </div>
        </c:if>

        <c:if test="${empty userobj }">

            <div class="col-md-3"> 
                <a href="login.jsp" class="btn btn-outline-success" style="margin-left: 75px;"><i
                    class="fa-solid fa-right-to-bracket mx-1"></i>Login</a> <a href="register.jsp"
                    class="btn btn-outline-primary text-white" style="margin-left: 7px;"><i
                    class="fa-solid fa-user-plus mx-1"></i>Register</a>
            </div>
        </c:if>
    </div>
</div>

<nav class="navbar navbar-expand-lg bg-custom" style="background-color: #000000;">
    <div class="container-fluid">
        
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="Index.jsp" style="color: #fff;"><i class="fa-solid fa-house mx-1"></i>Home</a></li>
                <li class="nav-item"><a class="nav-link active" href="all_recent_book.jsp" style="color: #fff;"><i class="fa-solid fa-book-open mx-1"></i>Recent Book</a></li>
                <li class="nav-item"><a class="nav-link active" href="all_new_book.jsp" style="color: #fff;"><i class="fa-solid fa-book-open mx-1"></i>New Book</a></li>
                <li class="nav-item"><a class="nav-link active" href="all_old_book.jsp" style="color: #fff;"><i class="fa-solid fa-book-open mx-1"></i>Old Book</a></li>
            </ul>
            <form class="d-flex" role="search">
                <a href="setting.jsp" class="btn btn-outline-success mx-1" type="submit">
                    <i class="fa-solid fa-gear mx-1"></i>Setting
                </a>
                <button class="mx-1 btn btn-outline-info" type="submit">
                    <i class="fa-solid fa-phone mx-1"></i>Contact us
                </button> 
            </form>
        </div>
    </div>
</nav>
