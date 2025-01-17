<%-- 
    Document   : history_order
    Created on : Jun 18, 2023, 5:06:05 PM
    Author     : Admin
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chi tiết Danh Mục</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">
        <link href="/SWP391_OnlineShopping/assets/img/software-engineer.png" rel="icon">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <link href="/SWP391_OnlineShopping/assets/css_admin/style.css" rel="stylesheet">
        <link href="/SWP391_OnlineShopping/assets/css_admin/manage.css" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">



    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2">
                    <div class="sidebar" >
                        <div class="sidebar-header">
                            <a href="/SWP391_OnlineShopping/home" class="text-decoration-none">
                                <h5 class="m-0 display-5"><span class="text-primary font-weight-bold border px-3 mr-1"><img src="/SWP391_OnlineShopping/assets/img/software-engineer.png" height="40px" width="40px" alt="alt"/></span>Administrator</h5>
                            </a>
                        </div>
                        <ul class="sidebar-list" >
                            <li class="sidebar-list-item active ">
                                <a href="homeAdmin">
                                    <span><img src="/SWP391_OnlineShopping/assets/img/software-engineer.png" alt="" width="40px" height="40px"/>Menu</span>
                                </a>
                            </li>
                            <li class="sidebar-list-item active ">
                                <a href="AdminAccount">
                                    <span><img src="/SWP391_OnlineShopping/assets/img/user.png" alt="Trang chủ quản trị" width="40px" height="40px"/>Quản lý tài khoản</span>
                                </a>
                            </li>
                            <li class="sidebar-list-item active">
                                <a  onclick="toggleProductCategories()">
                                    <span><img src="/SWP391_OnlineShopping/assets/img/product.png" alt="" width="40px" height="40px"/>Quản lý sản phẩm</span>
                                </a>
                                <ul class="product-categories" id="productCategories">
                                    <c:forEach items="${listC}" var="c"> 
                                        <li><a href="Product?cid=${c.categoryID}">${c.cname}</a></li>
                                        </c:forEach>
                                    <!-- Thêm danh mục sản phẩm khác tại đây -->
                                </ul>
                            </li>
                            <script>
                                function toggleProductCategories() {
                                    var productCategories = document.getElementById("productCategories");
                                    productCategories.classList.toggle("active");
                                }
                            </script>

                            <li class="sidebar-list-item active ">
                                <a href="Category">
                                    <span><img src="/SWP391_OnlineShopping/assets/img/categories.png" alt="" width="40px" height="40px"/>Quản lý danh mục</span>
                                </a>
                            </li>
                            <li class="sidebar-list-item active ">
                                <a href="Brand">
                                    <span><img src="/SWP391_OnlineShopping/assets/img/brand.png" alt="" width="40px" height="40px"/>Quản lý Thương hiệu</span>
                                </a>
                            </li>
                        </ul>   
                    </div>
                </div>

                <div class="col-md-10">
                    <h1 style="text-align: center;padding-top: 30px" ><img src="/SWP391_OnlineShopping/assets/img/edit.png" height="50px" width="50px" alt="alt"/>Chỉnh sửa Danh mục
                    </h1>

                    <a href="/SWP391_OnlineShopping/administrator/Category" data-toggle="modal">
                        <button style="background-color: black;color: white"class="app-content-headerButton">Trở lại</button>
                    </a>
                    <form action="UpdateCategory" method="post">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-6">
                                    <div >
                                        <!-- Cột thứ nhất -->
                                        <div class="form-group">
                                            <label>Mã danh mục</label>
                                            <input value="${category.categoryID}" name="cid" type="text" class="form-control" readonly required>
                                        </div>
                                        <div class="form-group">
                                            <label>Tên danh mục</label>
                                            <input value="${category.cname}" name="cname" type="text" class="form-control" required>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div >
                                        <!-- Cột thứ nhất -->
                                        <div class="form-group">
                                            <label>Ngày thêm</label>
                                            <input name="crdate" class="form-control" value="${category.create_at}" readonly required>
                                        </div>
                                        <div class="form-group">
                                            <label>Ngày cập nhật cuối cùng</label>
                                            <input class="form-control" value="${category.update_at}" readonly required/>
                                        </div>
                                        <div class="form-group" >
                                            <label style="float: left" >Thương hiệu: ${category.brandID.brandName}</label>
                                            <select name="bid" class="form-select" >
                                                <c:forEach items="${listB}" var="b">
                                                    <option value="${b.brandID}">${b.brandName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <input type="submit" class="btn btn-success" value="Edit">
                            </div>
                        </div>
                    </form>


                    <div class="container-fluid">
                        <div class="row">
                            <form action="UpdateImage" method="post">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input value="${category.categoryID}" name="cid" type="hidden" class="form-control" >
                                    </div>
                                    <div class="form-group">
                                        <label>Hình ảnh</label>
                                        <img  style="width: 500px; height: 300px; border-radius: 10px" src="/SWP391_OnlineShopping/assets/categoryimage/${category.getImage()}" alt="">
                                        <input name="image" type="file">

                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <input type="submit" class="btn btn-success" value="Edit Image">
                                </div>
                            </form>

                            <form action="UpdateImage" method="get">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input value="${category.categoryID}" name="cid" type="hidden" class="form-control" >
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <input type="submit" class="btn btn-success" value="Edit Image Size">
                                </div>
                            </form>
                        </div>

                    </div>


                </div>
            </div>
            <% String successMessage = (String) request.getSession().getAttribute("successMessage"); %>
            <% if (successMessage != null) { %>
            <div class="alert alert-success" id="success-message">
                <strong><%= successMessage %></strong>
            </div>  
            <script>
                document.addEventListener('DOMContentLoaded', function () {
                    var successMessage = document.getElementById('success-message');
                    successMessage.style.position = 'fixed';
                    successMessage.style.top = '100px';
                    successMessage.style.right = '10px';
                    successMessage.style.display = 'block';
                    setTimeout(function () {
                        successMessage.style.display = 'none';
                    }, 4000);
                });
            </script>
            <% } %>

            <% request.getSession().removeAttribute("successMessage"); %>
        </div>
    </body>
</html>
