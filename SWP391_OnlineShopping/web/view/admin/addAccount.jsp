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
        <title>Thêm Tài Khoản</title>
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
        <link href="/SWP391_OnlineShopping/assets/css_admin/main_styles.css" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <script type="text/javascript">
            window.onpageshow = function (event) {
                if (event.persisted) {
                    location.reload(); // Tải lại trang khi người dùng quay lại từ lịch sử
                }
            };
        </script>


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
                                    <span><img src="/SWP391_OnlineShopping/assets/img/brand.png" alt="" width="40px" height="40px"/>Quản lý thương hiệu</span>
                                </a>
                            </li>
                        </ul>   
                    </div>
                </div>

                <div class="col-md-10">
                    <h1 style="text-align: center;padding-top: 30px" ><img src="/SWP391_OnlineShopping/assets/img/edit.png" height="50px" width="50px" alt="alt"/>Thêm Tài Khoản
                    </h1>
                    <a href="AdminAccount" data-toggle="modal">
                        <button style="background-color: black;color: white;" class="app-content-headerButton"><img src="/SWP391_OnlineShopping/assets/img/back.png" alt="alt" width="20px" height="20px"/>Trở lại</button>
                    </a>
                    <a style="margin-left: 1100px" href="AddShipper" data-toggle="modal">
                        <button style="background-color: black;color: white;" class="app-content-headerButton"><img src="/SWP391_OnlineShopping/assets/img/back.png" alt="alt" width="20px" height="20px"/>Tạo Tài Khoản Shipper</button>
                    </a>
                    <form action="addAccount" method="post">

                        <div class="modal-body">					
                            <div class="form-group" style="padding-right:  800px">

                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input name="email" type="text" class="form-control" required pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" title="Nhập một địa chỉ email hợp lệ (ví dụ: example@example.com)">
                            </div>

                            <div class="form-group">
                                <label>Mật khẩu</label>
                                <input  name="password" type="password" class="form-control"  required>
                            </div>
                            <!--                            <div class="form-group">
                                                            <label>Nhập Lại Mật Khẩu</label>
                                                            <input  name="password" type="password" class="form-control"  required>
                                                        </div>-->

                            <div class="form-group" style="padding-right:  750px">
                                <label>Quyền</label>
                                <select name="roleID" class="form-select" aria-label="Default select example">
                                    <option value="1" ${Detailacc.roleID == '1' ? 'selected' : ''}>Admin</option>
                                    <option value="2" ${Detailacc.roleID == '2' ? 'selected' : ''}>Manager</option>
                                </select>
                            </div>

                            <div class="form-group">
                                <label>Họ tên</label>
                                <input  name="fullname" type="text" class="form-control" required>

                            </div>

                            <div class="form-group">
                                <label>Số điện thoại</label>
                                <input  name="phone_number" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Giới Tính</label>
                                <div class="col-sm-9 text-secondary">
                                    <label style="color: black" ><input type="radio" id="male" name="gender" value="1" ${Detailacc.gender ==true?"checked":""}>Male</label>
                                    <label style="color: black;padding-left: 50px"><input type="radio" id="female" name="gender" value="0" ${Detailacc.gender == false?"checked":""}>Female</label>    
                                </div></div>
                            <div class="form-group">
                                <label>Địa chỉ giao hàng</label>
                                <input  name="address" type="text" class="form-control" required>
                            </div>                                                      
                            <div class="form-group">
                                <label>Trạng thái tài khoản</label>
                                <select name="status" class="form-select" aria-label="Default select example">
                                    <option value="1" ${Detailacc.status == '1' ? 'selected' : ''}>Hoạt Động</option>
                                    <option value="2" ${Detailacc.status == '2' ? 'selected' : ''}>Chưa hoạt động</option>                                    
                                    <option value="3" ${Detailacc.status == '3' ? 'selected' : ''}>Ban</option>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input  type="submit" class="btn btn-success" value="Thêm">  
                        </div>
                    </form>
                </div>
            </div>
        </div>


    </div>
</div>

</div>

</body>
</html>
