/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.*;
import java.sql.*;
import context.*;
import models.*;

/**
 *
 * @author legion
 */
public class DAO {

    private Connection con;
    private String status = "OK";
    private List<Product> prd;
    private List<Category> ctg;
    private List<Manufacturer> mft;

    public static DAO INS = new DAO();

    public DAO() {
        if (this.INS == null)
        try {
            con = new DBContext().getConnection();
        } catch (Exception e) {
            status = "Error at connection" + e.getMessage();
        } else {
            INS = this;
        }
    }

    //!Display - Search
    public void LoadAll() {

        //Retrive all data that have not been deleted
        prd = new Vector<Product>();
        String sql = "Select * from products p\n"
                + "join categories c on p.categoryID= c.categoryID\n"
                + "join manufacturers m on m.manufacturerID = p.manufacturerID\n"
                + "where p.isDeleted = 0 and c.isDeleted = 0 and m.isDeleted = 0 order by ProductID desc";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String discription = rs.getString(3);
                int price = rs.getInt(4);
                int amount = rs.getInt(5);
                String img = rs.getString(6);
                int categoryID = rs.getInt(7);
                int manufacturerID = rs.getInt(8);
                prd.add(new Product(id, name, discription, price, amount, img, categoryID, manufacturerID));
            }
        } catch (Exception e) {
            status = "ERROR ! :" + e.getMessage();
        }

        //Category
        ctg = new Vector<Category>();
        sql = "select * from categories where isDeleted = 0";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ctg.add(new Category(rs.getInt(1), rs.getString(2), rs.getString(3)));
            }
        } catch (Exception e) {
            status = "ERROR ! :" + e.getMessage();
        }

        //Manufacturer
        mft = new Vector<Manufacturer>();
        sql = "select * from manufacturers where isDeleted = 0";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                mft.add(new Manufacturer(rs.getInt(1), rs.getString(2), rs.getString(3)));
            }
        } catch (Exception e) {
            status = "ERROR ! :" + e.getMessage();
        }

    }

    public Product getProductByID(String pid) {
        String sql = "Select * from products where ProductID = ? and [isDeleted] = 0 ";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, pid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String discription = rs.getString(3);
                int price = rs.getInt(4);
                int amount = rs.getInt(5);
                String img = rs.getString(6);
                int categoryID = rs.getInt(7);
                int manufacturerID = rs.getInt(8);
                return new Product(id, name, discription, price, amount, img, categoryID, manufacturerID);
            }
        } catch (Exception e) {
            status = "ERROR ! :" + e.getMessage();
        }
        return null;
    }

    public String getCategoryName(String cid) {
        String name = "";
        String sql = "select CategoryName from categories where CategoryID = ? and isDeleted = 0";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, cid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                name = rs.getString(1);
            }
            return name;
        } catch (Exception e) {
            status = "ERROR ! :" + e.getMessage();
        }
        return "";
    }

    public List<Product> getProductBySearch(String txt) {
        List<Product> list = new Vector<Product>();
        String sql = "select * from products  where ProductName like ? and [isDeleted] = 0  ";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + txt + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String discription = rs.getString(3);
                int price = rs.getInt(4);
                int amount = rs.getInt(5);
                String img = rs.getString(6);
                int categoryID = rs.getInt(7);
                int manufacturerID = rs.getInt(8);
                list.add(new Product(id, name, discription, price, amount, img, categoryID, manufacturerID));
            }
            return list;
        } catch (Exception e) {
            status = "ERROR ! :" + e.getMessage();
        }
        return null;
    }

    public List<Product> getProductByCID(String cid) {
        List<Product> list = new Vector<Product>();
        String sql = "select * from products p where CategoryID = ? and [isDeleted] = 0 order by ProductID desc  ";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, cid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String discription = rs.getString(3);
                int price = rs.getInt(4);
                int amount = rs.getInt(5);
                String img = rs.getString(6);
                int categoryID = rs.getInt(7);
                int manufacturerID = rs.getInt(8);
                list.add(new Product(id, name, discription, price, amount, img, categoryID, manufacturerID));
            }
            return list;
        } catch (Exception e) {
            status = "ERROR ! :" + e.getMessage();
        }
        return null;
    }

    public List<Product> getProductByMID(String mid) {
        List<Product> list = new Vector<Product>();
        String sql = "select * from products p where manufacturerID = ? and isDeleted = 0 order by productID desc  ";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, mid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String discription = rs.getString(3);
                int price = rs.getInt(4);
                int amount = rs.getInt(5);
                String img = rs.getString(6);
                int categoryID = rs.getInt(7);
                int manufacturerID = rs.getInt(8);
                list.add(new Product(id, name, discription, price, amount, img, categoryID, manufacturerID));
            }
            return list;
        } catch (Exception e) {
            status = "ERROR ! :" + e.getMessage();
        }
        return null;
    }

    public List<Manufacturer> getManufactureList() {
        Vector<Manufacturer> mft = new Vector<Manufacturer>();
        String sql = "select * from manufacturers where isDeleted = 0";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                mft.add(new Manufacturer(rs.getInt(1), rs.getString(2), rs.getString(3)));
            }
            return mft;
        } catch (Exception e) {
            status = "ERROR ! :" + e.getMessage();
        }
        return null;
    }

    public List<Order> getOrderList() {
        Vector<Order> list = new Vector<Order>();
        String sql = "select * from orders order by orderID desc;";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getBoolean(5), rs.getString(6), rs.getBoolean(7), rs.getBoolean(8)));
            }
            return list;
        } catch (Exception e) {
            status = "ERROR ! :" + e.getMessage();
        }
        return null;
    }

    public List<AccountDetail> getAccountDetail() {
        Vector<AccountDetail> list = new Vector<AccountDetail>();
        String sql = "select * from accounts order by userID desc";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                AccountDetail detail = new AccountDetail();
                detail.setId(rs.getInt(1));
                detail.setImage(rs.getString(5));
                detail.setName(rs.getString(6));
                detail.setGmail(rs.getString(7));
                detail.setPhone(rs.getString(8));
                detail.setAddress1(rs.getString(9));
                detail.setAddress2(rs.getString(10));
                list.add(detail);
            }
            return list;
        } catch (Exception e) {
            status = "ERROR ! :" + e.getMessage();
        }
        return null;
    }

    public List<Product> getProductByPriceBetween(int min, int max) {
        List<Product> list = new Vector<Product>();
        String sql = "select * from products  where price between ? and ?  and [isDeleted] = 0  ";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, min);
            ps.setInt(2, max);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String discription = rs.getString(3);
                int price = rs.getInt(4);
                int amount = rs.getInt(5);
                String img = rs.getString(6);
                int categoryID = rs.getInt(7);
                int manufacturerID = rs.getInt(8);
                list.add(new Product(id, name, discription, price, amount, img, categoryID, manufacturerID));
            }
            return list;
        } catch (Exception e) {
            status = "ERROR ! :" + e.getMessage();
        }
        return null;
    }
    //Display - Search

    //SignUp Up - Log In - Log Out
    public Account getUser(String user, String pass) {
        String sql = "select * from accounts where username = ? and password = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void SignUp(String user, String pass) {
        PreparedStatement ps;
        String sql = "insert into accounts values (?,?,0)";
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.executeUpdate();
        } catch (Exception e) {
            return;
        }

        int userID = 0;
        String sql2 = "select userID from accounts where username = ?";
        try {
            ps = con.prepareStatement(sql2);
            ps.setString(1, user);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                userID = rs.getInt(1);
            }
        } catch (Exception e) {
        }

        String sql3 = "INSERT INTO accountsDetail([userID]) VALUES (?)";
        try {
            ps = con.prepareStatement(sql3);
            ps.setInt(1, userID);
            ps.executeUpdate();

        } catch (Exception e) {
            status = "ERROR ! :" + e.getMessage();
        }

    }
    //!Sign Up - Log In - Log Out

    //CRUD
    public String deleteProductByID(String id) {
        String sql = "UPDATE products \n"
                + "SET [isDeleted] = 1\n"
                + "   WHERE [ProductID] = ? ;";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
            return "Deleted Successfully";
        } catch (Exception e) {
            return "Deleted Failed";
        }
    }

    public String addProduct(String name, String description, String price, String amount, String image, String cId, String mId) {
        String sql = "INSERT INTO products \n"
                + " ([ProductName],[Description],[Price],[Amount],[Image],[CategoryID],[ManufacturerID],[isDeleted]) \n"
                + " VALUES (?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, description);
            ps.setString(3, price);
            ps.setString(4, amount);
            ps.setString(5, image);
            ps.setString(6, cId);
            ps.setString(7, mId);
            ps.setInt(8, 0);
            ps.executeUpdate();
            return "Added Successfully";

        } catch (Exception e) {
            status = "ERROR ! :" + e.getMessage();
            return "Added Failed";
        }
    }

    public String updateProduct(String name, String description, String price, String amount, String image, String cId, String mId, String pId) {
        String sql = "UPDATE products \n"
                + "SET [ProductName] = ?,\n"
                + "   [Description] = ?,\n"
                + "   [Price] = ?,\n"
                + "   [Amount] = ? ,\n"
                + "   [Image] = ? ,\n"
                + "   [CategoryID] = ? ,\n"
                + "   [ManufacturerID] = ? \n"
                + "   WHERE ProductID = ? ;";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, description);
            ps.setString(3, price);
            ps.setString(4, amount);
            ps.setString(5, image);
            ps.setString(6, cId);
            ps.setString(7, mId);
            ps.setString(8, pId);
            ps.executeUpdate();
            return "Updated Successfully";

        } catch (Exception e) {
            status = "ERROR ! :" + e.getMessage();
            return "Updated Failed";
        }
    }

    public List<Account> getUsernameList() {
        Vector<Account> acc = new Vector<Account>();
        String sql = "select * from accounts where isAdmin = 0 order by userID desc";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                acc.add(new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4)));
            }
            return acc;
        } catch (Exception e) {
        }
        return null;
    }
    
    public List<Account> getUsernameListBySearch(String txt)  {
        Vector<Account> acc = new Vector<Account>();
        String sql = "select * from accounts where username like ? and isAdmin = 0 order by userID desc";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + txt + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                acc.add(new Account(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4)));
            }
            return acc;
        } catch (Exception e) {
        }
        return null;
    }

    public List<OrderDetail> getOrderDetails() {
        Vector<OrderDetail> list = new Vector<OrderDetail>();
        String sql = "select * from ordersDetail order by detailID desc ";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new OrderDetail(rs.getInt(2), rs.getInt(3), rs.getInt(4)));
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    public List<OrderDetail> getOrderDetailsByOID(int oID) {
        Vector<OrderDetail> list = new Vector<OrderDetail>();
        String sql = "select * from ordersDetail where orderID = ? order by detailID desc ";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, oID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new OrderDetail(rs.getInt(2), rs.getInt(3), rs.getInt(4)));
            }
            return list;
        } catch (Exception e) {
        }
        return null;
    }

    //Load every products even the "deleted"
    public List<Product> loadEveryProduct() {
        Vector<Product> prd = new Vector<Product>();
        String sql = "Select * from products order by ProductID desc";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String discription = rs.getString(3);
                int price = rs.getInt(4);
                int amount = rs.getInt(5);
                String img = rs.getString(6);
                int categoryID = rs.getInt(7);
                int manufacturerID = rs.getInt(8);
                prd.add(new Product(id, name, discription, price, amount, img, categoryID, manufacturerID));
            }
            return prd;
        } catch (Exception e) {
            status = "ERROR ! :" + e.getMessage();
        }
        return null;
    }

    public int countProductByMID(int mid) {
        String sql = "SELECT COUNT(productID)\n"
                + "FROM products\n"
                + "WHERE manufacturerID = ? and isDeleted = 0;";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, mid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public int countProductByCID(int cid) {
        String sql = "SELECT COUNT(productID)\n"
                + "FROM products\n"
                + "WHERE categoryID = ? and isDeleted = 0;";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, cid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public String addManuOrCate(String name, String image, String state) {
        String sql = "";
        switch (state) {
            case "manu" ->
                sql = "INSERT INTO manufacturers \n"
                        + " ([manufacturerName],[logo],[isDeleted]) \n"
                        + " VALUES (?,?,?)";
            case "cate" ->
                sql = "INSERT INTO categories \n"
                        + " ([categoryName],[logo],[isDeleted]) \n"
                        + " VALUES (?,?,?)";
        }
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setBoolean(3, false);
            ps.executeUpdate();
            return "Added Successfully";

        } catch (Exception e) {
            status = "ERROR ! :" + e.getMessage();
            return "Added Failed";
        }
    }

    public String deleteManuOrCateByID(String id, String state) {
        String sql = "";
        switch (state) {
            case "manu" ->
                sql = "UPDATE manufacturers \n"
                        + "SET [isDeleted] = 1\n"
                        + "   WHERE [manufacturerID] = ? ;";
            case "cate" ->
                sql = "UPDATE categories \n"
                        + "SET [isDeleted] = 1\n"
                        + "   WHERE [categoryID] = ? ;";
        }
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
            return "Deleted Successfully";
        } catch (Exception e) {
            return "Deleted Failed";
        }
    }

    public String updateManuOrCate(String name, String image, String Id, String state) {
        String sql = "";
        switch (state) {
            case "manu" ->
                sql = "UPDATE manufacturers \n"
                        + "SET [manufacturerName] = ?,\n"
                        + "   [logo] = ? \n"
                        + "   WHERE manufacturerID = ? ;";
            case "cate" ->
                sql = "UPDATE categories \n"
                        + "SET [categoryName] = ?,\n"
                        + "   [logo] = ? \n"
                        + "   WHERE categoryID = ? ;";
        }
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, Id);
            ps.executeUpdate();
            return "Updated Successfully";

        } catch (Exception e) {
            status = "ERROR ! :" + e.getMessage();
            return "Updated Failed";
        }
    }
    //!CRUD

    //Cart
    public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
        List<Cart> cartProducts = new ArrayList<Cart>();
        try {
            if (!cartList.isEmpty()) {
                for (Cart cart : cartList) {
                    String sql = "select * from products where ProductID = ?";
                    PreparedStatement ps = con.prepareStatement(sql);
                    ps.setInt(1, cart.getProductID());
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
                        Cart cartRow = new Cart();
                        cartRow.setProductID(rs.getInt(1));
                        cartRow.setProductName(rs.getString(2));
                        cartRow.setQuantity(cart.getQuantity());
                        cartRow.setPrice(rs.getInt(4));
                        cartRow.setTotalPrice(rs.getInt(4) * cart.getQuantity());
                        cartRow.setAmount(rs.getInt(5));
                        cartRow.setImage(rs.getString(6));
                        cartRow.setTaxFee(1);
                        cartProducts.add(cartRow);
                    }
                }
            }
        } catch (Exception e) {
        }
        return cartProducts;
    }

    public void insertOrder(int userID, String date, int totalPrice, String address) {

        String sql = "INSERT INTO orders \n"
                + " ([userID],[date],[totalPrice],[isDeleted],[Address],[isOrdering],[isArrived]) \n"
                + " VALUES (?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userID);
            ps.setString(2, date);
            ps.setInt(3, totalPrice);
            ps.setInt(4, 0);
            ps.setString(5, address);
            ps.setInt(6, 1);
            ps.setInt(7, 0);
            ps.executeUpdate();

        } catch (Exception e) {
        }

    }

    public String getOrderID(int userID, String date) {
        String sql = "select orderID from orders where [userID] = ? and [date] = ?";
        String name = "";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userID);
            ps.setString(2, date);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                name = rs.getString(1);
            }
            return name;
        } catch (Exception e) {
        }
        return null;
    }

    public boolean insertOrderDetail(ArrayList<Cart> cartList, String orderID, String date) {
        boolean result = false;
        for (Cart item : cartList) {
            String sql = "INSERT INTO ordersDetail \n"
                    + " ([orderID],[productID],[quantity]) \n"
                    + " VALUES (?,?,?)";
            try {
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, orderID);
                ps.setInt(2, item.getProductID());
                ps.setInt(3, item.getQuantity());
                ps.executeUpdate();
                result = true;
            } catch (Exception e) {
            }
        }
        return result;

    }

    public void updateProductAmount(ArrayList<Cart> cartList) {
        for (Cart item : cartList) {
            String sql = "UPDATE products \n"
                    + "SET [Amount] = ? \n"
                    + "WHERE [ProductID] = ?;";
            try {
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, item.getAmount() - item.getQuantity());
                ps.setInt(2, item.getProductID());
                ps.executeUpdate();

            } catch (Exception e) {
                status = "ERROR ! :" + e.getMessage();
            }
        }
    }
    //!Cart

    //User Page
    public List<Order> getOrderByUID(int uID) {
        List<Order> list = new Vector<Order>();
        String sql = "select * from orders where userID = ? order by orderID desc";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, uID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getBoolean(5), rs.getString(6), rs.getBoolean(7), rs.getBoolean(8)));
            }
            return list;
        } catch (Exception e) {
            status = "ERROR ! :" + e.getMessage();
        }
        return null;
    }

    public boolean cancelOrderByOID(int oID) {
        String sql = "UPDATE orders \n"
                + " SET [isOrdering] = 0,\n"
                + "     [isDeleted] = 1,\n"
                + "     [isArrived] = 0\n"
                + "   WHERE orderID = ? ;";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, oID);
            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            status = "ERROR ! :" + e.getMessage();
            return false;
        }
    }

    public AccountDetail getUserInfo(int uID) {
        String sql = "select * from accounts where userID = ?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, uID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                AccountDetail detail = new AccountDetail();
                detail.setId(rs.getInt(1));
                detail.setImage(rs.getString(5));
                detail.setName(rs.getString(6));
                detail.setGmail(rs.getString(7));
                detail.setPhone(rs.getString(8));
                detail.setAddress1(rs.getString(9));
                detail.setAddress2(rs.getString(10));
                return detail;
            }
        } catch (Exception e) {
            status = "ERROR ! :" + e.getMessage();
        }
        return null;
    }

    public boolean updateUserInfo(int uID, String image, String name, String gmail, String phone, String address1, String address2, String pass, String state) {
        String sql = "";
        PreparedStatement ps;
        switch (state) {
            case "profile":
                sql = "UPDATE accounts \n"
                        + " SET [image] = ?,\n"
                        + "   [name] = ?,\n"
                        + "   [gmail] = ? ,\n"
                        + "   [phone] = ? ,\n"
                        + "   [address1] = ? ,\n"
                        + "   [address2] = ? \n"
                        + "   WHERE userID = ? ;";
                try {
                    ps = con.prepareStatement(sql);
                    ps.setString(1, image);
                    ps.setString(2, name);
                    ps.setString(3, gmail);
                    ps.setString(4, phone);
                    ps.setString(5, address1);
                    ps.setString(6, address2);
                    ps.setInt(7, uID);
                    ps.executeUpdate();
                    return true;

                } catch (Exception e) {
                    status = "ERROR ! :" + e.getMessage();
                    return false;
                }

            case "password":
                sql = "UPDATE accounts \n"
                        + " SET [password] = ?\n"
                        + "   WHERE userID = ? ;";
                try {
                    ps = con.prepareStatement(sql);
                    ps.setString(1, pass);
                    ps.setInt(2, uID);
                    ps.executeUpdate();
                    return true;

                } catch (Exception e) {
                    status = "ERROR ! :" + e.getMessage();
                    return false;
                }

            default:
                return false;
        }
    }

    public List<OrderDetail> getOrderDetailByOID(int oID) {
        List<OrderDetail> details = new ArrayList<>();

        //Get ProductID , Order quanity , Product amount
        String sql = "SELECT od.productID,quantity,amount from ordersDetail od \n"
                + "JOIN orders o ON o.orderID = od.orderID\n"
                + "JOIN products p ON p.productID = od.productID\n"
                + "WHERE od.orderID = ?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, oID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetail detail = new OrderDetail();
                detail.setProductID(rs.getInt(1));
                detail.setQuantity(rs.getInt(2));
                detail.setAmount(rs.getInt(3));
                details.add(detail);
            }
            return details;
        } catch (Exception e) {
            return null;
        }
    }

    public boolean returnProductAmount(List<OrderDetail> details) {
        String sql = "";
        for (OrderDetail detail : details) {
            int amount = detail.getAmount() + detail.getQuantity();
            sql = "UPDATE products \n"
                    + "SET amount = ? \n"
                    + "WHERE productID = ?;";
            try {
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setInt(1, amount);
                ps.setInt(2, detail.getProductID());
                ps.executeUpdate();

            } catch (Exception e) {
                return false;
            }
        }
        return true;
    }
    //!User Page

    //Favorites
    public List<Product> getFavoriteProduct(int userID) {

        List<Product> list = new Vector<Product>();
        String sql = "select * from products p inner join favorites f on f.productID = p.productID where userID = ? and isDeleted = 0 order by f.ID desc";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String discription = rs.getString(3);
                int price = rs.getInt(4);
                int amount = rs.getInt(5);
                String img = rs.getString(6);
                int categoryID = rs.getInt(7);
                int manufacturerID = rs.getInt(8);
                list.add(new Product(id, name, discription, price, amount, img, categoryID, manufacturerID));
            }
            return list;
        } catch (Exception e) {
            status = "ERROR ! :" + e.getMessage();
        }
        return null;
    }

    public boolean addToFavorite(int userID, int pID) {
        String sql = "INSERT INTO favorites \n"
                + " ([userID],[productID]) \n"
                + " VALUES (?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userID);
            ps.setInt(2, pID);
            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            status = "ERROR ! :" + e.getMessage();
            return false;
        }
    }

    public boolean removeFromFavorite(int userID, int pID) {
        String sql = "DELETE FROM favorites \n"
                + " WHERE userID = ? and productID = ?;\n";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, userID);
            ps.setInt(2, pID);
            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            status = "ERROR ! :" + e.getMessage();
            return false;
        }
    }
    //!Favorites

    //Get-Set
    public List<Product> getPrd() {
        return prd;
    }

    public void setPrd(List<Product> prd) {
        this.prd = prd;
    }

    public List<Category> getCtg() {
        return ctg;
    }

    public void setCtg(List<Category> ctg) {
        this.ctg = ctg;
    }

    public List<Manufacturer> getMft() {
        return mft;
    }

    public void setMft(List<Manufacturer> mft) {
        this.mft = mft;
    }

    public Connection getCon() {
        return con;
    }

    public void setCon(Connection con) {
        this.con = con;
    }

    //    public static void main(String[] args) {
//        DAO.INS.LoadAll();
//        
//        List<Product> list = DAO.INS.getPrd();
//        for (Product product : list) {
//            System.out.println(product);
//        }
//        Account account = DAO.INS.getUser("user1", "password1");
//        System.out.println(account);
//    }
}
