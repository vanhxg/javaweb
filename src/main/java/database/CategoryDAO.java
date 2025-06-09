package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Brand;
import model.Category;

public class CategoryDAO implements DAOInterface<Category>{
	//private ArrayList<Category> data = new ArrayList<>();
	
	@Override
	public ArrayList<Category> selectAll() {
		ArrayList<Category> ketQua = new ArrayList<Category>();
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "SELECT * FROM category";
			PreparedStatement st = con.prepareStatement(sql);

			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ResultSet rs = st.executeQuery();

			// Bước 4: xử lý kết quả 
			while (rs.next()) {
				String categoryId = rs.getString("categoryid");
				String categoryName = rs.getString("categoryname");

				Category category = new Category(categoryId, categoryName);
				ketQua.add(category);
			}

			// Bước 5: ngắt kết nối
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ketQua;
	}

	@Override
	public Category selectById(Category t) {
		Category ketQua = null;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "SELECT * FROM category WHERE categoryid=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getCategoryId());

			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ResultSet rs = st.executeQuery();

			// Bước 4: xử lý kết quả 
			while (rs.next()) {
				String categoryId = rs.getString("categoryid");
				String categoryName = rs.getString("categoryname");

				ketQua = new Category(categoryId, categoryName);
				break;
			}
			// Bước 5: ngắt kết nối
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ketQua;
	}

	@Override
	public int insert(Category t) {
		int ketQua = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();
			
			// Bước 2: tạo ra đối tượng statement
			String sql = "INSERT INTO category (categoryid, categoryname) "+
					" VALUES (?,?)";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getCategoryId());
			st.setString(2, t.getCategoryName());
			
			// Bước 3: thực thi câu lệnh SQL
			ketQua = st.executeUpdate();
			
			// Bước 4:
			System.out.println("Bạn đã thực thi: "+ sql);
			System.out.println("Có "+ ketQua+" dòng bị thay đổi!");
			
			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ketQua;
	}

	@Override
	public int insertAll(ArrayList<Category> arr) {
		int count = 0;
		for (Category category : arr) {
			count+=this.insert(category);
		}
		return count;
	}

	@Override
	public int delete(Category t) {
		int ketQua = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();
			
			// Bước 2: tạo ra đối tượng statement
			String sql = "DELETE from category "+
					 " WHERE categoryid=?";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getCategoryId());
			
			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ketQua = st.executeUpdate();
			
			// Bước 4:
			System.out.println("Bạn đã thực thi: "+ sql);
			System.out.println("Có "+ ketQua+" dòng bị thay đổi!");
			
			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ketQua;
	}

	@Override
	public int deleteAll(ArrayList<Category> arr) {
		int count = 0;
		for (Category category : arr) {
			count += this.delete(category);
		}
		return count;
	}

	@Override
	public int update(Category t) {
		int ketQua = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();
			
			// Bước 2: tạo ra đối tượng statement
			String sql = "UPDATE category "+
					 " SET " +
					 " categoryname=?"+
					 " WHERE categoryid=?";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getCategoryId());
			st.setString(2, t.getCategoryName());
			// Bước 3: thực thi câu lệnh SQL

			System.out.println(sql);
			ketQua = st.executeUpdate();
			
			// Bước 4:
			System.out.println("Bạn đã thực thi: "+ sql);
			System.out.println("Có "+ ketQua+" dòng bị thay đổi!");
			
			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ketQua;
	}
	
//	public static void main(String[] args) {
//		CategoryDAO cd = new CategoryDAO();
//		ArrayList<Category> kq = cd.selectAll();
//		for (Category category : kq) {
//			System.out.println(category.toString());
//		}
//
//		 
//	}
	
}
