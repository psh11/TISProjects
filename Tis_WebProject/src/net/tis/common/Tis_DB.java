package net.tis.common;

import java.sql.Connection;
import java.sql.DriverManager;

public class Tis_DB {

	public static Connection getConnection() {
		Connection CN = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
			CN = DriverManager.getConnection(url, "system","1234");
		} catch (Exception e) { System.out.println("db.java ����" + e.toString());  }
		return CN;
	}
}