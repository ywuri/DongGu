package com.DongGu.db;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;

public class DongGuDB {
	static DataSource ds;
	
	//메모리에 그냥 올려놓으려고
	static{
		Context initContext;
		try {
			initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
	    	ds = (DataSource)envContext.lookup("jdbc/myoracle");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
	}
	
   public static Connection getConn() throws SQLException {
        if (ds == null) {
            throw new SQLException("DataSource is null.efef");
        }
        return ds.getConnection();
    }
}


