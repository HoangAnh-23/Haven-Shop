<%-- 
    Document   : edit-profile
    Created on : Sep 21, 2023, 9:18:56 AM
    Author     : Nitro
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
        <link href="/SWP391_OnlineShopping/assets/img/img-01.png" rel="icon">

        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="/SWP391_OnlineShopping/assets/css/edit-profile.css" rel="stylesheet">
        <link href="/SWP391_OnlineShopping/assets/css/style.css" rel="stylesheet">

        <script type="text/javascript">
            window.onpageshow = function (event) {
                if (event.persisted) {
                    location.reload(); // Tải lại trang khi người dùng quay lại từ lịch sử
                }
            };
        </script>

    </head>
    <body>


        <div class="container">

            <div class="main-body">

                <c:set value="${requestScope.data}" var="i"/>
                <div>
                    <div class="card-body">
                        <h5 style="">
                            <div id="btn-back" class="width-25"> 
                                <img src="/SWP391_OnlineShopping/assets/img/back.png" height="30px" width="30px" alt="alt"/>
                             Back
                            </div>
                        </h5>
                    </div>
                </div>
                <div class="row">

                    <div class="col-lg-12">

                        <form action="edit-profile" method="post">
                             <input type="hidden" name="urlPre" id="urlPre" value="">
                            <div class="card">
                                <jsp:include page="/view/common/menuprofile.jsp"></jsp:include>
                                    <div class="card-body">
                                        <div class="row mb-3">
                                            <div class="col-sm-3">
                                                <h6 class="mb-0">Email</h6>
                                            </div>
                                            <div class="col-sm-9 text-secondary">
                                                <input type="text" class="form-control" value="${i.email}" readonly>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Phone</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input name="phone_number" type="text" class="form-control"
                                                   value="${i.phone_number}">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Full Name</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input type="text" class="form-control" name="fullname" value="${i.fullname}"required=" ">
                                            <input type="hidden" name="id" value="${sessionScope.acc.id}"/>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Gender</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <label style="color: black" ><input type="radio" id="male" name="gender" value="1" ${i.gender ==true?"checked":""}>Male</label>
                                            <label style="color: black;padding-left: 50px"><input type="radio" id="female" name="gender" value="0" ${i.gender == false?"checked":""}>Female</label>    
                                        </div></div>
                                        <c:set var="address" value="${i.address}" />
                                        <%
                                        String address = (String) pageContext.getAttribute("address");
                                        String[] parts = address.split("-");
                                        String city = parts.length > 0 ? parts[0] : "";
                                        String district = parts.length > 1 ? parts[1] : "";
                                        String ward = parts.length > 2 ? parts[2] : "";
                                        String addressLine = parts.length > 3 ? parts[3] : "";
                                        %>
                                    <div class="row">
                                        <div class="col-sm-3 text-dark">Address</div>
                                        <div class="col-sm-9 text-secondary">
                                            <div>
                                                <select required style="display: block;margin-bottom: 1rem;width: 100%;height: 40px;border-radius: 6px;" class="form-select form-select-sm mb-3" id="city" aria-label=".form-select-sm">
                                                    <option value="" selected>Chọn tỉnh thành</option>
                                                </select>

                                                <select required style="display: block;margin-bottom: 1rem;width: 100%;height: 40px;border-radius: 6px;" class="form-select form-select-sm mb-3" id="district" aria-label=".form-select-sm">
                                                    <option value="" selected>Chọn quận huyện</option>
                                                </select>

                                                <select required style="display: block;margin-bottom: 1rem;width: 100%;height: 40px;border-radius: 6px;" class="form-select form-select-sm" id="ward" aria-label=".form-select-sm">
                                                    <option value="" selected>Chọn phường xã</option>
                                                </select>
                                            </div>
                                            <input type="hidden" name="cityTxt" id="cityTxt" value="<%=city%>">
                                            <input type="hidden" name="districtTxt" id="districtTxt" value="<%=district%>">
                                            <input type="hidden" name="wardTxt" id="wardTxt" value="<%=ward%>">
                                            <input type="hidden" id="addressLine" value="<%=addressLine%>">
                                            <div class="input-group">
                                                <input class="input--style-3 px-3 py-4 w-100 rounded-sm" value="<%=addressLine%>"
                                                       name="addressLine"
                                                       type="text" placeholder="Chi tiết địa chỉ" id="addressDetail" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div style=" color: #a94442; padding: 10px; border-radius: 5px;">
                                        <strong>${requestScope.mess}</strong>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-3"></div>
                                        <div class="col-sm-9 text-secondary">
                                            <input type="submit" class="btn btn-primary px-4" value="Save Changes">
                                        </div>
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
                <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
                <script>
                    document.getElementById("urlPre").value = document.referrer;
                     const btnBack = document.getElementById("btn-back");
                       btnBack.addEventListener('click', function goBack() {
                           console.log("avv");
                         window.history.back();
                       });
                    var citis = document.getElementById("city");
                    var districts = document.getElementById("district");
                    var wards = document.getElementById("ward");
                    var cityTxt = document.getElementById("cityTxt");
                    var districtTxt = document.getElementById("districtTxt");
                    var wardTxt = document.getElementById("wardTxt");
                    var Parameter = {
                        url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json",
                        method: "GET",
                        responseType: "application/json",
                    };
                    var promise = axios(Parameter);
                    promise.then(function (result) {
                        renderCity(result.data);
                    });

                    function renderCity(data) {
                        for (const x of data) {
                            citis.options[citis.options.length] = new Option(x.Name, x.Id);
                        }
                        citis.onchange = function () {
                            districts.length = 1;
                            wards.length = 1;
                            if (this.value !== "") {
                                const result = data.filter(n => n.Id === this.value);

                                for (const k of result[0].Districts) {
                                    districts.options[districts.options.length] = new Option(k.Name, k.Id);
                                }
                            }
                        };

                        districts.onchange = function () {
                            wards.length = 1;
                            const dataCity = data.filter((n) => n.Id === citis.value);
                            if (this.value !== "") {
                                const dataWards = dataCity[0].Districts.filter(n => n.Id === this.value)[0].Wards;

                                for (const w of dataWards) {
                                    wards.options[wards.options.length] = new Option(w.Name, w.Id);
                                }
                            }
                        };
                    }

                    citis.addEventListener('change', function (event) {
                        const selectedOption = event.target.options[event.target.selectedIndex];
                        const selectedText = selectedOption.text;
                        cityTxt.value = selectedText;
                    });
                    districts.addEventListener('change', function (event) {
                        const selectedOption = event.target.options[event.target.selectedIndex];
                        const selectedText = selectedOption.text;
                        districtTxt.value = selectedText;
                    });
                    wards.addEventListener('change', function (event) {
                        const selectedOption = event.target.options[event.target.selectedIndex];
                        const selectedText = selectedOption.text;
                        wardTxt.value = selectedText;
                    });

                    function selectOption(selectElement, text) {
                        for (var i = 0; i < selectElement.options.length; i++) {
                            if (selectElement.options[i].text === text) {
                                selectElement.selectedIndex = i;
                                break;
                            }
                        }
                    }
                    document.getElementById("cityTxt").value = '<%= city %>';
                    document.getElementById("districtTxt").value = '<%= district %>';
                    document.getElementById("wardTxt").value = '<%= ward %>';
                    document.getElementById("addressLine").value = '<%= addressLine %>';

                    window.onload = function () {
                        selectOption(citis, '<%= city %>');
                        citis.dispatchEvent(new Event('change'));

                        setTimeout(function () {
                            selectOption(districts, '<%= district %>');
                            districts.dispatchEvent(new Event('change'));
                        }, 500);

                        setTimeout(function () {
                            selectOption(wards, '<%= ward %>');
                        }, 1000);
                    };

                    function validateForm() {
                        var citySelected = citis.value.trim() !== "";
                        var districtSelected = districts.value.trim() !== "";
                        var wardSelected = wards.value.trim() !== "";

                        if (!citySelected) {
                            alert("Please select a city.");
                            return false;
                        }
                        if (!districtSelected) {
                            alert("Please select a district.");
                            return false;
                        }
                        if (!wardSelected) {
                            alert("Please select a ward.");
                            return false;
                        }
                        return true;
                    }

                    document.querySelector('form').onsubmit = function () {
                        return validateForm();
                    };
        </script>
   </body>
 </html>
