/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.DAOProduct;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Nitro
 */
public class BuyServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Cookie[] arr = request.getCookies();
        String txt = "";

// Kiểm tra và lấy giỏ hàng từ cookie
        if (arr != null) {
            for (Cookie i : arr) {
                if (i.getName().equals("cart")) {
                    txt = i.getValue(); // Thay vì dùng += để nối, sử dụng =
                    i.setMaxAge(0);
                    response.addCookie(i);
                }
            }
        }
        DAOProduct d = new DAOProduct();

        int num = Integer.parseInt(request.getParameter("num"));
        
        int sizeId = Integer.parseInt(request.getParameter("sizeID"));
        int colorId = Integer.parseInt(request.getParameter("colorID"));
        int pid = Integer.parseInt(request.getParameter("productID"));
        int quantityRemain = d.getQuantityItem(pid, sizeId, colorId);

// Tạo một cookie mới, không xóa cookie cũ
        
        if (num <= quantityRemain) {
            if (txt.isEmpty()) {
                txt = pid + ":" + num + ":" + sizeId + ":" + colorId;
            } else if(!txt.isEmpty() && !txt.contentEquals(pid + ":" + num + ":" + sizeId + ":" + colorId)) {
                txt = txt + "/" + pid + ":" + num + ":" + sizeId + ":" + colorId;
            }
            Cookie c = new Cookie("cart", txt);
            c.setMaxAge(60 * 60 * 24 * 1000);
            response.addCookie(c);
            request.getSession().setAttribute("successMessage", "Thêm Giỏ Hàng Thành Công !");
            response.sendRedirect("/SWP391_OnlineShopping/checkout");
        } else {
            request.getSession().setAttribute("successMessage", "Số lượng vượt quá số lượng trong kho!");
            response.sendRedirect("/SWP391_OnlineShopping/product/productdetail?productID=" + pid+"&sizeID="+sizeId+"&colorID="+colorId);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
