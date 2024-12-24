package vn.edu.hcmuaf.fit.webbanquanao.dao.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConn {
    static final String URL = "jdbc:mysql://localhost:3306/clothes_shop_db";
    static final String USER = "root";
    static final String PASS = "";

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(URL, USER, PASS);
    }
}
