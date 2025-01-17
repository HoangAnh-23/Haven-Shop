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
        <link rel="icon" href="img/logo.png"> <!-- Thay "your_new_icon.png" bằng đường dẫn tới hình ảnh biểu tượng mới của bạn -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AdamStore-Thêm sản phẩm</title>
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
            <div class="row" >
                <div class="col-md-2">
                    <div class="sidebar">
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

                <div class="col-md-10" >
                    <h1 style="text-align: center;padding-top: 30px" ><img src="/SWP391_OnlineShopping/assets/img/add.png" height="30px" width="30px" alt="alt"/>Thêm sản phẩm
                    </h1>
                    <div>
                        <a href="Product?cid=1" data-toggle="modal" >
                            <button style="background-color: black;color:white"class="app-content-headerButton">Trở lại</button>
                        </a>
                    </div>            
                    <form action="AddProduct" method="post">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-5">
                                    <div >
                                        <!-- Cột thứ nhất -->
                                        <div class="form-group">
                                            <label>Tên sản phẩm</label>
                                            <input name="productName" type="text" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Hình ảnh</label>
                                            <input value="${product.getImage()}" name="image" type="file" class="form-control" >
                                        </div>
                                        <div class="form-group">
                                            <label style="float: left" >Danh mục</label>
                                            <select name="categoryID" class="form-select" >
                                                <c:forEach items="${listC}" var="c">
                                                    <option value="${c.categoryID}">${c.cname} - ${c.brandID.brandName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <ul id="listItems">
                                        </ul>
                                        <input type="hidden" name="items" id="items" value="" />
                                    </div>
                                </div>
                                <div class="col-md-7">
                                    <div>
                                        <!-- Cột thứ hai -->

                                        <div class="form-group">
                                            <label>Giá</label>
                                            <input name="price" class="form-control" pattern="[0-9]+" required/>
                                        </div>
                                        <div class="form-group">
                                            <label>Giá giảm (%) </label>
                                            <input name="discountSale" class="form-control" pattern="[0-9]+" required/>
                                        </div>
                                        <div class="form-group">
                                            <label>Giới thiệu</label>
                                            <textarea name="description" class="form-control" required>${product.description}</textarea>
                                        </div>
                                        <div class="form-group" >
                                            <label style="float: left" >Tình trạng</label>
                                            <select name="status" class="form-select" aria-label="Default select example">
                                                <option value="1">Còn bán</option>
                                                <option value="0">Chưa bán/Không bán</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="modal-footer">
                                <input type="submit" class="btn btn-success" value="Thêm">
                            </div>
                        </div>
                    </form>
                    <div class="form-group" style="width: 30%">
                        <label style="float: left" >Size</label>
                        <select id="sizeSelect" name="sizeId" class="form-select" >
                            <c:forEach items="${listSize}" var="c">
                                <option value="${c.sizeId}">${c.size}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group" style="width: 30%">
                        <label style="float: left" >Color</label>
                        <select id="colorSelect" name="colorId" class="form-select" >
                            <c:forEach items="${listColor}" var="c">
                                <option value="${c.colorId}">${c.colorName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group" style="width: 30%">
                        <label>Số lượng</label>
                        <input type="number" name="quantity" class="form-control" id="quantity"/>
                    </div>
                    <div class="form-group" style="width: 30%">
                        <label>Hình ảnh</label>
                        <input value="" id="imageDetail" name="imageDetail" type="file" class="form-control">
                    </div>
                    <button id="addItem" style="margin-top: 20px">Thêm mẫu</button>
                    <script>
                        const sizeSelect = document.getElementById("sizeSelect");
                        const colorSelect = document.getElementById("colorSelect");
                        const listItems = document.getElementById("listItems");
                        const quantity = document.getElementById("quantity");
                        const image = document.getElementById("imageDetail");
                        
                        const btn = document.getElementById("addItem");
                        let items = document.getElementById("items");

                        btn.addEventListener('click', () => {
                            let li = document.createElement('li');
                            let imagePath = '';
                            const imageArr = image.value.split('\\');
                            imagePath = imageArr[2];
                            li.textContent = sizeSelect.selectedOptions[0].textContent + '-' + colorSelect.selectedOptions[0].textContent + '-' + quantity.value+ '-' + imagePath;
                            if (items.value === '') {
                                items.value = sizeSelect.value + '-' + colorSelect.value + '-' + quantity.value + '-' + imagePath;
                            } else {
                                items.value += '/' + (sizeSelect.value + '-' + colorSelect.value + '-' + quantity.value + '-' + imagePath);
                            }
                            listItems.appendChild(li);
                        });
                    </script>
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
