package com.qsp.repository2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.qsp.util2.ConnectionPool;

public class EmployeeRepository {

	private static final EmployeeRepository object = new EmployeeRepository();

	private EmployeeRepository() {
	}

	public static EmployeeRepository getInstance() {
		return object;
	}

	public String addEmployee(String name, String age, String phone, String email, String gender) {

		String sql = "insert into employeTable values (?,?,?,?,?)";
		Connection con = ConnectionPool.supply();

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setInt(2, Integer.parseInt(age));
			ps.setString(3, phone);
			ps.setString(4, email);
			ps.setString(5, gender);

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionPool.accept(con);
		}

		return "employee added";
	}

	public ResultSet getEmployeeByEmail(String email) throws SQLException {
		Connection con = ConnectionPool.supply();
		String sql = "select * from employeTable where email=? ";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, email);
		ResultSet rs = ps.executeQuery();
		return rs;
	}

	public ResultSet getAllEmployee() throws SQLException {
		Connection con = ConnectionPool.supply();
		String sql = "select * from employeTable";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		ConnectionPool.accept(con);
		return rs;
	}

	public void deleteEmployeeByEmail(String email) {
		try {
			Connection con = ConnectionPool.supply();
			String sql = "delete from employeTable where email=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ps.executeUpdate();
			ConnectionPool.accept(con);

		} catch (Exception e) {
			e.printStackTrace();

		}
	}

	public void updateEmployeeByEmail(String email, String ename, int eage, String phone, String egender) {

		String sql = "update employeTable set ename=?, eage=?, phone=?, egender=? where email=?";

		try {
			Connection con = ConnectionPool.supply();
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, ename);
			ps.setInt(2, eage);
			ps.setString(3, phone);
			ps.setString(4, egender);
			ps.setString(5, email);

			ps.executeUpdate();
			ConnectionPool.accept(con);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
