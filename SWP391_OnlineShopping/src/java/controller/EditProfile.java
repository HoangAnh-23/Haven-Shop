/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.DAOAccount;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Account;

/**
 *
 * @author Nitro
 */
public class EditProfile extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Controller_EditProfile</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Controller_EditProfile at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        try {
            DAOAccount dao = new DAOAccount();
            HttpSession session = request.getSession();
            Account a = (Account) session.getAttribute("acc");
            Account u = dao.getAccountById(a.getId());
            request.setAttribute("data", u);
            request.getRequestDispatcher("/view/userAccess/edit-profile.jsp").forward(request, response);
        } catch (Exception e) {
            request.getRequestDispatcher("/view/common/error.jsp").forward(request, response);
        }
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
        String idString = request.getParameter("id");
        int id = Integer.parseInt(idString);

        String fullname = request.getParameter("fullname").trim();
        String phone_num = request.getParameter("phone_number").trim();

        String city = request.getParameter("cityTxt").trim();
        String district = request.getParameter("districtTxt").trim();
        String ward = request.getParameter("wardTxt").trim();
        String addressLine = request.getParameter("addressLine").trim();

        String address = city + "-" + district + "-" + ward + "-" + addressLine;
        System.out.println("address: " + address);

        // Save address to database or process as needed
        // Set the address attribute for JSP to use
//        String address = request.getParameter("address");
        Boolean gender = "1".equals(request.getParameter("gender"));

        if (fullname.isEmpty() || phone_num.isEmpty() || city.isEmpty()
                || district.isEmpty() || ward.isEmpty() || addressLine.isEmpty()) {
            request.getSession().setAttribute("successMessage", "Please fill all field");
            response.sendRedirect("/SWP391_OnlineShopping/account/edit-profile");
            return;
        }
        if (fullname.startsWith(" ") || !isFullname(fullname)) {
            request.getSession().setAttribute("successMessage", "Full name must only character");
            response.sendRedirect("/SWP391_OnlineShopping/account/edit-profile");
            return;
        }

        if (!isValidPhoneNumber(phone_num)) {
            request.getSession().setAttribute("successMessage", "Phone number invalid");
            response.sendRedirect("/SWP391_OnlineShopping/account/edit-profile");
            return;
        }
        if (containsSpecialCharacters(address)) {
            request.getSession().setAttribute("successMessage", "address can not contain special character");
            response.sendRedirect("/SWP391_OnlineShopping/account/edit-profile");
            return;
        }
        DAOAccount dao = new DAOAccount();
        String urlPre = request.getParameter("urlPre");
        dao.UpdateProfile(fullname, address, phone_num, gender, id);
        request.getSession().setAttribute("successMessage", "Your information has been updated successfully.");
        if (urlPre != null) {
            response.sendRedirect(urlPre);
            return;
        }
        request.getSession().setAttribute("successMessage", "update success profile");
        response.sendRedirect("/SWP391_OnlineShopping/account/edit-profile");
    }

    private boolean containsSpecialCharacters(String str) {
        // Định nghĩa các ký tự đặc biệt bạn muốn kiểm tra
        String specialCharacters = "!@#$%^&*()_+[]{}|;:'\"<>?";

        for (char c : str.toCharArray()) {
            if (specialCharacters.contains(String.valueOf(c))) {
                return true;
            }
        }
        return false;
    }

    public static boolean isFullname(String str) {
        String expression = "^[A-Za-z ]+$";
        return str.trim().matches(expression);
    }

    public static final boolean isValidPhoneNumber(String phoneNumber) {
        return phoneNumber.matches("0\\d{8,9}");
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
