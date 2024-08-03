/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import models.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.Color;
import models.Item;
import models.Products;
import models.Size;

/**
 *
 * @author Nitro
 */
public class DAOSize {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    private void closeResources(Connection conn, PreparedStatement ps, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Size> getAllSize() {
        List<Size> list = new ArrayList<>();
        String sql = "SELECT * FROM size";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Size h = new Size();
                h.setSizeId(rs.getInt("sizeID"));
                h.setSize(rs.getString("sizeName"));
                list.add(h);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            closeResources(conn, ps, rs);
        }
        return list;
    }

    public List<Size> getSizeByItemID(int productID) {
        List<Size> list = new ArrayList<>();
        String sql = "SELECT distinct s.sizeID, s.sizeName FROM product_detail p \n"
                + "inner join size s on s.sizeID = p.sizeID \n"
                + "inner join color c on c.colorID = p.colorID \n"
                + "where p.productID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, productID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Size s = new Size();
                s.setSizeId(rs.getInt("sizeID"));
                s.setSize(rs.getString("sizeName"));
                list.add(s);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            closeResources(conn, ps, rs);
        }
        return list;
    }

    public List<Color> getColorByItemID(int productID) {
        List<Color> list = new ArrayList<>();
        String sql = "SELECT distinct c.colorID, c.colorName FROM product_detail p \n"
                + "inner join size s on s.sizeID = p.sizeID \n"
                + "inner join color c on c.colorID = p.colorID \n"
                + "where p.productID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, productID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Color c = new Color();
                c.setColorId(rs.getInt("colorID"));
                c.setColorName(rs.getString("colorName"));
                list.add(c);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            closeResources(conn, ps, rs);
        }
        return list;
    }

    public List<String> getImagesByID(int productID) {
        List<String> list = new ArrayList<>();
        String sql = "SELECT p.imamge FROM product_image p \n"
                + "where p.productID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, productID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(rs.getString(1));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            closeResources(conn, ps, rs);
        }
        return list;
    }

    public String getSizeNameByID(int productID) {
        String sql = "select sizeName from size where sizeID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, productID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            closeResources(conn, ps, rs);
        }
        return "";
    }

    public String getColorNameByID(int productID) {
        String sql = "select colorName from color where colorID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, productID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            closeResources(conn, ps, rs);
        }
        return "";
    }

    public List<String> getImages(int productID, int colorID) {
        List<String> list = new ArrayList<>();
        String sql = "SELECT p.imamge FROM product_image p \n"
                + "where p.productID = ? and p.colorID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, productID);
            ps.setInt(2, colorID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(rs.getString(1));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            closeResources(conn, ps, rs);
        }
        return list;
    }

    public Size getSizeByID(int id) {
        String sql = "SELECT * FROM products p , size s where p.productID = s.productID and p.productID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Products p = getProductByID(id);
                Size h = new Size(
                        rs.getInt("sizeID"),
                        rs.getString("sizeName"));
                return h;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            closeResources(conn, ps, rs);
        }
        return null;
    }

    public Products getProductByID(int id) {
        Products p = null; // Initialize the Products object
        DAOCategory dc = new DAOCategory();
        try {
            String sql = "SELECT * FROM Products WHERE productID = ?";
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {

                p = new Products(); // Instantiate the Products object
                // Set the properties of the Products object
                p.setProductID(rs.getInt("productID"));
                p.setImage(rs.getString("image"));
                p.setProductName(rs.getString("productName"));
                p.setPrice(rs.getDouble("price"));
                p.setDiscountSale(rs.getDouble("discountSale"));
                p.setDescription(rs.getString("description"));
                p.setCreate_at(rs.getDate("create_at"));
                p.setUpdate_at(rs.getDate("update_at"));
                p.setStatus(rs.getInt("status"));
                p.setCategoryID(rs.getInt("categoryID"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResources(conn, ps, rs);
        }

        return p; // Return the Products object
    }

    public List<Products> Productfilter(String brand, String cid, String price, String sort) {
        List<Products> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder("WITH pd_ranked AS (")
                .append("SELECT pd.*, ")
                .append("ROW_NUMBER() OVER (PARTITION BY pd.productID ORDER BY pd.pdetailID) AS rn ")
                .append("FROM product_detail pd) ")
                .append("SELECT p.*, c.*, pd.* ")
                .append("FROM products AS p ")
                .append("JOIN category AS c ON c.categoryID = p.categoryID ")
                .append("JOIN pd_ranked AS pd ON pd.productID = p.productID ")
                .append("WHERE p.status = 1 AND pd.rn = 1 ")
                .append("AND p.productID IN (")
                .append("SELECT MIN(p2.productID) ")
                .append("FROM products AS p2 ")
                .append("GROUP BY p2.productName) ");

        if (!"0".equals(brand)) {
            sql.append("AND c.brandID = ? ");
        }

        if (!"0".equals(cid)) {
            sql.append("AND p.categoryID = ? ");
        }

        switch (price) {
            case "1":
                sql.append("AND p.price BETWEEN 500000 AND 1000000 ");
                break;
            case "2":
                sql.append("AND p.price BETWEEN 1000000 AND 2000000 ");
                break;
            case "3":
                sql.append("AND p.price BETWEEN 2000000 AND 3000000 ");
                break;
            case "4":
                sql.append("AND p.price > 3000000 ");
                break;
            default:
                break;
        }

        switch (sort) {
            case "1":
                sql.append("ORDER BY p.price DESC ");
                break;
            case "2":
                sql.append("ORDER BY p.price  ASC ");
                break;
            case "3":
                sql.append("ORDER BY p.create_at DESC ");
                break;
            case "4":
                sql.append("ORDER BY p.create_at ASC ");
                break;
            default:
                break;
        }

        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(sql.toString())) {

            int paramIndex = 1;
            if (!"0".equals(brand)) {
                ps.setInt(paramIndex++, Integer.parseInt(brand));
            }
            if (!"0".equals(cid)) {
                ps.setInt(paramIndex++, Integer.parseInt(cid));
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Products p = new Products();
                p.setProductID(rs.getInt("productID"));
                p.setImage(rs.getString("image"));
                p.setProductName(rs.getString("productName"));
                p.setPrice(rs.getDouble("price"));
                p.setDiscountSale(rs.getDouble("discountSale"));
                p.setDescription(rs.getString("description"));
                p.setCreate_at(rs.getDate("create_at"));
                p.setUpdate_at(rs.getDate("update_at"));
                p.setStatus(rs.getInt("status"));
                p.setCategoryID(rs.getInt("categoryID"));
                p.setColor(rs.getInt("colorID"));
                p.setSize(rs.getInt("sizeID"));
                list.add(p);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return list;
    }

    public List<Size> getSize() {
        List<Size> list = new ArrayList<>();
        String sql = "SELECT * FROM  size ";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Size h = new Size();
                h.setSizeId(rs.getInt("sizeID"));
                h.setSize(rs.getString("sizeName"));
                list.add(h);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            closeResources(conn, ps, rs);
        }
        return list;
    }

    public static void main(String[] args) {

        DAOSize ds = new DAOSize(); // Thay YourClass bằng tên lớp của bạn
        Size s = ds.getSizeByID(23);
        System.out.println(s);

    }

}
