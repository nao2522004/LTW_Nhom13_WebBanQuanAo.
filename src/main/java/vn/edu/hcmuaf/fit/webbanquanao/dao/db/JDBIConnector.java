package vn.edu.hcmuaf.fit.webbanquanao.dao.db;

import com.mysql.cj.jdbc.MysqlDataSource;
import org.jdbi.v3.core.Jdbi;

import java.sql.SQLException;

public class JDBIConnector {
    private Jdbi jdbi;

    public void connect() {
        MysqlDataSource ds = new MysqlDataSource();
        ds.setURL("jdbc:mysql://" + Properties.HOST + ":" + Properties.PORT + "/" + Properties.DBNAME);
        ds.setUser(Properties.USERNAME);
        ds.setPassword(Properties.PASSWORD);
        try {
            ds.setAutoReconnect(true);
            ds.setUseCompression(true);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        jdbi = Jdbi.create(ds);
    }

    public Jdbi getJdbi() {
        if(jdbi == null) connect();
        return jdbi;
    }
}